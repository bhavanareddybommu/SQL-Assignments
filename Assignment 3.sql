SELECT c.*
FROM sakila.customer c
JOIN sakila.payment p
    ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(p.payment_id) > 5;
---------------------------
SELECT 
    a.first_name,
    a.last_name
FROM sakila.actor a
JOIN sakila.film_actor fa
    ON a.actor_id = fa.actor_id
GROUP BY 
    a.actor_id,
    a.first_name,
    a.last_name
HAVING COUNT(fa.film_id) > 10;
-----------------------------
SELECT 
    c.first_name,
    c.last_name
FROM sakila.customer c
 JOIN sakila.payment p
    ON c.customer_id = p.customer_id
WHERE p.payment_id IS NULL;
-----------------------------------
SELECT 
    f.film_id,
    f.title,
    f.rental_rate
FROM sakila.film f
JOIN (
    SELECT AVG(rental_rate) AS avg_rental_rate
    FROM sakila.film
) avg_table
ON f.rental_rate > avg_table.avg_rental_rate;
------------------------
SELECT DISTINCT
    f.title
FROM sakila.film f
LEFT JOIN sakila.inventory i
    ON f.film_id = i.film_id
LEFT JOIN sakila.rental r
    ON i.inventory_id = r.inventory_id
WHERE r.rental_id IS NULL;
----------------------------------
SELECT DISTINCT
    c.customer_id,
    c.first_name,
    c.last_name
FROM sakila.customer c
JOIN sakila.rental r
    ON c.customer_id = r.customer_id
WHERE DATE_FORMAT(r.rental_date, '%Y-%m') IN (
    SELECT DISTINCT DATE_FORMAT(rental_date, '%Y-%m')
    FROM sakila.rental
    WHERE customer_id = 5
)
AND c.customer_id <> 5;

------------------------------------------

SELECT DISTINCT
    s.staff_id,
    s.first_name,
    s.last_name,
    s.email
FROM sakila.staff s
JOIN sakila.payment p
    ON s.staff_id = p.staff_id
WHERE p.amount > (
    SELECT AVG(amount)
    FROM sakila.payment
);

--------------------------------------------------------------

SELECT 
    title,
    rental_duration
FROM sakila.film
WHERE rental_duration > (
    SELECT AVG(rental_duration)
    FROM sakila.film
);

-----------------------------------------

SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    c.address_id
FROM sakila.customer c
WHERE c.address_id = (
    SELECT address_id
    FROM sakila.customer
    WHERE customer_id = 1
)
AND c.customer_id <> 1;

-----------------------------

SELECT p.*
FROM sakila.payment p
JOIN (
    SELECT AVG(amount) AS avg_amount
    FROM sakila.payment
) avg_table
ON p.amount > avg_table.avg_amount;