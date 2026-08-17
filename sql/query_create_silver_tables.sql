-- Creación de tabla silver
CREATE SCHEMA IF NOT EXISTS silver;

DROP TABLE IF EXISTS silver.employee_attrition_clean;
-- Limpieza de datos se puede realizar al momento de crear la tabla en la capa silver
-- entre las sentencias SELECT y FROM, esto lo puede terminar simplificando incluso probando mediante el uso de
-- sentencias SELECT - FROM - para obtener una forma de visualizar lo que esperamos
CREATE TABLE silver.employee_attrition_clean AS SELECT
	EmployeeNumber AS Id_Employee,
	Education AS id_education,
	EnvironmentSatisfaction AS id_environment_satisfaction,
	JobInvolvement AS id_job_involvement,
	JobSatisfaction AS id_job_satisfaction,
	PerformanceRating AS id_performance_rating,
	RelationshipSatisfaction AS id_relationship_satisfaction,
	WorkLifeBalance AS id_work_life_balance,
	Age,
	Attrition,
	REPLACE(REPLACE(BusinessTravel, '_', ' '), '-', ' ') AS business_travel,
	DailyRate AS daily_rate,
	Department,
	DistanceFromHome AS distance_from_home,
	EducationField AS education_field,
	Gender,
	HourlyRate AS hourly_rate,
	JobLevel AS job_level,
	JobRole AS job_role,
	MaritalStatus AS marital_status,
	MonthlyIncome AS monthly_income,
	MonthlyRate AS monthly_rate,
	NumCompaniesWorked AS num_companies_worked,
	OverTime AS over_time,
	PercentSalaryHike AS percent_salary_hike,
	StockOptionLevel AS stock_option_level,
	TotalWorkingYears AS total_working_years,
	TrainingTimesLastYear AS training_times_last_year,
	YearsAtCompany AS years_at_company,
	YearsInCurrentRole AS years_in_current_role,
	YearsSinceLastPromotion AS years_since_last_promotion,
	yearsWithCurrManager AS years_with_curr_manager
FROM bronze.employee_attrition
WHERE EmployeeNumber IS NOT NULL;

-- Establecemos primary key

ALTER TABLE silver.employee_attrition_clean
ADD PRIMARY KEY (Id_Employee);

-- Validamos
SELECT * FROM silver.employee_attrition_clean;