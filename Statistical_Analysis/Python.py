
import datetime
import matplotlib.pyplot
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt

input = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Statistical_Analysis\StoreDemand.xlsx'

storeinfo = pd.read_excel(input, sheet_name='StoreDemand')

dfstats = storeinfo.groupby(['State','Product'])['StoreDemand'].describe()
print(dfstats)

storeinfo['StoreDemand'].plot(kind='hist', bins=10, edgecolor='black')
plt.title('Histogram Plot')
plt.xlabel('Values')
plt.ylabel('Frequency')
plt.show()


state = "AL"
product = "FRUIT"
df = storeinfo[(storeinfo['State'] == state) & (storeinfo['Product'] == product)]

# Histogram
df.plot(kind='hist', y='StoreDemand', bins=10, edgecolor='black')
plt.title('Histogram of ' + state + product)
plt.show()

'''x = storeinfo.hist(column='StoreDemand', by=storeinfo['State','Product'])

plt.hist(x)
plt.show()'''



                        