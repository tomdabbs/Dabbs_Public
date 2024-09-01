import pandas as pd
from sqlalchemy import create_engine

sheet = 'SalesOrderHeader'
#df = pd.read_csv(r'C:\Filepath\Filename.csv', encoding='latin-1')
#df = pd.read_parquet(r'C:\Filepath\Filename.parquet')
df = pd.read_excel(r'C:\Filepath\Filename.xls',sheet_name=sheet)
engine = create_engine('postgresql://username:password@host:port/database')
df.to_sql(sheet, engine, if_exists='replace', index=False)
print('Done: '+sheet)