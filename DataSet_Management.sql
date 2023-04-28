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
--import diabetes_false.csv

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
