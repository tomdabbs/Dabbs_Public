
import pandas as pd
import numpy as np
from scipy import stats
import matplotlib.pyplot as plt

df = pd.read_csv(r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Main\Stat_Analysis\GDP.csv', encoding='latin-1')
print(df)

df['x1'] = df['DATE'].str[:4]
print(df)
df['x1'] = df['x1'].astype(int)
x = df['x1'].to_list()
print(x)
x = np.array(x)
y = df['GDP'].to_list()
y = np.array(y)
print(x)
print(y)

# Perform linear regression
slope, intercept, r_value, p_value, std_err = stats.linregress(x, y)

# Print the results
print(f"Slope: {slope}")
print(f"Intercept: {intercept}")
print(f"R-squared: {r_value**2}")
print(f"P-value: {p_value}")
print(f"Standard error: {std_err}")

# Plot the data along with the regression line
plt.scatter(x, y, color='blue', label='Data points')
plt.plot(x, slope*x + intercept, color='red', label='Fitted line')
plt.xlabel('x')
plt.ylabel('y')
plt.legend()
plt.show()