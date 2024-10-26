import pymongo

client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["eVA"]
collection = db["eVA_Awarded"]

# Fields you want to add, but only if they don't exist
new_fields = {
    "AwardeeName": "TBD",
    "AwardeeContact": "TBD",
    "AwardeeAdditional": "TBD",
    "SOLLUScontacted": "TBD",
    "SOLLUSstatus": "TBD",
    "SOLLUScomments": "TBD",
}

# Initialize counters
fields_checked_count = 0
fields_updated_count = 0

# Loop through each new field and add it only if it doesn't exist
for field, default_value in new_fields.items():
    # Use $exists to check if the field exists
    filter = {field: {"$exists": False}}
    
    # Only set the field if it doesn't exist
    update = {"$set": {field: default_value}}
    
    # Update the documents where the field is missing
    result = collection.update_many(filter, update)
    
    # Increment counters
    fields_checked_count += 1  # Count the field being checked
    if result.modified_count > 0:
        fields_updated_count += 1  # Count the field being updated if any documents were modified

# Output the counts
print(f"Fields checked: {fields_checked_count}")
print(f"Fields updated: {fields_updated_count}")

client.close()
