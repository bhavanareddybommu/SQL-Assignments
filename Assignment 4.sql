SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    f.film_id,
    f.title
FROM sakila.customer c
JOIN sakila.rental r
    ON c.customer_id = r.customer_id
JOIN sakila.inventory i
    ON r.inventory_id = i.inventory_id
JOIN sakila.film f
    ON i.film_id = f.film_id
ORDER BY c.customer_id, f.film_id;

---------------------------------
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS rental_count
FROM sakila.customer c
LEFT JOIN sakila.rental r
    ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
ORDER BY c.customer_id;
-----------------------------
SELECT 
    f.film_id,
    f.title,
    c.name AS category
FROM sakila.film f
LEFT JOIN sakila.film_category fc
    ON f.film_id = fc.film_id
LEFT JOIN sakila.category c
    ON fc.category_id = c.category_id
ORDER BY f.film_id;
-----------------------------
SELECT c.email AS email
FROM sakila.customer c
LEFT JOIN sakila.staff s
    ON c.email = s.email

UNION

SELECT s.email AS email
FROM sakila.customer c
RIGHT JOIN sakila.staff s
    ON c.email = s.email;
--------------------------------------

SELECT
 a.actor_id,
 a.first_name,
 a.last_name
FROM sakila.actor a
JOIN sakila.film_actor fa
    ON a.actor_id = fa.actor_id
JOIN sakila.film f
    ON fa.film_id = f.film_id
WHERE f.title = 'ACADEMY DINOSAUR';
--------------------------------
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    COUNT(r.rental_id) AS total_rentals
FROM sakila.customer c
JOIN sakila.rental r
    ON c.customer_id = r.customer_id
GROUP BY 
    c.customer_id,
    c.first_name,
    c.last_name
HAVING COUNT(r.rental_id) > 5
ORDER BY total_rentals DESC;



