
import pandas as pd
from pymongo import MongoClient
import requests
import json
from bs4 import BeautifulSoup as bs
from datetime import datetime
import numpy as np

output = r'C:\Users\Owner\OneDrive - SOLLUS\Personal\Documents\GitHub\Dabbs_Main\WebScrape\output.xlsx'
url = 'https://mvendor.cgieva.com/Vendor/public/solrconnect.jsp?q=*:*&fq=status%3A(%22Awarded%22)&fq=pubdate%3A%5BNOW%2FMONTH-1MONTH%2FMONTH%20TO%20NOW%5D&sort=pubdate%20desc,id%20desc&facet.field=status&facet.field=agencyname&facet.field=doccddesc&facet.field=category&facet.field=setasideshortdesc&facet.field=pubdate&facet.field=closedate&facet.field=sosearch&f.setasideshortdesc.facet.sort=index&rows=200&facet.limit=600&facet.sort=count&facet=on&wt=json&cursorMark=*'
response = requests.get(url)
soup = bs(response.content,'html.parser')

json_data = str(soup)  
#print(soup)

try:
    data = json.loads(json_data)
except json.JSONDecodeError as e:
    print("Failed to parse JSON:", e)
    exit(1)

num_found = data['response']['numFound']
print(f"Number of documents found: {num_found}")

facet_fields = data['responseHeader']['params']['facet.field']
print("Facet Fields:", facet_fields)

docs = data['response']['docs']
docsdf = pd.DataFrame(docs)
docsdf = docsdf.replace({np.nan:None})
print(docsdf)

client = MongoClient(r'mongodb://localhost:27017/') 
db = client["eVA"] 
collection = db["eVA_Awarded"]

reviewed_count = 0
updated_count = 0
added_count = 0

for index, row in docsdf.iterrows():
    reviewed_count += 1  # Increment for each row reviewed
    query = {'externalid': row['externalid']}
    existing_doc = collection.find_one(query)    
    if existing_doc:
        # Document exists, update it
        result = collection.update_one(query, {'$set': row.to_dict()})
        if result.modified_count > 0:
            updated_count += 1  # Increment for updated rows
    else:
        # Document doesn't exist, insert (upsert) it
        collection.update_one(query, {'$set': row.to_dict()}, upsert=True)
        added_count += 1  # Increment for added rows

# Output the counts
print(f"Rows reviewed: {reviewed_count}")
print(f"Rows updated: {updated_count}")
print(f"Rows added: {added_count}")
print("Data upserted successfully!")
