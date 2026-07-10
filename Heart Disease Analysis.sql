CREATE DATABASE heart_disease_db;
USE heart_disease_db;
CREATE TABLE patient_data(
id INT AUTO_INCREMENT PRIMARY KEY,
age TINYINT,
sex INT, -- 0 = Female, 1 = Male
chest_pain_type TINYINT, -- 0-3 categories
bp INT,
cholesterol INT,
FBS_over_120 TINYINT,
EKG_results TINYINT,
max_HR INT,
exercise_angina TINYINT, -- 0 = No, 1 = Yes
ST_depression DECIMAL(4,2),
slope_of_ST TINYINT,
number_of_vessels_fluro TINYINT,
thallium TINYINT, -- 3 = Normal, 7 = Fixed defect, 9 = Reversible Defect
heart_disease TINYINT -- 0 = Absence, 1 = Presence
);
-- query time
-- see the first 10 rows
SELECT * FROM patient_data LIMIT 10;

-- count total records
SELECT COUNT(*) AS total_rows FROM patient_data;

-- heart disease presence vs absence
SELECT heart_disease, COUNT(*) AS count 
FROM patient_data
GROUP BY heart_disease;

-- chest pain type distribution
SELECT chest_pain_type, COUNT(*) AS count
FROM patient_data
GROUP BY chest_pain_type;

-- thallium test results distribution
SELECT thallium, COUNT(*) AS count
FROM patient_data
GROUP BY thallium;

-- age statistics summary
SELECT AVG(age) AS avg_age, MIN(age) AS min_age, MAX(age) AS max_age
FROM patient_data;

-- cholesterol statistics summary
SELECT AVG(cholesterol) AS avg_chol, MIN(cholesterol) AS min_chol, MAX(cholesterol) AS max_chol
FROM patient_data;

-- average cholesterol by heart disease status
SELECT heart_disease, AVG(cholesterol) AS avg_chol
FROM patient_data
GROUP BY heart_disease;

-- average ST depression by exercise angina
SELECT exercise_angina, AVG(ST_depression) AS avg_st_depression
FROM patient_data
GROUP BY exercise_angina;

-- total number of patients older than 60 with heart disease
SELECT COUNT(*) AS COUNT
FROM patient_data
WHERE age > 60 AND heart_disease = 1;

-- top 5 highest cholesterol values
SELECT age, cholesterol, heart_disease
FROM patient_data
ORDER BY cholesterol DESC
LIMIT 5;