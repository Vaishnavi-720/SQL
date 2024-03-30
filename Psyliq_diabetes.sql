create database Psyliq;
use Psyliq;
select * from diabetes_prediction;
select count(*) from diabetes_prediction;
drop table diabetes_prediction;

select * from diabetesp;
select count(*) from diabetesp;

-- 1. Retrieve the Patient_id and ages of all patients.
select patient_id, age
from diabetesp;

-- 2. Select all female patients who are older than 40
select * from diabetesp
where gender = 'female' and age > 40;

-- 3. Calculate the average BMI of patients.
select avg(bmi) as AVG_BMI
from diabetesp;

-- 4. List patients in descending order of blood glucose levels.
select * from diabetesp
order by blood_glucose_level desc;

-- 5. Find patients who have hypertension and diabetes. 
select * from diabetesp 
where hypertension = 1 and diabetes = 1;

-- 6. Determine the number of patients with heart disease.
select count(patient_id)
from diabetesp 
where heart_disease = 1;

-- 7. Group patients by smoking history and count how many smokers and nonsmokers there are.
select smoking_history, 
count(*) as number_of_patients
from diabetesp
group by smoking_history;

-- 8. Retrieve the Patient_ids of patients who have a BMI greater than the average BMI.
select patient_id
from diabetesp
where bmi > (select avg(bmi)
			from diabetesp);

-- 9. Find the patient with the highest HbA1c level and the patient with the lowest HbA1clevel. 
select * from diabetesp
where HbA1c_level in (select max(hba1c_level)
from diabetesp);
-- union
select * from diabetesp
where HbA1c_level in (select min(hba1c_level)
from diabetesp);

-- 10. Calculate the age of patients in years (assuming the current date as of now).
-- select patient_id, age,
-- extract(year from current date ) - age as year of birth 
-- from diabetesp;
set sql_mode= 'no_unsigned_subtraction';
select Employeename, patient_id,
abs((age-year(now()))) as Year_age
from diabetesp;
set sql_mode= 'no_unsigned_subtraction';

-- 11. Rank patients by blood glucose level within each gender group.
select gender,blood_glucose_level, EmployeeName, Patient_id, 
row_number() over (order by  blood_glucose_level desc) as patient_rank
from diabetesp;
-- rder by blood_glucose_level desc;

-- 12. Update the smoking history of patients who are older than 50 to "Ex-smoker."
update diabetesp
set smoking_history = 'Ex-smoker'
where age > 50;

-- 13. Insert a new patient into the database with sample data.
describe diabetesp;
select * from diabetesp
where EmployeeName = 'Mathyu';

insert into diabetesp
values ('Mathyu', 'PT50101', 'Male', 44, 0, 1, 'Current', 23.8, 5.1, 98, 1);

-- 14. Delete all patients with heart disease from the database.
delete from diabetesp
where heart_disease = 1;

-- 15. Find patients who have hypertension but not diabetes using the EXCEPT operator.
select * from diabetesp
where hypertension = 1 and diabetes = 0;

-- 16. Define a unique constraint on the "patient_id" column to ensure its values are unique. 
select distinct patient_id
from diabetesp;

alter table diabetesp
modify patient_id varchar(255) unique;

-- 17. Create a view that displays the Patient_ids, ages, and BMI of patients.
-- 18. Suggest improvements in the database schema to reduce data redundancy and improve data integrity.
-- 19. Explain how you can optimize the performance of SQL queries on this dataset.