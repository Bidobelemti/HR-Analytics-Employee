import os

import psycopg2 as pg

from dotenv import load_dotenv
load_dotenv()

DB_NAME = os.getenv('DATABASE')
DB_USER = os.getenv('USER_DATABASE')
DB_PASSWORD = os.getenv('PW_DATABASE')
DB_HOST = os.getenv('HOST_DATABASE')
PORT = '5432'
SOURCE_DATA = 'Data/01-bronze/WA_Fn-UseC_-HR-Employee-Attrition.csv'

# 1. Creación de conexión a DB
conn = pg.connect(
    dbname=DB_NAME, 
    user=DB_USER, 
    password=DB_PASSWORD, 
    host=DB_HOST,
    port=PORT
)
cursor = conn.cursor()

# 2. Definición de query de creación de tablas a nivel bronce
query_bronze_em_attrition = """
CREATE SCHEMA IF NOT EXISTS bronze;

CREATE TABLE IF NOT EXISTS bronze.employee_attrition (
    Age INTEGER,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(100),
    DailyRate INTEGER,
    Department VARCHAR(50),
    DistanceFromHome INTEGER,
    Education INTEGER,
    EducationField VARCHAR(50),
    EmployeeCount INTEGER,
    EmployeeNumber INTEGER, -- Sirve como PK
    EnvironmentSatisfaction INTEGER,
    Gender VARCHAR(10),
    HourlyRate VARCHAR(5),
    JobInvolvement INTEGER,
    JobLevel INTEGER,
    JobRole VARCHAR(50),
    JobSatisfaction INTEGER,
    MaritalStatus VARCHAR(50),
    MonthlyIncome INTEGER,
    MonthlyRate INTEGER,
    NumCompaniesWorked INTEGER,
    Over18 VARCHAR(10),
    OverTime VARCHAR(10),
    PercentSalaryHike INTEGER,
    PerformanceRating INTEGER,
    RelationshipSatisfaction INTEGER,
    StandardHours INTEGER,
    StockOptionLevel INTEGER,
    TotalWorkingYears INTEGER,
    TrainingTimesLastYear INTEGER,
    WorkLifeBalance INTEGER,
    YearsAtCompany INTEGER,
    YearsInCurrentRole INTEGER,
    YearsSinceLastPromotion INTEGER,
    YearsWithCurrManager INTEGER
)
"""

cursor.execute(query_bronze_em_attrition)

# 3.Ingesta de datos a capa bronze
cursor.execute("TRUNCATE TABLE bronze.employee_attrition;")

with open(SOURCE_DATA, 'r') as file:
    sql_copy = "COPY bronze.employee_attrition FROM STDIN WITH CSV HEADER"
    cursor.copy_expert(sql=sql_copy, file=file)

conn.commit()
cursor.close()
conn.close()