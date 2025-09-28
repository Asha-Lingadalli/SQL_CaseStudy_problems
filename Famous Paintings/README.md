# Famous Paintings Database Project

A project demonstrating data ingestion, transformation, and SQL querying using a famous paintings dataset from Kaggle. This project includes CSV data files, a Python script to load them into PostgreSQL, and SQL queries to analyze the dataset.

---

## 📂 Dataset

The dataset was downloaded from [Kaggle: Famous Paintings](https://www.kaggle.com/datasets). It includes the following CSV files:

| File | Description |
|------|-------------|
| `artist.csv` | Information about painting artists |
| `canvas_size.csv` | Dimensions of painting canvases |
| `image_link.csv` | Links to painting images |
| `museum.csv` | Museum details (name, city, state, country) |
| `museum_hours.csv` | Museum opening and closing hours per day |
| `product_size.csv` | Painting product dimensions |
| `subject.csv` | Painting subjects/themes |
| `work.csv` | Painting work details |

---

## 🐍 Python Script: Loading Data into PostgreSQL

A Python script `Python_script.py` is included to automate CSV ingestion:

```python
import pandas as pd
from sqlalchemy import create_engine

# Database connection
conn_string = 'postgresql://postgres:admin@localhost/painting'
engine = create_engine(conn_string)
conn = engine.connect()

# Load CSVs
csv_files = ['artist.csv', 'canvas_size.csv', 'image_link.csv',
             'museum.csv', 'museum_hours.csv', 'product_size.csv',
             'subject.csv', 'work.csv']

for file in csv_files:
    df = pd.read_csv(f'/path/to/{file}')
    table_name = file.replace('.csv','')
    df.to_sql(table_name, con=conn, if_exists='replace', index=False)
    print(f'{table_name} loaded successfully.')

## 🏗️ Database Schema

The following tables have been created in **PostgreSQL**:

- `artist`
- `canvas_size`
- `image_link`
- `museum`
- `museum_hours`
- `product_size`
- `subject`
- `work`

### Primary Keys & Relationships (Simplified)

- `museum_hours.museum_id` → `museum.museum_id`  
- `work.artist_id` → `artist.artist_id`  
- `work.museum_id` → `museum.museum_id`  

## Project Highlights

-- Full ETL pipeline: CSV → PostgreSQL using Python.
--Database design: Tables with primary keys and foreign key relationships.
--SQL analytical queries: Real-world examples (museum timings, country/city aggregation).
--Data transformation: Handles timestamps, aggregation, and ranking.
--Clean, professional structure ready for GitHub portfolio.


##📝 Topics Covered

--Data ingestion with Python & Pandas
--Database creation in PostgreSQL
--Table relationships and foreign keys
--SQL GROUP BY, HAVING, RANK, STRING_AGG
--Timestamp conversion and duration calculation
--Query optimization and data aggregation