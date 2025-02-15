CREATE TABLE co (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(100) NOT NULL,
    c_num VARCHAR(15) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    a_type ENUM('Hen', 'Sheep', 'Goat', 'Pig', 'Cow', 'Buffalo') NOT NULL,
    quantity INT CHECK (quantity > 0),
    ppu DECIMAL(10,2) CHECK (ppu > 0),
    tp DECIMAL(10,2) GENERATED ALWAYS AS (quantity * ppu) STORED,
    os ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled', 'Returned') DEFAULT 'Pending',
    ps ENUM('Paid', 'Pending', 'Failed', 'Refunded') DEFAULT 'Pending',
    d_date DATE DEFAULT NULL,
    o_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
INSERT INTO co (c_name, c_num, email, address, a_type, quantity, ppu, os, ps, d_date)
VALUES
    ('Rahul Sharma', '9876543210', 'rahul@example.com', 'Delhi, India', 'Goat', 3, 5500.00, 'Pending', 'Paid', NULL),
    ('Amit Verma', '9898989898', 'amit@example.com', 'Mumbai, India', 'Hen', 15, 250.00, 'Shipped', 'Paid', '2025-02-12'),
    ('Sneha Gupta', '9123456789', 'sneha@example.com', 'Bangalore, India', 'Sheep', 5, 7000.00, 'Delivered', 'Paid', '2025-02-10'),
    ('Priya Kumar', '9871234567', 'priya@example.com', 'Hyderabad, India', 'Pig', 2, 12000.00, 'Cancelled', 'Refunded', NULL),
    ('Vikas Singh', '9822334455', 'vikas@example.com', 'Chennai, India', 'Cow', 1, 45000.00, 'Delivered', 'Paid', '2025-02-08'),
    ('Anjali Mehta', '9811223344', 'anjali@example.com', 'Kolkata, India', 'Buffalo', 2, 60000.00, 'Pending', 'Pending', NULL),
    ('Rohan Kapoor', '9900112233', 'rohan@example.com', 'Pune, India', 'Hen', 20, 230.00, 'Returned', 'Refunded', NULL);
    
select * from co;
-- set @cow_ppu = (select ppu from co where a_type = "cow");
-- update co
-- set ppu = @cow_ppu*1.05 where a_type = "buffalo" ;

-- DELETE o1 FROM co o1
-- JOIN co o2 
-- ON o1.c_name = o2.c_name 
-- AND o1.a_type = o2.a_type
-- AND o1.o_date = o2.o_date
-- AND o1.order_id > o2.order_id;

-- select c_name , max(tp) as maxi
-- from co 
-- group by c_name
-- order by maxi desc
-- limit 1;

-- SELECT c_name, SUM(tp) AS total_spent 
-- FROM co
-- GROUP BY c_name 
-- ORDER BY total_spent DESC 
-- LIMIT 1;
select * from co;
-- select distinct c_name from co;
-- select c_name from co where c_name like "a%" or c_name like  "r%";

-- select c_name , tp  from co
-- order by tp desc
-- limit 1 offset 1;

--  set @cou = (select count(*) from co) ;
-- set @cp =(select count(*) from co where os= "pending");

-- select (@cp/@cou)*100 as per ;

-- SELECT 
--     (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM  co)) AS pending_percentage
-- FROM co
-- WHERE os= 'Pending';
-- select a_type, count(*) as fre from co group by a_type order by fre desc limit 3;
-- select * from co;
-- set @one = (select c_name,tp  from co group by c_name order by tp desc );
-- select @one;
-- select c_name,tp as atp  from co group by c_name order by atp desc ;
-- create view two as  (select c_name , max(tp)  as mtp from co group by c_name order by mtp );
-- select distinct * from two;
-- select c_name , max(tp)  as mtp from co group by c_name order by mtp;

select * from co;
-- select a_type, tp from co  order by tp desc limit 3;

-- SELECT order_id, c_name, tp, 
--        RANK() OVER (ORDER BY tp DESC) AS price_rank 
-- FROM co;

-- select c_name , tp ,
-- rank() over(order by tp desc ) as ranks
-- from co;
update co
set c_name = "Aditi Cuddly" where c_name like "Anjali%";
select * from co;

-- select substring(address , ",",1) as city, sum(tp) as Stp from co group by city order by tp desc ;

-- create view three as (select o_date from co order by o_date ); 
-- set @two = (select o_date from co order by o_date limit 3 );

-- select o_date from co order by o_date limit 3 ;
-- set @tot = (select sum(tp) from co);
-- select a_type , round((tp/@tot),4)*100  as tot_con from co;

-- select c_name from co where tp> 50000;
-- set @two = (select avg(tp) from co);
-- select c_name,tp from co where tp>@two*1.2;
-- select @two ;

select max(datediff(d_date,o_date)) from co where d_date is not null;






























