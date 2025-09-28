
from sqlalchemy import create_engine
from sqlalchemy.engine import URL
import pandas as pd

url = URL.create(
    drivername="postgresql+psycopg2",
    username="postgres",
    password="Asha@123",   # no need to encode
    host="localhost",
    port=5432,
    database="painting"
)

engine = create_engine(url)
#create loop to load all the files at at time by creating list

files=['artist','canvas_size','image_link','museum_hours','museum','product_size','subject','work']

for file in files:
    df=pd.read_csv(f'/Users/kiranlingadalli/Downloads/Famous_paintings/{file}.csv')
    df.to_sql(file,con=engine,if_exists='replace',index=False)
