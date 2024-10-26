from pymongo import MongoClient
import pandas as pd
import re

client = MongoClient('mongodb://localhost:27017/')

db = client["eVA"]  # Replace with your DB name
collection = db["eVA_Awarded"]  # Replace with your collection name

#query = {"AwardeeContact": {"$ne": "TBD"}}
#query = {"AwardeeContact": "TBD"}
query = {}

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

# Remove ObjectId wrapper from the dictionary
cleaned_data = remove_objectid(results)
df = pd.DataFrame(cleaned_data)
print(df)
