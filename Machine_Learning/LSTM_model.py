

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
 
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from xgboost import XGBClassifier
from sklearn import metrics
 
#import warnings
#warnings.filterwarnings('ignore')

df = pd.read_csv(r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Public\Machine_Learning\AAPL.csv')
#print(df.head())

plt.plot(df['Date'],df['Close'])
plt.xlabel("Date")
plt.ylabel("Close")
plt.title("Apple Stock Prices")
plt.show()

close_data = df.filter(['Close'])
dataset = close_data.values
training = int(np.ceil(len(dataset) * .95))
print(training)