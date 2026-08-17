-- Queries de análisis

-- Imprime los 10 primeros resultados
SELECT *
FROM bronze.employee_attrition
LIMIT 10;

-- Obtener el total de filas (registros)
SELECT COUNT(*)
FROM bronze.employee_attrition; --Total 1470 registros

-- Obtener cantidad de valores nulos en columnas
SELECT 
	SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS nulos_edad, 
	SUM(CASE WHEN attrition IS NULL THEN 1 ELSE 0 END) as nulos_deserte
FROM bronze.employee_attrition;

SELECT 
    COUNT(*) - COUNT(Age) AS nulos_Age,													
    COUNT(*) - COUNT(Attrition) AS nulos_Attrition,										
    COUNT(*) - COUNT(BusinessTravel) AS nulos_BusinessTravel,							
    COUNT(*) - COUNT(DailyRate) AS nulos_DailyRate,
    COUNT(*) - COUNT(Department) AS nulos_Department,
    COUNT(*) - COUNT(DistanceFromHome) AS nulos_DistanceFromHome,
    COUNT(*) - COUNT(Education) AS nulos_Education,
    COUNT(*) - COUNT(EducationField) AS nulos_EducationField,
    COUNT(*) - COUNT(EmployeeCount) AS nulos_EmployeeCount, -- descartar
    COUNT(*) - COUNT(EmployeeNumber) AS nulos_EmployeeNumber, -- Primary Key
    COUNT(*) - COUNT(EnvironmentSatisfaction) AS nulos_EnvironmentSatisfaction,
    COUNT(*) - COUNT(Gender) AS nulos_Gender,
    COUNT(*) - COUNT(HourlyRate) AS nulos_HourlyRate,
    COUNT(*) - COUNT(JobInvolvement) AS nulos_JobInvolvement,
    COUNT(*) - COUNT(JobLevel) AS nulos_JobLevel,
    COUNT(*) - COUNT(JobRole) AS nulos_JobRole,
    COUNT(*) - COUNT(JobSatisfaction) AS nulos_JobSatisfaction,
    COUNT(*) - COUNT(MaritalStatus) AS nulos_MaritalStatus,
    COUNT(*) - COUNT(MonthlyIncome) AS nulos_MonthlyIncome,
    COUNT(*) - COUNT(MonthlyRate) AS nulos_MonthlyRate,
    COUNT(*) - COUNT(NumCompaniesWorked) AS nulos_NumCompaniesWorked,
    COUNT(*) - COUNT(Over18) AS nulos_Over18, -- descartar
    COUNT(*) - COUNT(OverTime) AS nulos_OverTime,
    COUNT(*) - COUNT(PercentSalaryHike) AS nulos_PercentSalaryHike,
    COUNT(*) - COUNT(PerformanceRating) AS nulos_PerformanceRating,
    COUNT(*) - COUNT(RelationshipSatisfaction) AS nulos_RelationshipSatisfaction,
    COUNT(*) - COUNT(StandardHours) AS nulos_StandardHours, -- descartar
    COUNT(*) - COUNT(StockOptionLevel) AS nulos_StockOptionLevel,
    COUNT(*) - COUNT(TotalWorkingYears) AS nulos_TotalWorkingYears,
    COUNT(*) - COUNT(TrainingTimesLastYear) AS nulos_TrainingTimesLastYear,
    COUNT(*) - COUNT(WorkLifeBalance) AS nulos_WorkLifeBalance,
    COUNT(*) - COUNT(YearsAtCompany) AS nulos_YearsAtCompany,
    COUNT(*) - COUNT(YearsInCurrentRole) AS nulos_YearsInCurrentRole,
    COUNT(*) - COUNT(YearsSinceLastPromotion) AS nulos_YearsSinceLastPromotion,
    COUNT(*) - COUNT(YearsWithCurrManager) AS nulos_YearsWithCurrManager
FROM bronze.employee_attrition;

-- Para cada una de las columnas entender su distribución y relevancia para caracterizar un subgrupo posible
SELECT over18, COUNT(*) as Cantidad -- over18 no relevante
FROM bronze.employee_attrition
GROUP BY over18
ORDER BY cantidad DESC;

SELECT age, COUNT(*) as Edad
FROM bronze.employee_attrition
GROUP BY age
ORDER BY Edad ASC;

SELECT Attrition, COUNT(*) as Deserte
FROM bronze.employee_attrition
GROUP BY Attrition
ORDER BY Deserte ASC;

SELECT BusinessTravel, COUNT(*) AS Viajes
FROM bronze.employee_attrition
GROUP BY BusinessTravel
ORDER BY Viajes ASC

SELECT , COUNT(*) AS Viajes
FROM bronze.employee_attrition
GROUP BY BusinessTravel
ORDER BY Viajes ASC

-- Esto podemos seguir haciendolo para todos, una alternativa es el uso de un visualizador como el que posee Power Query
-- o como se puede hacer con display() de un notebook de Spark en Databricks o Fabric

SELECT 
    MIN(Age) as edad_minima,
    MAX(Age) as edad_maxima,
    ROUND(AVG(Age), 0) as edad_promedio,
    MIN(MonthlyIncome) as ingreso_minimo,
    MAX(MonthlyIncome) as ingreso_maximo
FROM bronze.employee_attrition;