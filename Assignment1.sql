SELECT
    first_name,
    active
FROM sakila.customer
WHERE first_name LIKE 'J%'
  AND active = 1;
  --------------------------------------
  
  SELECT
    title,
    description
FROM sakila.film
WHERE title LIKE '%ACTION%'
   OR description LIKE '%WAR%';
   --------------------------------------------
   
SELECT
    first_name,
    last_name,
    email
FROM sakila.customer
WHERE last_name <> 'SMITH'
  AND first_name LIKE '%a';
  -----------------------------------------
  
  
  SELECT
    rental_rate,
    replacement_cost
FROM sakila.film
WHERE rental_rate > 3.0
  AND replacement_cost IS NOT NULL;
  
  -----------------------------
  SELECT
    first_name,
    active
FROM sakila.customer
WHERE first_name LIKE 'J%'
  AND active = 1;
  
  ----------------------------------------
  
  SELECT 
    store_id,
    COUNT(*) AS active_customers_count
FROM 
    sakila.customer
WHERE 
    active = 1
GROUP BY 
    store_id;
    
    ------------------------------------
    
    SELECT
    DISTINCT rating
FROM sakila.film
ORDER BY rating;
  ---------------------------------
  
  SELECT 
    rental_duration,
    COUNT(*) AS number_of_films,
    AVG(length) AS avg_length
FROM 
    sakila.film
GROUP BY 
    rental_duration
HAVING 
    AVG(length) > 100;
    -------------------------------
    
    SELECT 
    DATE(payment_date) AS payment_day,
    COUNT(*) AS total_payments,
    SUM(amount) AS total_amount
FROM 
    sakila.payment
GROUP BY 
    DATE(payment_date)
HAVING 
    COUNT(*) > 100
ORDER BY 
    payment_day;
    
    --------------------------------------
    SELECT
    email,
    active
FROM sakila.customer
WHERE email LIKE '%.org'
or email is NULL;
-------------------------------
    
    SELECT
    title, rating, rental_rate
FROM sakila.film
WHERE rating IN ('PG', 'G')
ORDER BY rental_rate DESC;
----------------------------------------------
SELECT 
length, 
COUNT(*) AS film_count
FROM sakila.film
WHERE title LIKE 'T%'
GROUP BY length
HAVING COUNT(*) > 5;
--------------------------------------
