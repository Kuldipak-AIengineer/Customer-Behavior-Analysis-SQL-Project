-- How many customers registered in the first six months of 2017? Name the column registration_count.
select count(*) as registration_count
from customers
where registration_date BETWEEN '2017-01-01' AND '2017-06-30';

-- Show the number of registrations in the current week. Name the column registrations_current_week.
select count(*) as registrations_current_week
from customers
where YEARWEEK(registration_date, 1) = YEARWEEK(CURDATE(), 1);

-- Create a report containing the 2017 monthly registration counts.
-- Show the registration_month and registration_count columns. Order the results by month.
select month(registration_date) as registration_month ,
count(*) as registration_count from customers
where year(registration_date) = 2017
group by month(registration_date)
order by registration_month

-- Find the registration count for each month in each year.
-- Show the following columns: registration_year, registration_month, and registration_count. 
-- Order the results by year and month.

select YEAR(registration_date) AS registration_year,
    ch.channel_name,
    COUNT(*) AS registration_count
FROM customers c
JOIN channels ch ON c.channel_id = ch.id
GROUP BY registration_year, ch.channel_name
ORDER BY registration_year, ch.channel_name;

-- Write an SQL query to find the number of customer registrations per year for each channel.

SELECT 
    COUNT(DISTINCT CASE WHEN first_order_date IS NOT NULL THEN customer_id END) AS customers_with_purchase,
    COUNT(*) AS all_customers
FROM customers
WHERE YEAR(registration_date) = 2017;

-- Conversion per Channel (as %)
SELECT 
    ch.channel_name,
    ROUND(100.0 * COUNT(CASE WHEN first_order_date IS NOT NULL THEN 1 END) / COUNT(*), 2) AS conversion_rate
FROM customers c
JOIN channels ch ON c.channel_id = ch.id
GROUP BY ch.channel_name;

-- Days Between Registration and First Order (for each customer)
SELECT email, DATEDIFF(first_order_date, registration_date) AS difference
FROM customers
WHERE first_order_date IS NOT NULL;

-- Average Time to First Order by Channel
SELECT ch.channel_name,
    ROUND(AVG(DATEDIFF(first_order_date, registration_date)), 1) AS avg_days_to_first_order
FROM customers c
JOIN channels ch ON c.channel_id = ch.id
WHERE first_order_date IS NOT NULL
GROUP BY ch.channel_name;

-- Customers Who Stopped Ordering
SELECT email, full_name, first_order_date, last_order_date
FROM customers
WHERE 
    DATEDIFF(first_order_date, registration_date) <= 30 AND
    DATEDIFF(last_order_date, registration_date) <= 90;

-- Monthly Conversion Chart Breakdown
SELECT
    YEAR(registration_date) AS year,
    MONTH(registration_date) AS month,
    COUNT(*) AS registered_count,
    SUM(CASE WHEN first_order_date IS NULL THEN 1 ELSE 0 END) AS no_sale,
    SUM(CASE WHEN DATEDIFF(first_order_date, registration_date) <= 3 THEN 1 ELSE 0 END) AS three_days,
    SUM(CASE WHEN DATEDIFF(first_order_date, registration_date) BETWEEN 4 AND 7 THEN 1 ELSE 0 END) AS first_week,
    SUM(CASE WHEN DATEDIFF(first_order_date, registration_date) > 7 THEN 1 ELSE 0 END) AS after_first_week
FROM customers
WHERE YEAR(registration_date) = 2017
GROUP BY year, month
ORDER BY year, month;



-- Show customers' emails and interval between their first purchase and the date of registration. Name the column difference.
SELECT email,
    DATEDIFF(first_order_date, registration_date) AS difference
FROM customers
WHERE first_order_date IS NOT NULL;

-- Find the average time from registration to first order for each channel. Show two columns: channel_name and avg_days_to_first_order.
SELECT ch.channel_name,
    ROUND(AVG(DATEDIFF(first_order_date, registration_date)), 1) AS avg_days_to_first_order
FROM customers c
JOIN channels ch ON c.channel_id = ch.id
WHERE first_order_date IS NOT NULL
GROUP BY ch.channel_name;


--  Calculate the average number of days between registration and first order in quarterly registration basis.
SELECT 
    YEAR(registration_date) AS year,
    QUARTER(registration_date) AS quarter,
    ROUND(AVG(DATEDIFF(first_order_date, registration_date)), 1) AS avg_days_to_first_order
FROM customers
WHERE first_order_date IS NOT NULL
GROUP BY year, quarter
ORDER BY year, quarter;



-- Create a report of the average time to first order for weekly registration basis from 2017 in each registration channel.
SELECT 
    WEEK(registration_date, 1) AS week,
    ch.channel_name,
    ROUND(AVG(DATEDIFF(first_order_date, registration_date)), 1) AS avg_days_to_first_order
FROM customers c
JOIN channels ch ON c.channel_id = ch.id
WHERE YEAR(registration_date) = 2017 AND first_order_date IS NOT NULL
GROUP BY week, ch.channel_name
ORDER BY week;


-- Find all customers who placed their first order within one month from registration, and their last order within three months from registration.
SELECT email,full_name,first_order_date,last_order_date
FROM customers
WHERE 
    DATEDIFF(first_order_date, registration_date) <= 30 AND
    DATEDIFF(last_order_date, registration_date) <= 90;






