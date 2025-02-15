-- CREATE TABLE OnlineRetail (
--     InvoiceNo VARCHAR(20),
--     StockCode VARCHAR(20),
--     Description TEXT,
--     Quantity INT,
--     InvoiceDate DATETIME,
--     UnitPrice DECIMAL(10,2),
--     CustomerID INT,
--     Country VARCHAR(50),
--     PRIMARY KEY (InvoiceNo, StockCode)
-- );

-- INSERT INTO OnlineRetail (InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country) VALUES
-- ('536365', '85123A', 'WHITE HANGING HEART T-LIGHT HOLDER', 6, '2010-12-01 08:26:00', 2.55, 17850, 'United Kingdom'),
-- ('536365', '71053', 'WHITE METAL LANTERN', 6, '2010-12-01 08:26:00', 3.39, 17850, 'United Kingdom'),
-- ('536365', '84406B', 'CREAM CUPID HEARTS COAT HANGER', 8, '2010-12-01 08:26:00', 2.75, 17850, 'United Kingdom'),
-- ('536365', '84029G', 'KNITTED UNION FLAG HOT WATER BOTTLE', 6, '2010-12-01 08:26:00', 3.39, 17850, 'United Kingdom'),
-- ('536365', '84029E', 'RED WOOLLY HOTTIE WHITE HEART.', 6, '2010-12-01 08:26:00', 3.39, 17850, 'United Kingdom'),
-- ('536365', '22752', 'SET 7 BABUSHKA NESTING BOXES', 2, '2010-12-01 08:26:00', 7.65, 17850, 'United Kingdom'),
-- ('536365', '21730', 'GLASS STAR FROSTED T-LIGHT HOLDER', 6, '2010-12-01 08:26:00', 4.25, 17850, 'United Kingdom'),
-- ('536366', '22633', 'HAND WARMER UNION JACK', 6, '2010-12-01 08:28:00', 1.85, 17850, 'United Kingdom'),
-- ('536366', '22632', 'HAND WARMER RED POLKA DOT', 6, '2010-12-01 08:28:00', 1.85, 17850, 'United Kingdom'),
-- ('536367', '84879', 'ASSORTED COLOUR BIRD ORNAMENT', 32, '2010-12-01 08:34:00', 1.69, 13047, 'United Kingdom');
-- select * from Onlineretail ;
-- -- delete t1 from onlineretail t1 
-- -- inner join onlineretail t2 
-- -- ON t1.InvoiceNo = t2.InvoiceNo AND t1.StockCode = t2.StockCode AND t1.Quantity = t2.Quantity 
-- -- AND t1.InvoiceDate = t2.InvoiceDate AND t1.UnitPrice = t2.UnitPrice AND t1.CustomerID = t2.CustomerID 
-- -- AND t1.Country = t2.Country AND t1.Description = t2.Description
-- -- WHERE t1.InvoiceNo > t2.InvoiceNo;
-- -- update onlineretail 
-- -- set customerid = 0 where customerid is null ; 
-- -- select invoiceno , date(invoicedate) from onlineretail;
-- -- select lower(trim(description)) from onlineretail;
-- -- select customerid ,sum(quantity) as tot from onlineretail group by customerid order by tot desc limit 5;
-- -- select country , (sum(unitprice)*sum(quantity)) from onlineretail group by country;
-- -- select country , sum(unitprice*quantity) as tot from onlineretail group by country order by tot;
-- -- SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
-- -- FROM OnlineRetail
-- -- GROUP BY Country
-- -- ORDER BY TotalRevenue DESC;
-- select * from onlineretail;


-- CREATE TABLE employees (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(50),
--     age INT,
--     department VARCHAR(50),
--     salary DECIMAL(10,2)
-- );

-- show tables ;
-- show databases;
-- use one;
-- desc one;
-- show tables ;

-- create table exam(
-- id int primary key auto_increment,
-- name varchar(50) not null ,
-- email varchar(20) unique,
-- age int check(age>18),
-- date timestamp default current_timestamp,
-- gender enum("male","female") not null ,
-- permissions set("read","write") not null,
-- preferences json not null
-- );
-- drop table exam;
-- desc exam;
-- show tables 
-- create table exams like exam;
-- insert into exams 
-- select * from exam;
-- select *from exams ;
-- drop  table exams,exam;
-- show tables ;

-- show tables ;
-- desc two;
-- select * from two;
-- alter table two disable keys;   -- not a base table 
-- select * from co;
-- create table exam 
-- select * from co;
-- select * from exam;

-- alter table exam disable keys ;
-- -- create index id 
-- -- on exam(order_id);


























