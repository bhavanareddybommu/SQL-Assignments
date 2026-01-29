SELECT 
    first_name,
    last_name,
    store_id,
    COUNT(*) AS duplicate_count
FROM sakila.customer
GROUP BY 
    first_name,
    last_name,
    store_id
HAVING COUNT(*) > 1;

-------------------------

SELECT 
    title,
    LENGTH(LOWER(description)) 
    - LENGTH(REPLACE(LOWER(description), 'a', '')) AS a_count
FROM sakila.film;

----------------------------------

SELECT 
    SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'a', ''))) AS a_count,
    SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'e', ''))) AS e_count,
    SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'i', ''))) AS i_count,
    SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'o', ''))) AS o_count,
    SUM(LENGTH(LOWER(description)) - LENGTH(REPLACE(LOWER(description), 'u', ''))) AS u_count
FROM sakila.film;

--------------------------------------

SELECT 
    customer_id,
    WEEK(payment_date) AS payment_week,
    YEAR(payment_date)  AS payment_year,
    MONTH(payment_date) AS payment_month,
    SUM(amount) AS total_amount
FROM sakila.payment
GROUP BY 
    customer_id,
    WEEK(payment_date),
    YEAR(payment_date),
    MONTH(payment_date)
ORDER BY 
    customer_id,
    payment_week,
    payment_year,
    payment_month;
    
    
    SELECT 
    customer_id,
    YEAR(payment_date)  AS payment_year,
    MONTH(payment_date) AS payment_month,
    SUM(amount) AS total_amount
FROM sakila.payment
GROUP BY 
    customer_id,
    YEAR(payment_date),
    MONTH(payment_date)
ORDER BY 
    customer_id,
    payment_year,
    payment_month;
    
    SELECT 
    customer_id,
    YEAR(payment_date) AS payment_year,
    SUM(amount) AS total_amount
FROM sakila.payment
GROUP BY 
    customer_id,
    YEAR(payment_date)
ORDER BY 
    customer_id,
    payment_year;
------------------------------------------

SELECT 
    CASE 
        WHEN (YEAR('2025-01-01') % 4 = 0) 
        THEN 'Leap Year'
        ELSE 'Not a Leap Year'
    END AS leap_year_result;
    
    
    -------------------------------------
    
   SELECT 
    payment_date,
    CONCAT('Q', QUARTER(payment_date)) AS quarter
FROM sakila.payment;
