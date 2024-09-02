import requests
from urllib.parse import unquote
import pandas as pd
import datetime
from pytz import timezone

dirname = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Python_APIconnect'  
filename = '\PythonInputs.xlsx'
outputname = '\OptionsUnusualOutput.xlsx'

headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:90.0) Gecko/20100101 Firefox/90.0",}


def main(url):
    with requests.Session() as req:
        req.headers.update(headers)
        r = req.get(url[:25])
        req.headers.update(
            {'X-XSRF-TOKEN': unquote(r.cookies.get_dict()['XSRF-TOKEN'])})
        params = {
            "fields":"baseSymbol,baseLastPrice,baseSymbolType,symbolType,strikePrice,expirationDate,daysToExpiration,bidPrice,midpoint,askPrice,lastPrice,volume,openInterest,volumeOpenInterestRatio,volatility,delta,tradeTime",
            "orderBy":"volumeOpenInterestRatio",
            "orderDir":"desc",
            "baseSymbolTypes":"stock",
            "between(volumeOpenInterestRatio,1.24,)":"",
            "between(lastPrice,.10,)":"",
            "between(tradeTime,today,tomorrow)":"",
            "between(volume,500,)":"",
            "between(openInterest,100,)":"",
            "in(exchange,(AMEX,NASDAQ,NYSE))":"",
            "meta":"field.shortName,field.type",
            "hasOptions": "true",
            "page": "1",
            "limit": "500",
            "raw": "1"
        }
        r = req.get(url, params=params).json()
        df = pd.DataFrame(r['data']).iloc[:, :-1]
        #print(df)
        if df.empty:
            print('Dataframe is empty - potential holiday')
            #pass
        else:
            dataoutput = dirname + outputname
            df.to_excel(dataoutput, sheet_name='zUnusualOptionsData')


dayofweek = datetime.datetime.today()
fmt = "%H:%M"
now_time = datetime.datetime.now(timezone('US/Eastern'))
t = now_time.strftime(fmt)
print(t)
if t >= '01:00' and t <= '10:00':
    print('Not in time frame')
else:
    if dayofweek.weekday() == 0 or dayofweek.weekday() == 1 or dayofweek.weekday() == 2 or dayofweek.weekday()== 3:
        today = str(datetime.date.today()) # - datetime.timedelta(1)) This needs to be on a weekday
        tomorrow = str(datetime.date.today() + datetime.timedelta(1)) #This needs to land on a weekday
        main('https://www.barchart.com/proxies/core-api/v1/options/get?')
        print('Weekday')
    elif dayofweek.weekday() == 4:
        today = str(datetime.date.today()) # - datetime.timedelta(1)) This needs to be on a weekday
        tomorrow = str(datetime.date.today() + datetime.timedelta(3)) #This needs to land on a weekday
        main('https://www.barchart.com/proxies/core-api/v1/options/get?')
        print('Friday')
    else:
        print('Weekend')
        pass

