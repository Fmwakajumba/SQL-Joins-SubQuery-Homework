
-- 1. List all customers who live in Texas (use JOINS)
SELECT customer_id, first_name, last_name, district
FROM customer
JOIN address
ON customer.address_id = address.address_id
WHERE district = 'Texas';

-- 2. Get all payments above $6.99 with the Customer's Full Name
SELECT payment_id, first_name, last_name, amount
FROM payment
JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- 3. Show all customers names who have made payments over $175(use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    GROUP BY customer_id
    HAVING SUM(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer_id, first_name, last_name, country
FROM customer
JOIN address
ON customer.address_id = address.address_id
JOIN city
ON address.city_id = city.city_id
JOIN country
ON city.country_id = country.country_id
WHERE country ='Nepal';

-- 5. Which staff member had the most transactions?
SELECT staff.staff_id, first_name, last_name, COUNT(*)
FROM payment
JOIN staff
ON payment.staff_id = staff.staff_id
GROUP BY staff.staff_id, first_name, last_name
ORDER BY COUNT(*) desc;

-- 6. How many movies of each rating are there?
select * from film 

-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select customer_id, first_name, last_name 
from customer 
where customer_id in ( 
	select amount
	from payment 
	group by amount
	having amount > 6.99
);

-- 8. How many free rentals did our stores give away?
select rental.rental_id, rental.inventory_id, rental.customer_id 
from rental 
join payment 
on rental.rental_id = payment.rental_id 
where amount = 0;

select * from payment 
order by amount asc;














