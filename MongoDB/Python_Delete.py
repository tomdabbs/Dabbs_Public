from pymongo import MongoClient

client = MongoClient('mongodb://localhost:27017/')

db = client["eVA"]  # Replace with your DB name
collection = db["eVA_Awarded"]  # Replace with your collection name

# Delete all documents from the collection
result = collection.delete_many({})

print(f'{result.deleted_count} documents deleted.')