-- creación de tablas gold
CREATE SCHEMA IF NOT EXISTS gold;

--------------------------------------------------------
-- 1. Dimensión: Education
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_education CASCADE;

CREATE TABLE gold.dim_education (
    id_education INTEGER PRIMARY KEY,
    education_level VARCHAR(50)
);

INSERT INTO gold.dim_education (id_education, education_level) VALUES
(1, 'Below College'),
(2, 'College'),
(3, 'Bachelor'),
(4, 'Master'),
(5, 'Doctor');


--------------------------------------------------------
-- 2. Dimensión: Environment Satisfaction
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_environment_satisfaction CASCADE;

CREATE TABLE gold.dim_environment_satisfaction (
    id_environment_satisfaction INTEGER PRIMARY KEY,
    satisfaction_level VARCHAR(50)
);

INSERT INTO gold.dim_environment_satisfaction (id_environment_satisfaction, satisfaction_level) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Very High');


--------------------------------------------------------
-- 3. Dimensión: Job Involvement
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_job_involvement CASCADE;

CREATE TABLE gold.dim_job_involvement (
    id_job_involvement INTEGER PRIMARY KEY,
    involvement_level VARCHAR(50)
);

INSERT INTO gold.dim_job_involvement (id_job_involvement, involvement_level) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Very High');


--------------------------------------------------------
-- 4. Dimensión: Job Satisfaction
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_job_satisfaction CASCADE;

CREATE TABLE gold.dim_job_satisfaction (
    id_job_satisfaction INTEGER PRIMARY KEY,
    satisfaction_level VARCHAR(50)
);

INSERT INTO gold.dim_job_satisfaction (id_job_satisfaction, satisfaction_level) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Very High');


--------------------------------------------------------
-- 5. Dimensión: Performance Rating
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_performance_rating CASCADE;

CREATE TABLE gold.dim_performance_rating (
    id_performance_rating INTEGER PRIMARY KEY,
    rating_level VARCHAR(50)
);

INSERT INTO gold.dim_performance_rating (id_performance_rating, rating_level) VALUES
(1, 'Low'),
(2, 'Good'),
(3, 'Excellent'),
(4, 'Outstanding');


--------------------------------------------------------
-- 6. Dimensión: Relationship Satisfaction
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_relationship_satisfaction CASCADE;

CREATE TABLE gold.dim_relationship_satisfaction (
    id_relationship_satisfaction INTEGER PRIMARY KEY,
    satisfaction_level VARCHAR(50)
);

INSERT INTO gold.dim_relationship_satisfaction (id_relationship_satisfaction, satisfaction_level) VALUES
(1, 'Low'),
(2, 'Medium'),
(3, 'High'),
(4, 'Very High');


--------------------------------------------------------
-- 7. Dimensión: Work Life Balance
--------------------------------------------------------
DROP TABLE IF EXISTS gold.dim_work_life_balance CASCADE;

CREATE TABLE gold.dim_work_life_balance (
    id_work_life_balance INTEGER PRIMARY KEY,
    balance_level VARCHAR(50)
);

INSERT INTO gold.dim_work_life_balance (id_work_life_balance, balance_level) VALUES
(1, 'Bad'),
(2, 'Good'),
(3, 'Better'),
(4, 'Best');

--------------------------------------------------------
-- 8. Hechos: Attrition Employee
--------------------------------------------------------

DROP TABLE IF EXISTS gold.employee_attrition;

CREATE TABLE gold.employee_attrition AS SELECT
	Id_Employee,
	id_education,
	id_environment_satisfaction,
	id_job_involvement,
	id_job_satisfaction,
	id_performance_rating,
	id_relationship_satisfaction,
	id_work_life_balance,
	Age,
	Attrition,
	business_travel,
	daily_rate,
	Department,
	distance_from_home,
	education_field,
	Gender,
	hourly_rate,
	job_level,
	job_role,
	marital_status,
	monthly_income,
	monthly_rate,
	num_companies_worked,
	over_time,
	percent_salary_hike,
	stock_option_level,
	total_working_years,
	training_times_last_year,
	years_at_company,
	years_in_current_role,
	years_since_last_promotion,
	years_with_curr_manager
FROM silver.employee_attrition_clean;

-- Agregamos nuevamente la PK
ALTER TABLE gold.employee_attrition
ADD PRIMARY KEY (pk_employee);
-- Agregamos las FK


SELECT * FROM gold.employee_attrition LIMIT 10;
SELECT * FROM gold.dim_education;
