
import pandas as pd
import numpy as np
import tensorflow as tf
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler, OneHotEncoder
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.metrics import mean_squared_error

# Load your dataset
data = pd.read_csv('car_data.csv')

# Select relevant columns
features = ['make', 'model', 'year', 'mileage', 'condition']
target = 'price'

# Split the data into input (X) and output (y)
X = data[features]
y = data[target]

# Preprocessing: One-hot encode categorical data, and scale numeric data
preprocessor = ColumnTransformer(transformers=[
    ('num', StandardScaler(), ['year', 'mileage']),
    ('cat', OneHotEncoder(), ['make', 'model', 'condition'])
])

# Split the data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Create a preprocessing and modeling pipeline
model_pipeline = Pipeline(steps=[
    ('preprocessor', preprocessor),
    ('model', tf.keras.Sequential([
        tf.keras.layers.Dense(128, activation='relu', input_shape=[X_train.shape[1]]),
        tf.keras.layers.Dense(64, activation='relu'),
        tf.keras.layers.Dense(1)
    ]))
])

# Compile the model
model_pipeline.named_steps['model'].compile(optimizer='adam', loss='mse')

# Train the model
history = model_pipeline.named_steps['model'].fit(X_train, y_train, epochs=10, validation_split=0.2)

# Predict on the test set
y_pred = model_pipeline.named_steps['model'].predict(X_test)

# Evaluate the model performance
mse = mean_squared_error(y_test, y_pred)
print(f'Mean Squared Error: {mse}')
