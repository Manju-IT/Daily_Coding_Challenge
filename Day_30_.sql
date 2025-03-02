### Task:   Calculate the total sales revenue for each category (Clothing, Beauty, Electronics) and identify the top-performing category.

-- use one;
-- show tables ;
-- # Tables_in_one
select * from retail;
select category , sum(total_sale) as Total_Sales from retail group by category order by category desc ;     
/*
' category',' Total_Sales'
'Electronics', '311445'
'Clothing', '309995'
'Beauty', '286790'
*/
### Task: Analyze the distribution of customers by gender and age group (e.g., 18-25, 26-35, 36-45, etc.). Identify which age group and gender contribute the most to sales.

select case
 when age between 18 and 25 then "18-25"
 when age between 26 and 35 then "26-35"
 when age between 36 and 45 then "36-45"
 when age between 46 and 55 then "46-55"
 when age between 56 and 65 then "56-65"
else "65+"
end as group_age , gender , sum(total_sale) as tot_sales from retail group by  group_age , gender order by  tot_sales  desc;

### Task: Analyze sales trends over time. Identify the month with the highest sales and the day of the week with the most transactions.

-- alter table retail 
-- rename column ï»¿transactions_id  to transaction;

select * from retail;
select 
	DATE_FORMAT(sale_date,'%Y-%M') as month ,
    sum(total_sale) as tot_sales 
from retail 
group by month  
order by tot_sales desc ;

-- select 
-- 	DATE_FORMAT(sale_date,'%Y-%M-%D-%W') as Day ,
--     sum(total_sale) as tot_sales 
-- from retail 
-- group by Day 
-- order by tot_sales desc ;

select 
	dayname(sale_date) as Day ,
    sum(total_sale) as tot_sales 
from retail 
group by Day 
order by tot_sales desc ;

select * from retail;

### Task: Identify the top 5 products (based on price_per_unit and quantiy) that generate the most revenue.

-- select  transaction, category , total_sale from retail group by transaction, category , total_sale order by total_sale desc;

select 
		category, price_per_unit , quantiy, sum(total_sale) as tot_sales 
        from retail 
        group by category, price_per_unit , quantiy 
        order by tot_sales desc ;
### Task: Identify the top 10 customers who have made the most purchases (based on total_sale)

select
 customer_id , sum(total_sale) as Tot_sales
 from retail
 group by customer_id 
 order by Tot_sales desc limit 10;
 
select * from retail;
 
 ### Task: Calculate the profit for each transaction (Profit = total_sale - cogs) and identify the most profitable transactions.

select 
			 transaction , (total_sale-cogs) as Profit from retail  order by Profit Desc limit 1;

### Task: Segment customers based on their total spending (e.g., High Spenders, Medium Spenders, Low Spenders) and analyze the average spend per segment.

set @av = (select round(avg(total_sale)) from retail );
-- select @av ;
-- select
-- 				category ,
--                 case when total_sale >@av then " High Spenders" else "Low Spenders"  end as Type_spenders ,
--                 sum(total_sale) as tot
--                 from retail 
--                 group by category,Type_spenders  
--                 order by tot desc;

-- SELECT 
--     customer_id,
--     SUM(total_sale) AS total_spent,
--     CASE 
--         WHEN SUM(total_sale) > 5000 THEN 'High Spender'
--         WHEN SUM(total_sale) BETWEEN 1000 AND 5000 THEN 'Medium Spender'
--         ELSE 'Low Spender'
--     END AS customer_segment
-- FROM retail
-- GROUP BY customer_id
-- ORDER BY total_spent DESC;

select
				customer_id,
                case when total_sale >@av then " High Spenders" else "Low Spenders"  end as Type_spender,
                sum(total_sale) as tot
                from retail 
                group by customer_id, Type_spender
                order by tot desc;

### Task: Calculate the ROI for each category (ROI = (Total Revenue - Total COGS) / Total COGS).

select 
            category , (sum(total_sale)-sum(cogs))/sum(cogs) as ROI 
            from retail 
            group by category
            order by ROI desc;
select * from retail;

### Task: Identify products that are frequently sold out (based on quantiy and price_per_unit) and suggest restocking strategies.

select 
			quantiy , price_per_unit , sum(total_sale)  as tot from retail group by quantiy , price_per_unit  order by tot desc ;
            
### Task: Identify customers who have made repeat purchases and calculate their average spending per transaction.

-- select 
-- 		customer_id , sum(total_sale) sum ,round(avg(total_sale)) avg 
--         from retail 
--         group by customer_id 
--         order by sum desc ;
select customer_id , count(transaction) as num_tran , round(avg(total_Sale)) as tot from 
retail group by customer_id order by customer_id ;

with cte as  (
        select customer_id , count(transaction) as num_tran , round(avg(total_Sale)) as tot from 
		retail group by customer_id order by customer_id )  select sum(num_tran) , round(avg(tot)) from cte ;
        
### Task: Analyze if there are any seasonal trends in sales (e.g., higher sales during holidays or specific months).

-- select 
-- year(sale_date) as yr, count(year(sale_date))
--  from retail
--  group by  yr ;

select * from retail ;

select 
			case when month(sale_date) between 4 and 7 then "Summer" 
                    when month(sale_date) between 8 and 11 then "Rainy" 
                    else "Winter" end As season ,
			sum(total_sale)  as tot from retail where year(sale_date) = 2022 group by season order by tot desc ;
-- union all 
select 
			case when month(sale_date) between 4 and 7 then "Summer" 
                    when month(sale_date) between 8 and 11 then "Rainy" 
                    else "Winter" end As season ,
			sum(total_sale)  as tot from retail where year(sale_date) = 2023 group by season order by tot desc  INTO OUTFILE 'C:\ProgramData\MySQL\MySQL Server 8.0\Uploads\all.xlsx'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';

-- SELECT 
--     DATE_FORMAT(sale_date, '%Y-%m') AS month,
--     SUM(total_sale) AS total_sales
-- FROM retail
-- GROUP BY month
-- ORDER BY month;

SHOW VARIABLES LIKE 'secure_file_priv';

-- SELECT 
--     CASE 
--         WHEN MONTH(sale_date) BETWEEN 4 AND 7 THEN 'Summer'
--         WHEN MONTH(sale_date) BETWEEN 8 AND 11 THEN 'Rainy'
--         ELSE 'Winter' 
--     END AS season,
--     SUM(total_sale) AS tot
-- FROM retail
-- WHERE YEAR(sale_date) = 2023
-- GROUP BY season
-- ORDER BY tot DESC
-- INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/all.csv'
-- FIELDS TERMINATED BY ','
-- ENCLOSED BY '"'
-- LINES TERMINATED BY '\n';

-- ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Mysql@19020';
-- FLUSH PRIVILEGES;

































