import os

import pandas as pd
import psycopg2 as pg

from dotenv import load_dotenv

load_dotenv()

DB_NAME = os.getenv('DATABASE')
DB_USER = os.getenv('USER_DATABASE')
DB_PASSWORD = os.getenv('PW_DATABASE')
DB_HOST = os.getenv('HOST_DATABASE')

conn = pg.connect(
    dbname=DB_NAME, user=DB_USER, password=DB_PASSWORD, host=DB_HOST
)

cursor = conn.cursor()

cursor.execute('SELECT version();')
db_version = cursor.fetchone()
print(db_version)

cursor.close()
conn.close()