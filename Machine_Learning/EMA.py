
import pandas as pd
import matplotlib.pyplot as plt

input = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Main\ML\AAPL.csv'
df = pd.read_csv(input)

span = 10  
df['EMA'] = df['Close'].ewm(span=span, adjust=False).mean()

plt.figure(figsize=(10, 6))
plt.plot(df['Date'], df['Close'], label='Original Data', marker='o')
plt.plot(df['Date'], df['EMA'], label=f'EMA ({span}-day)', linestyle='--', color='orange', marker='o')
plt.title('Exponential Moving Average (EMA)')
plt.xlabel('Day')
plt.ylabel('Close')
plt.legend()
plt.show()