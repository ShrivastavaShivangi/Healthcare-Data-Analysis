SHOW databases;
use project_medical_data_history;
select * from patients;

select first_name, last_name, gender from patients where gender= 'M';

SELECT distinct allergies from patients;

select first_name, last_name, allergies from patients where allergies is null;

select first_name from patients where first_name like 'C%';

select first_name, last_name, weight from patients where weight between 100 and 120;

SELECT patient_id, first_name, COALESCE(allergies, 'NKA') AS allergies FROM patients where allergies is null;

select concat_ws(' ', first_name, last_name) as full_name from patients;

select first_name, last_name, concat_ws(' ', city, province_id) as province from patients;

select * from patients where birth_date like '2010%';

select count(*) from patients where birth_date like '2010%';

select first_name, last_name, height from patients order by height desc limit 1;

select * from patients where patient_id in (1, 45, 534, 879, 1000);

select * from admissions;
select count(patient_id) from admissions;

select count(distinct patient_id) from admissions;

select * from admissions where admission_date=discharge_date;

select count(admission_date) from admissions where patient_id='579';

select * from patients;
select distinct city from patients where province_id= 'NS';

select first_name, last_name, birth_date, height, weight from patients where height >160 and weight>70;

select distinct extract(year from birth_date) as birth_years from patients order by birth_years asc;

select distinct first_name from patients group by first_name having count(first_name)=1;

select patient_id, first_name from patients where first_name like 's____%s';

select p.patient_id, p.first_name, p.last_name from patients as p
join admissions as a on p.patient_id=a.patient_id
where a.diagnosis= 'Dementia';

select distinct first_name, char_length(first_name) as length from patients order by length asc; 

select count(case when gender='M' then 1 end) as males,
	count(case when gender='F' then 1 end) as females
    from patients;

select patient_id, diagnosis from admissions group by patient_id, diagnosis having count(*)>1;

select city, count(patient_id) from patients group by city order by count(patient_id) desc, city asc;

select first_name, last_name, 'patient' as role from patients
union
select first_name, last_name, 'doctor' as role from doctors;

SELECT allergies, COUNT(*) AS frequency FROM patients WHERE allergies IS NOT NULL GROUP BY allergies ORDER BY frequency DESC;

select first_name, last_name, birth_date from patients where birth_date like '197%' order by birth_date asc;

select concat_ws(',', upper(last_name), first_name) as full_name from patients order by first_name desc;

select province_id, sum(height) from patients group by province_id having sum(height)>7000 or sum(height)=7000;

select max(weight) as max_weight, min(weight) as min_weight, max(weight)-min(weight) as weight_difference from patients where last_name= 'Maroni' group by last_name;

select distinct day(admission_date) as day_of_month, count(*) as admission_count from admissions group by day_of_month order by admission_count desc;

select * from patients;
select count(patient_id) as total_patients, floor(weight/10)*10 as weight_group from patients group by weight_group order by weight_group desc;

select patient_id, weight as weight_in_kg, height/100 as height_in_m, case when weight / power(height/100, 2)  >= 30 then 1 else 0 end as isObese  from patients;

select p.patient_id, p.first_name, p.last_name, d.specialty from patients as p
join admissions as a on p.patient_id=a.patient_id
join doctors as d on d.doctor_id=a.attending_doctor_id
where a.diagnosis='Epilepsy' and d.first_name='Lisa';

select p.patient_id, 
concat_ws('', p.patient_id, char_length(p.last_name), year(p.birth_date)) as temp_password 
from patients as p 
join admissions as a on p.patient_id = a.patient_id
group by p.patient_id, p.last_name, p.birth_date;
