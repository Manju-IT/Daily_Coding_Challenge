
-- -- create database one; 
-- -- use one;
-- -- CREATE TABLE customers (
-- --    customer_id INT PRIMARY KEY,
-- --     name VARCHAR(50),
-- --     city VARCHAR(50)
-- -- );

-- -- INSERT INTO customers (customer_id, name, city) VALUES
-- -- (1, 'Alice', 'New York'),
-- -- (2, 'Bob', 'Los Angeles'),
-- -- (3, 'Charlie', 'Chicago'),
-- -- (4, 'David', 'Houston');
-- -- describe customers;

-- -- CREATE TABLE orders (
-- --     order_id INT PRIMARY KEY,
-- --     customer_id INT,
-- --     product VARCHAR(50),
-- --     amount DECIMAL(10,2),
-- --     FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
-- -- );

-- -- INSERT INTO orders (order_id, customer_id, product, amount) VALUES
-- -- (101, 1, 'Laptop', 1200.50),
-- -- (102, 2, 'Smartphone', 800.75),
-- -- (103, 1, 'Tablet', 450.30),
-- -- (104, 3, 'Monitor', 300.00),
-- -- (105, 5, 'Headphones', 150.00);

-- -- show tables;
-- -- select a.customer_id ,a.name, b.customer_id ,b.product from customers as a inner join orders as b on a.customer_id = b.customer_id;
-- -- SELECT customers.customer_id, customers.name, orders.order_id, orders.product
-- -- FROM customers
-- -- LEFT JOIN orders ON customers.customer_id = orders.customer_id;

-- -- drop database one;
-- -- show databases;
-- -- create database one ;
-- -- show databases;
-- -- use one;

-- -- create table first(
-- -- id int primary key auto_increment,
-- -- name text not null,
-- -- age int  check(age>30),
-- -- added_on timestamp default current_timestamp
-- -- );
--  -- insert into first(name,age) values ("sasah",40),("sasna",50); 
-- select * from first; 
-- create index id_ on first(id);
-- -- create view one as 
-- -- select * from first;
-- -- show view;
-- -- select * from one;
-- -- create table two as 
-- -- select * from one;
-- -- select * from two;

-- insert ignore into first values (1,"sasnam",40,default);
-- select * from first;

-- -- show tables;
-- -- drop table one;

-- -- CREATE TABLE Employees (
-- --     emp_id INT PRIMARY KEY AUTO_INCREMENT,
-- --     first_name VARCHAR(50) NOT NULL,
-- --     last_name VARCHAR(50) NOT NULL,
-- --     department ENUM('HR', 'IT', 'Sales', 'Finance', 'Marketing') NOT NULL,
-- --     salary DECIMAL(10,2) CHECK (salary > 0),
-- --     experience INT CHECK (experience >= 0),
-- --     email VARCHAR(100) UNIQUE);

-- -- INSERT INTO Employees (first_name, last_name, department, salary, experience, email)
-- -- VALUES
-- --     ('John', 'Doe', 'IT', 60000.00, 5, 'john.doe@example.com'),
-- --     ('Jane', 'Smith', 'HR', 55000.00, 3, 'jane.smith@example.com'),
-- --     ('Alice', 'Brown', 'Finance', 70000.00, 7, 'alice.brown@example.com'),
-- --     ('Bob', 'Johnson', 'Sales', 50000.00, 2, 'bob.johnson@example.com'),
-- --     ('Charlie', 'Davis', 'Marketing', 48000.00, 1, 'charlie.davis@example.com');

-- select * from employees;
-- -- update  employees
-- -- set salary = 65000
-- -- where first_name = "john";
-- -- update employees 
-- -- set department = "IT",salary = 200000
-- -- where first_name = "john";

-- -- update employees 
-- -- set salary = Case 
-- -- WHEN department = "hr" THEN salary * 1.05
-- -- WHEN department = "Finance" THEN salary * 1.07
-- -- end;

-- -- delete from employees where emp_id = 3;

-- select * from employees;

-- delete from employees
-- where salary <(select avg(salary) from employees);


-- CREATE TABLE Orders (
--     order_id INT PRIMARY KEY AUTO_INCREMENT,
--     customer_name VARCHAR(100) NOT NULL,
--     animal_type ENUM('Hen', 'Sheep', 'Goat', 'Pig') NOT NULL,
--     quantity INT CHECK (quantity > 0),
--     price_per_unit DECIMAL(10,2) CHECK (price_per_unit > 0),
--     total_price DECIMAL(10,2) GENERATED ALWAYS AS (quantity * price_per_unit) STORED,
--     order_status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
--     order_date DATE 
-- );
-- INSERT INTO Orders (customer_name, animal_type, quantity, price_per_unit, order_status, order_date)
-- VALUES
--     ('Rahul Sharma', 'Hen', 10, 250.00, 'Pending', '2025-02-10'),
--     ('Amit Verma', 'Goat', 3, 5500.00, 'Shipped', '2025-02-09'),
--     ('Sneha Gupta', 'Sheep', 5, 7500.00, 'Pending', '2025-02-08'),
--     ('Priya Kumar', 'Pig', 2, 12000.00, 'Delivered', '2025-02-07'),
--     ('Vikas Singh', 'Hen', 20, 240.00, 'Cancelled', '2025-02-06');


-- select  * from orders where order_status = "pending";
-- select * from orders where customer_name = "Rahul Sharma";
-- select * from orders order by total_price desc ;
-- select count(*) from orders where animal_type = "goat";
-- select   max(total_price) from orders ;
select * from  orders ;
-- update orders 
-- set price_per_unit= 260.00 
-- where price_per_unit = 250.00;
-- update orders 
-- set order_status = "pending" 
-- where order_status = "shipped";
-- update orders 
-- set price_per_unit = price_per_unit *1.10
-- where animal_type="sheep";
-- update orders 
-- set order_status = "Cancelled" where order_date <'2025-02-07';
-- UPDATE Orders SET order_status = 'Cancelled' WHERE order_date < '2025-02-07';

-- update orders 
-- set total_price =
-- 	case 
-- 		 WHEN animal_type = "hen" THEN  total_price *0.95
-- 		 WHEN animal_type= "goat" THEN  total_price *0.93
-- 		 WHEN animal_type = "sheep" THEN total_price *0.90
-- 		 ELSE total_price
-- 	END;

-- update orders 
-- set price_per_unit =  price_per_unit * 1.10
-- where price_per_unit < (select avg(price_per_unit) from orders);
-- UPDATE Orders 
-- SET price_per_unit = price_per_unit * 1.10 
-- WHERE price_per_unit > (SELECT AVG(price_per_unit) FROM Orders);

-- delete from orders 
-- where order_id = 5;
-- delete from orders
-- where  order_status  = "cancelled";
-- create view one  as 
-- select avg(total_price) from orders;
-- delete from orders 
-- where total_price <(select * from  one);
-- select * from one;

-- delete from orders 
-- where customer_name like "singh%";

delete from orders 
where  (select count(animal_type) from orders ) > 1;






