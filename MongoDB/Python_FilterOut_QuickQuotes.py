from pymongo import MongoClient
import pandas as pd
import re

client = MongoClient('mongodb://localhost:27017/')

db = client["eVA"]
collection = db["eVA_Awarded"]

query = {"doccddesc": {"$ne": "Quick Quote"}}

results = collection.find(query) 

def remove_objectid(doc):
    if isinstance(doc, dict):
        for key, value in doc.items():
            if isinstance(value, str):
                match = re.match(r'ObjectId\("(.*)"\)', value)
                if match:
                    # Replace the original value with the extracted ID
                    doc[key] = match.group(1)
    print(doc)
    return doc

cleaned_data = remove_objectid(results)
df = pd.DataFrame(cleaned_data)
print(df)
