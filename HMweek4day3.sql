--question 1


SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

--question 2

SELECT first_name, last_name
FROM customer
INNER JOIN payment
on payment.customer_id = customer.customer_id
WHERE amount > 6.99; 


--question 3

SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
    ORDER BY SUM(amount) DESC
    LIMIT 10
);

--question 4

SELECT first_name, last_name
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id
INNER JOIN city
ON address.city_id = city.city_id
INNER JOIN country
ON country.country_id = city.country_id
WHERE country = 'Nepal';

--question 5

SELECT first_name, last_name, COUNT(payment.staff_id)
FROM staff
INNER JOIN payment
ON staff.staff_id = payment.staff_id
GROUP BY first_name, last_name
ORDER BY COUNT(payment.staff_id) DESC;
--question 6

SELECT rating, COUNT(inventory_id)
FROM film 
INNER JOIN inventory
ON film.film_id = inventory.film_id
GROUP BY rating


--question 7
SELECT first_name, last_name 
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY payment.amount, payment.customer_id
    HAVING amount < 6.99
);

--question 8

