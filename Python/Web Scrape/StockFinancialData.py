import pandas as pd
import requests
import os
import time
import io
from datetime import datetime as dt
from bs4 import BeautifulSoup as bs

dirname = r"C:\Users\Owner\OneDrive - SOLLUS\Personal\Investing\Dashboard"
filename = "\PythonInputs.xlsx"
outputname = "\Data\TickerOutput.xlsx"
ticker = dirname + filename
ticker = pd.read_excel(ticker, sheet_name='Ticker')
newticker = ticker['Ticker'].to_list()

print(newticker)

def getdata(url):
  r = requests.get(url,headers ={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'})
  data = pd.read_html(io.StringIO(r.text), attrs={'class': 'snapshot-table2'}, flavor='html5lib')
  return data

def getdatayahoo(url):
  r = requests.get(url,headers ={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'})
  data_yahoo = pd.read_html(io.StringIO(r.text), attrs={'class': 'W(100%) M(0) Bdcl(c)'}, flavor='html5lib')
  return data_yahoo

def getoption(url):
  r = requests.get(url,headers ={'User-Agent':'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36'})
  #data_option = pd.read_html(io.StringIO(r.text), attrs={'class': 'W(100%) M(0) Bdcl(c)'}, flavor='html5lib')
  return r

tickerdata = pd.DataFrame()
for i in newticker:
    try:
        summary_url = f'https://finviz.com/quote.ashx?t={i}'
        summary_data = getdata(summary_url)
        #print(summary_data) #this is not being printed
        data = pd.concat(summary_data)
        data1 = data.iloc[:,:2]
        data1.columns = ['Metric', 'Value']
        data2 = data.iloc[:,2:4]
        data2.columns = ['Metric', 'Value']
        data3 = data.iloc[:,4:6]
        data3.columns = ['Metric', 'Value']
        data4 = data.iloc[:,6:8]
        data4.columns = ['Metric', 'Value']
        data5 = data.iloc[:,8:10]
        data5.columns = ['Metric', 'Value']
        data6 = data.iloc[:,10:12]
        data6.columns = ['Metric', 'Value']
        data = pd.concat([data1,data2,data3,data4,data5,data6])
        data['Ticker'] = i
        data = data[['Ticker','Metric','Value']]
        data['Value'] = data['Value'].replace('%','', regex=True)
        data['Value'] = data['Value'].apply(pd.to_numeric,errors='ignore')
        data = pd.pivot_table(data, 'Value', 'Ticker','Metric', aggfunc='first')
        '''summary_url_yahoo = f'https://finance.yahoo.com/quote/{i}'
        summary_data_yahoo = getdatayahoo(summary_url_yahoo)
        data_yahoo = pd.concat(summary_data_yahoo)
        data_yahoo = data_yahoo.iat[6,1]
        data['ExDividend Date'] = data_yahoo
        option_url_yahoo = f'https://finance.yahoo.com/quote/{i}/options'
        option_data_yahoo = getoption(option_url_yahoo)
        data_option = bs(option_data_yahoo.text, 'html.parser')
        data_option = data_option.findAll('option')
        data['WeeklyOpt'] = data_option[0].text
        data['Timestamp'] = dt.now()
        
        print(data)'''
        tickerdata = pd.concat([tickerdata,data])
        time.sleep(1)

    except:
        print("Didn't work")
        pass

print(tickerdata)
dataoutput = dirname + outputname
tickerdata.to_excel(dataoutput, sheet_name='zTickerData')

print("Done")
