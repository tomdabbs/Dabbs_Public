
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt

input = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Statistical_Analysis\StoreDemand.xlsx'

storeinfo = pd.read_excel(input, sheet_name='StoreDemand')

dfstats = storeinfo.groupby(['State','Product'])['StoreDemand'].describe()
print(dfstats)

# Histogram = State and Product specific
storeinfo['StoreDemand'].plot(kind='hist', bins=10, edgecolor='black')
plt.title('Histogram Plot')
plt.xlabel('Values')
plt.ylabel('Frequency')
plt.show()

# Histogram = State and Product specific
state = "AL"
product = "FRUIT"
df = storeinfo[(storeinfo['State'] == state) & (storeinfo['Product'] == product)]
df.plot(kind='hist', y='StoreDemand', bins=10, edgecolor='black')
plt.title('Histogram of ' + state + ' - ' + product)
plt.show()





                        