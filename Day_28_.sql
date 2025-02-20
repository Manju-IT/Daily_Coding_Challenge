-- select a.patient_id,a.first_name,a.last_name,c.specialty as ds from patients a 
-- join admissions b on a.patient_id = b.patient_id join doctors c on c.doctor_id=b.attending_doctor_id 
-- where b.diagnosis ="Epilepsy" and c.first_name = "Lisa"; 


-- select distinct a.patient_id ,concat(b.patient_id, len(last_name),year(a.birth_date)) from patients a join admissions
--                             b on a.patient_id = b.patient_id;
--                             

-- SELECT * 
-- FROM patients 
-- WHERE first_name LIKE '__r%' 
-- AND gender = 'F' 
-- AND MONTH(birth_date) IN (2, 5, 12) 
-- AND weight BETWEEN 60 AND 80 
-- AND patient_id % 2 != 0 
-- AND city = 'Kingston';

-- SELECT 
--     CONCAT(ROUND((COUNT(*) * 100.0) / (SELECT COUNT(*) FROM patients), 2), '%') AS male_percentage
-- FROM patients 
-- WHERE gender = 'M';

-- LAG(column_name, offset, default_value) OVER (PARTITION BY column_to_partition ORDER BY column_to_sort);


-- select doctor_id,concat(first_name," ",last_name),specialty,year(admission_date), count(admission_date) from admissions
-- a join doctors b on a.attending_doctor_id = b.doctor_id group by year(admission_date),doctor_id order by false;

-- select patient_id , weight,height , case when (weight / POWER(height / 100.0, 2)) >= 30 then 1s
-- else 0 end as isobese from patients;

######################

-- use one;



-- SET GLOBAL local_infile = 1;


-- LOAD DATA INFILE "C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\SQL - Retail Sales Analysis_utf .csv"
-- INTO TABLE rsa
-- FIELDS TERMINATED BY ',' 
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS;

-- SHOW VARIABLES LIKE 'secure_file_priv

-- delimiter $$
-- create procedure one()
-- begin 
-- select * from one;
-- end $$

-- call one();

-- delimiter $$
-- create procedure one1(par int)
-- begin 
-- select * from one
-- where  age= par;
-- end $$
-- call one1(50);

-- delimiter  $$
-- create procedure two(par int)
--     returns int
-- begin 
-- return (par + 10)
-- end$$
-- select two(10);

-- delimiter $$
-- create procedure ek( in email int ,out id int)
-- begin 
-- select `id` into id 
-- from one;
-- end $$
-- call ek(40,@id);
-- select @id;
-- drop procedure ek;
-- use one;
-- show tables;
-- delimiter $$

-- create trigger ek
-- after insert on first
-- for each row 
-- begin 
-- set @par := @par +1;
-- end $$

-- select * from first ;
-- select @par;
-- insert into first(id,name,age,added_on) values(5,'sajsh',21,curtime());

-- desc first;

-- drop trigger ek;

-- delimiter $$
-- create trigger ek
-- after insert on first
-- for each row 
-- begin 
-- set @par := @par +1;
-- end $$

-- show tables;

-- select * from employees;
-- select * from times;
-- select * from one;b

-- delimiter $$
-- create event ek
-- on schedule every 10 second
-- do 
-- begin 
-- delete from one
-- where age <50 ;
-- end $$-- Create the 'customers' table
-- CREATE TABLE customers (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(100),
--     email VARCHAR(100),
--     address VARCHAR(255)
-- );

-- -- Insert sample records into 'customers'
-- INSERT INTO customers (name, email, address)
-- VALUES
--   ('John Doe', 'john.doe@example.com', '123 Main St'),
--   ('Jane Smith', 'jane.smith@example.com', '456 Elm St');

-- select * from customers ;
-- Create the 'customer_audit' table
CREATE TABLE customer_audit (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    action VARCHAR(50),
    action_time DATETIME
);

-- rename table customer_audit to audit;

-- desc audit;
-- desc customers;
-- delimiter $$
-- create trigger exa
-- after insert on customers 
-- for each row 
-- begin 
-- 		insert into audit values( null, new.id, 'inserttion',curdate());
-- end$$

-- insert into customers  values (null,"sjakjs","sashajh","sasa");
select * from audit;
select * from customers;
CREATE TABLE add_up (
    audit_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    old_address VARCHAR(255),
    new_address VARCHAR(255),
    updated_at DATETIME
);

-- delimiter $$
-- create trigger ex1
-- after update on customers 
-- for each row 
-- begin 
-- 		if old.address <>new.address then 
--         insert into add_up values(null,old.id , old.address,new.address,now());
--         end if ;
-- end $$ 

-- select * from audit;
-- select * from customers;

-- update customers 
-- set address = "789 em st" where id = 3;

-- select * from add_up;


-- delimiter $$
-- create event exa
-- on schedule every 10 second 
-- do
-- begin 
-- 			insert into customers values (null , "sasj","sajakj","skakjs");
-- end $$

-- select @par;

-- -- drop event exam;

-- select * from customers ;

-- drop trigger exa;

-- delimiter $$
-- create event ex
-- on schedule at current_timestamp() + interval 10 second
-- do
-- begin 
-- 			insert into customers values (null , "sasj","sajakj","skakjs");
-- end $$

-- select * from customers ;

-- drop event exa;


CREATE TABLE sam (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data_value VARCHAR(100)
);

-- INSERT INTO sam (data_value)
-- VALUES ('Test1'), ('Test2'), ('Test3');

-- select * from sam;

-- CREATE TABLE s_audit (
--     audit_id INT AUTO_INCREMENT PRIMARY KEY,
--     sample_id INT,
--     inserted_value VARCHAR(100),
--     inserted_at DATETIME
-- );
-- select * from s_audit ;

-- delimiter $$
-- create trigger am 
-- after insert on sam 
-- for each row 
-- begin 
--      insert into s_audit values( null , new.id, "sahsa",now());
-- end $$

-- insert into sam values(null , "sasaj");
-- select * from s_audit ;

-- delimiter $$
--  
-- create event em
-- on schedule at current_timestamp() + interval 20 second 
-- do 
-- begin 
-- 			alter table s_audit
--             drop column sample_id ;
-- end $$ 

-- select * from s_audit;













