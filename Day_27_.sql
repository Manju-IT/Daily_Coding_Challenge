update patients
set allergies = "NKA" where allergies is null;

select first_name, last_name  from patients where weight between 100 and 120;

select * from patients where first_name like "c%";

select concat(first_name," ",last_name) as full_name from patients;

select first_name,last_name,province_name from patients a join province_names b on a.province_id= b.province_id;

select count(*) from patients where birth_date like "2010%";

select first_name, last_name ,max(height)
from patients;

select * from patients where patient_id in (1,45,534,879,1000);

select count(*) from admissions;

select * from admissions where admission_date = discharge_date;

select patient_id,count(*) from admissions where patient_id= 579;

select distinct city from patients where province_id like "ns";

select first_name, last_name ,birth_date from patients 
where height>160 and weight >70;

select first_name, last_name ,allergies from patients 
where allergies is not null and  city like "Hamilton";

select distinct(year(birth_date)) from patients order by birth_date;

select first_name from patients group by first_name having count(first_name)<2 ; 

select patient_id , first_name from patients group by patient_id , first_name
having first_name like "s%s" and length(first_name)>=6;

select  a.patient_id, first_name, last_name from patients a join admissions b on a.patient_id = b.patient_id where b.diagnosis="Dementia";

select first_name from patients order by len(first_name),first_name ;

select count(gender) , (select count(gender) from patients where gender = "F") from patients
where gender = "M";

select first_name,last_name,allergies from patients 
where allergies = "Penicillin" or allergies ='Morphine'
order by allergies ,first_name,last_name;

select patient_id, diagnosis from admissions group by patient_id, diagnosis
having count(diagnosis)>1;

select city ,count(city) as co from patients group by city order by co desc,co asc;

select first_name,last_name, 'Patient' role from patients 

union all 
 
select first_name,last_name, 'Doctor' role from doctors;

select allergies,count(*) co from patients group by allergies having allergies not null order by co desc ;

select first_name, last_name, birth_date from patients where year(birth_date) between 1970 and 1979 order by birth_date ;

select concat(upper(last_name),",",lower(first_name)) as new from patients
order by first_name desc;

select province_id , sum(height) he from patients group by province_id having he > 7000;

select abs(max(weight)-min(weight)) as wei from patients where last_name ="Maroni";  

select day(admission_date) da , count(admission_date) num from admissions group by da order by num desc;

select * from admissions where patient_id=542 order by admission_date desc limit 1;

select patient_id, attending_doctor_id, diagnosis from admissions 
where (patient_id%2=1 and attending_doctor_id in (1,5,19))
or (cast(attending_doctor_id as char) like "%2%" and len(cast (patient_id as char))=3);

select b.first_name,b.last_name, count(a.attending_doctor_id) from admissions a join doctors b
on a.attending_doctor_id=b.doctor_id group by b.first_name,b.last_name;

select a.province_name ,count(b.patient_id)as co
from patients b join province_names a on a.province_id = b.province_id
group by a.province_name order by co desc;

select concat(a.first_name," ",a.last_name) ,
b.diagnosis ,concat(c.first_name," ",c.last_name)
from patients a 
join
admissions b on 
a.patient_id = b.patient_id 
join 
doctors c 
on 
c.doctor_id = b.attending_doctor_id ;

select first_name,last_name, count(first_name) as co
from
patients group by first_name,last_name 
having co>1
order by first_name;

select concat(first_name," ",last_name) ,
round(height/30.48,1) , round(weight*2.205) ,birth_date,
 case gender 
 when "M" then "MALE"
 else "FEMALE"
 end from patients;
 
 
select count(admission_date) as one from admissions group  by admission_date order by one desc limit 1;

select max(adm),
min(adm),
round(avg(adm),2) from
(select admission_date , count(*) adm from admissions 
 group by admission_date);
 
 select count(*) as pa  , floor(weight/10)*10 as wei from patients group by wei 
order by wei desc ;








