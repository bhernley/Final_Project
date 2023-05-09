DROP TABLE Original_Dataset;

CREATE TABLE Original_Dataset (
	gender VARCHAR(10),
	age FLOAT,
	hypertension BOOL,
	heart_disease BOOL,
	smoking_history VARCHAR(40),
	bmi DECIMAL(4,2),
	HbA1c_level DECIMAL(2,1),
	blood_glucose_level INT,
	diabetes BOOL);
--imported original dataset 'diabetes_prediction_dataset.csv'
select * FROM Original_Dataset;

-- added a column to add a unique patient number
ALTER TABLE Original_Dataset
	ADD COLUMN Patient_No SERIAL;

--exported table with new patient number as 'dataset_with_patient_no.CSV' to be cleaned
--columns rearranged and smoking history spelling was corrected, column added to show if patient ever had a history of smoking

Drop TABLE Clean_Dataset ;
CREATE TABLE Clean_Dataset (
	patient_no INT,
	gender VARCHAR(10),
	age FLOAT,
	hypertension BOOL,
	heart_disease BOOL,
	smoking_history VARCHAR(40),
	have_ever_smoked BOOL,
	bmi DECIMAL(4,2),
	HbA1c_level DECIMAL(2,1),
	blood_glucose_level INT,
	diabetes BOOL);
	
--imported original dataset 'clean_dataset.csv'	

select * FROM Clean_Dataset;

--Large portion of dataset is negative for diabetes, 
--we'll reduce the number of patients that are negative for diabetes to match those that are positive
--we'll first see how many are positive and then pull a sample of negative patients to match, we'll then combine
--the results into a final table named 'diabetes_sample'

SELECT * FROM Clean_Dataset 
 WHERE diabetes = true;
 --export as diabetes_true.csv
  
SELECT * FROM Clean_Dataset
 WHERE diabetes = false
 LIMIT 7046;
 --export as diabetes_false.csv

--creating 
drop table diabetes_true;
CREATE TABLE diabetes_true(
	patient_no INT,
	gender VARCHAR(10),
	age FLOAT,
	hypertension BOOL,
	heart_disease BOOL,
	smoking_history VARCHAR(40),
	have_ever_smoked BOOL,
	bmi DECIMAL(4,2),
	HbA1c_level DECIMAL(2,1),
	blood_glucose_level INT,
	diabetes BOOL);
--diabetes_true.csv

drop table diabetes_false;
CREATE TABLE diabetes_false(
	patient_no INT,
	gender VARCHAR(10),
	age FLOAT,
	hypertension BOOL,
	heart_disease BOOL,
	smoking_history VARCHAR(40),
	have_ever_smoked BOOL,
	bmi DECIMAL(4,2),
	HbA1c_level DECIMAL(2,1),
	blood_glucose_level INT,
	diabetes BOOL);
--export diabetes_false.csv

select * from diabetes_false;
select * from diabetes_true;

--creating table to merge samples
drop TABLE diabetes_sample;
CREATE TABLE diabetes_sample(
	patient_no INT,
	gender VARCHAR(10),
	age FLOAT,
	hypertension BOOL,
	heart_disease BOOL,
	smoking_history VARCHAR(40),
	have_ever_smoked BOOL,
	bmi DECIMAL(4,2),
	HbA1c_level DECIMAL(2,1),
	blood_glucose_level INT,
	diabetes BOOL);
--merging	
INSERT INTO diabetes_sample SELECT * FROM diabetes_false;
INSERT INTO diabetes_sample SELECT * FROM diabetes_true;


select * from diabetes_sample;
--export as diabetes_sample.CSV


-- group by age count
SELECT
	CASE
		WHEN age < 18 THEN 'Under 18'
		WHEN age BETWEEN 18 AND 25 THEN '18-25'
		WHEN age BETWEEN 26 AND 35 THEN '26-35'
		WHEN age BETWEEN 36 AND 45 THEN '36-45'
		WHEN age BETWEEN 46 AND 55 THEN '46-55'
		ELSE '55+'
	END AS age_range,
	COUNT(*) AS count
