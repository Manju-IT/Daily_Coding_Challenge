-- select name,sum(distance) as dist from rides 
-- inner join users group by name order by dist desc ;

-- select name,
-- sum(case when u.id=r.user_id then distance 
-- else 0 end ) as travelled_distance from users u
-- left join rides r
-- on u.id= r.user_id
-- group by u.id
-- order by sum(distance) desc,name asc ;
-- use one;
-- select * from co;
-- show tables ;
select * from employees;
desc employees;
-- select * from employees order by experience desc;
-- select first_name , last_name,sum(experience) as ex from employees group by first_name ,last_name having ex>1 order by ex asc;
-- select group_concat( first_name, last_name) as com ,sum(experience) as ex from employees group by first_name having ex>1 order by ex asc;
-- delete from employees
-- where salary = null;
-- update employees  
-- set salary = 0 where salary = null;
-- alter table employees 
-- add column mood varchar(50);
-- modify column mood date;
-- change column mood unk int;
-- drop column unk;times_jobs_list
-- add column ono int;
-- alter column ono set not null;
-- select salary from employees;
-- set @temp =( select salary from employees where salary is not null limit 1) ;
-- update employees 
-- set salary = @temp
-- where salary is null ;
-- -- select salary from employees where salary is not null;
-- select * from employees;
-- select emp_id ,concat(lower(left(first_name,1)),right(first_name,length(first_name)-1)) from employees order by 1;

-- select s.product_id, product_name from Sales s left join Product p on s.product_id = p.product_id group by product_id having min(sale_date) >= '2019-01-01' and max(sale_date) <= '2019-03-31';

-- use one;
-- rename table times_jobs_list to times;
-- select * from times;
-- select * from times where location= "gurgaon";
























