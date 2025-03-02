-- select * from customers ;

-- show triggers;
-- show events;

-- delimiter $$
-- create trigger one
-- after insert on customers 
-- for each row 
-- begin 
-- 			select * from customers ;   ### Not allowed
-- end$$

-- show procedure status;

-- delimiter $$
-- create procedure thre()
-- begin 
-- 		 select * from customers;
-- end $$
-- call thre()
CREATE TABLE Emp (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    joining_date DATE,
    last_promotion DATE DEFAULT NULL,
    performance_score INT CHECK (performance_score BETWEEN 1 AND 10)
);

INSERT INTO Emp (name, department, salary, joining_date, performance_score) VALUES
('Alice', 'IT', 75000, '2020-06-15', 8),
('Bob', 'HR', 60000, '2019-09-20', 6),
('Charlie', 'Finance', 85000, '2021-01-10', 7),
('David', 'IT', 90000, '2018-03-25', 9),
('Eve', 'Marketing', 50000, '2022-07-30', 5);

select * from emp;

-- delimiter $$

-- create trigger a
-- before insert on emp 
-- for each row 
-- begin 
-- 			if new.salary is null then 
--             set new.salary = 200000;
--             end if;
-- insert into emp values (null,'jsajs','hahsa',null, now(),null, 9);
-- drop trigger a;
delimiter $$

-- create trigger a
-- before insert on emp 
-- for each row 
-- begin 
-- 			if new.salary is null then
--             case new.department
-- 				when 'it' then set new.salary = 80000;
-- 				when  'hr' then  set new.salary = 60000;
-- 				when 'finance' then set new.salary = 90000;
-- 				else set new.salary = 50000;
--             end case;
--             end if ;
-- end$$ 

-- select * from emp;
-- insert into emp values (null,'jsajs','finance',null, now(),null, 9);
-- drop trigger b;
-- delimiter $$
-- create trigger b 
-- after update on emp 
-- for each row 
-- begin 
--         if new.salary > old.salary then
-- 		update emp set last_promotion = now() where emp_id = new.emp_id;
--         end if;
-- end $$

-- update emp 
-- set salary = 60000 where name = 'eve';

-- delimiter $$

-- create trigger c 
-- before delete on emp 
-- for each row 
-- begin 
--           if old.department = "hahsa" and old.performance_score >7 then 
--           signal sqlstate '45000'
--           set message_text = "cannot delete ";
--           end if ;
-- end $$
-- drop trigger c;
-- select * from emp;

-- DELETE FROM emp WHERE department = 'hahsa';

-- create table low ( 
-- id int not null primary key ,
-- name varchar(20) not null,
-- dep varchar(50) not null ,
-- score int not null ,
-- Msg varchar(50) not null default " Low performance score detected " 
-- ); 

-- select * from low;
-- select * from emp;
-- delimiter $$
-- create trigger d 
-- after insert on emp 
-- for each row 
-- begin 
-- 			if new.performance_score <5 then 
--             insert into low values( new.emp_id ,new.name , new.department , new.performance_score , " Low performance score detected");
--             end if ;
-- end $$
-- drop trigger d;
-- insert into emp values(null , "sjaj" , "it" , 20000,now(),null, 3);
-- select * from low;

delimiter $$

-- create event e 
-- on schedule every 1 month 
-- do 
-- begin 
--            update emp 
--            set salary=salary *1.05;
-- end$$

-- delimiter $$ 
-- create event f
-- on schedule every 6 month 
-- do 
-- begin 
--           delete from emp 
--           where performance_score <3;
-- end $$

-- delimiter $$ 
-- create event g 
-- on schedule every 1 month 
-- do 
-- begin

-- create table stats ( 
-- id int primary key auto_increment ,
-- Avg_sal int not null,
-- tot_emp int not null
-- );

-- delimiter $$
--  
-- create event i
-- on schedule every 1 minute 
-- do 
-- begin 
--            insert into stats values(avg(sum(salary)), count(*));
-- end $$

-- --  alter table stats
-- --  drop column id ;
-- -- desc stats;

-- select * from stats;
 
--  delimiter $$
--  
--  create procedure mm(in dpt_name varchar(20), in  inc_per int)
-- begin 
-- 		    update emp 
--             set salary = salary *(1+ inc_per/100) where department = dpt_name ;
-- end $$

-- call mm("finance",88)
 
--  drop procedure mm;

-- delimiter $$
-- create procedure mn(in ps int , in dept varchar(20))
-- begin 
--            if ps > 70  then 
--            select (salary+(salary*performance_score)) from emp where department= dept ;
--            end if ;
-- end $$

-- call mn(75 , "finance");
-- select * from emp;

-- delimiter $$

-- create procedure nh( in sal int , in  p_dept varchar(20), in e_dept varchar(20) )
-- begin 
--            if sal > 80000 then 
--            update emp
--            set department = e_dept  where department = p_dept;
--            end if ;
-- end $$

-- call nh(90000, "finance","mangement");

-- select * from emp;

-- create table  aud (
-- aud_id int auto_increment primary key ,
-- id int not null ,
-- old_sal int not null,
-- new_sal int not null ,
-- chn_date date not null );

-- delimiter $$

-- create procedure bj(in em_id int, in new_s  int )
-- begin 
--             insert into aud 
--             select null,emp_id , salary , new_s ,now() from emp where emp_id = em_id ;
--             update emp 
--             set salary = new_s where emp_id =em_id ;
-- end$$
-- select * from emp;

-- call bj(2, 75000);
-- drop procedure bj;

-- delimiter $$

-- create procedure  kl(in dpt varchar(20) ,  in mx_sal int , in ps int)
-- begin 
--              if dpt in ("it","mangement") and mx_sal>80000 and ps>7 then 
--              
--              select * from emp where department = dpt and salary >80000 and performance_score >7;
--              end if ;
-- end $$

-- select * from emp;
-- drop procedure kl;
-- call kl("mangement", 88000 , 8);


-- start transaction ;
-- select * from emp where department = "it"and salary >80000 and performance_score >7;
-- select * from emp;
-- commit;
-- set autocommit =0;
-- commit;
-- delete from emp;
-- select * from emp;
-- drop table emp;
-- select * from emp;
-- rollback;
-- select * from emp;

-- with cm as (
--         select * from one
--         ) select * from cm;
        
-- use one ;
-- show tables ;
-- select * from audit ;
-- select * from  rsa;

-- select * from sam;

select id , data_value, rank() over(order by data_value) as rankings from sam  limit 1, 2;


