From diabetes_sample
GROUP BY age_range
ORDER BY age_range;

-- numeric conversions of columns

	-- converting gender into numeric value table
CREATE TABLE gender_numeric_table AS
SELECT patient_no,
	CASE
		WHEN gender = 'Male' THEN 1
		ELSE 0
	END AS gender_numeric 
FROM diabetes_sample;

SELECT * FROM gender_numeric_table;


	-- converting hypertension into numeric value table
CREATE TABLE hypertension_numeric_table AS
SELECT patient_no,
	CASE
		WHEN hypertension = 'true' THEN 1
		ELSE 0
	END AS hypertension_numeric 
FROM diabetes_sample;

SELECT * FROM hypertension_numeric_table;

	-- 	converting hear disease into numeric value table
CREATE TABLE heart_disease_numeric_table AS
SELECT patient_no,
	CASE
		WHEN heart_disease = 'true' THEN 1
		ELSE 0
	END AS heart_disease_numeric 
FROM diabetes_sample;

SELECT * FROM heart_disease_numeric_table;

	-- 	converting smoking history into numeric value table
CREATE TABLE smoking_history_numeric_table AS
SELECT patient_no,
	CASE
		WHEN have_ever_smoked = 'true' THEN 1
		ELSE 0
	END AS smoking_history_numeric 
FROM diabetes_sample;

SELECT * FROM smoking_history_numeric_table;

	-- 	converting diabetes into numeric value table
CREATE TABLE diabetes_numeric_table AS
SELECT patient_no,
	CASE
		WHEN diabetes = 'true' THEN 1
		ELSE 0
	END AS diabetes_numeric 
FROM diabetes_sample;

SELECT * FROM diabetes_numeric_table;

-- separating remaining columns into their own tables
CREATE TABLE age_numeric_table AS
SELECT patient_no, age
FROM diabetes_sample;

CREATE TABLE bmi_table AS
SELECT patient_no, bmi
FROM diabetes_sample;

CREATE TABLE hba1c_level_table AS
SELECT patient_no, hba1c_level
FROM diabetes_sample;

CREATE TABLE blood_glucose_level_table AS
SELECT patient_no, blood_glucose_level
FROM diabetes_sample;

SELECT * FROM age_numeric_table;
SELECT * FROM bmi_table;
SELECT * FROM hba1c_level_table;
SELECT * FROM blood_glucose_level_table;

-- need to creat an age group table to jOIN
CREATE TABLE age_group_table AS
SELECT patient_no,
	CASE
		WHEN age < 18 THEN 0
		WHEN age BETWEEN 18 AND 25 THEN 1
		WHEN age BETWEEN 26 AND 35 THEN 2
		WHEN age BETWEEN 36 AND 45 THEN 3
		WHEN age BETWEEN 46 AND 55 THEN 4
		ELSE 5
	END AS age_range
From diabetes_sample;

SELECT * FROM age_group_table;

-- joining all numerical tables into 1 table

SELECT gender_numeric_table.patient_no, gender_numeric, age_range, hypertension_numeric, heart_disease_numeric, smoking_history_numeric, bmi, hba1c_level, blood_glucose_level, diabetes_numeric
FROM gender_numeric_table
JOIN age_group_table ON gender_numeric_table.patient_no = age_group_table.patient_no
JOIN hypertension_numeric_table ON gender_numeric_table.patient_no = hypertension_numeric_table.patient_no
JOIN heart_disease_numeric_table ON gender_numeric_table.patient_no = heart_disease_numeric_table.patient_no
JOIN smoking_history_numeric_table ON gender_numeric_table.patient_no = smoking_history_numeric_table.patient_no
JOIN bmi_table ON gender_numeric_table.patient_no =bmi_table.patient_no
JOIN hba1c_level_table ON gender_numeric_table.patient_no = hba1c_level_table.patient_no
JOIN blood_glucose_level_table ON gender_numeric_table.patient_no = blood_glucose_level_table.patient_no
JOIN diabetes_numeric_table ON gender_numeric_table.patient_no = diabetes_numeric_table.patient_no
;