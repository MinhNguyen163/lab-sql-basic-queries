-- selecting sakila db
use sakila;

-- 1. Display all available tables in the Sakila database.
show tables;

-- 2. Retrieve all the data from the tables actor, film and customer.
select *
from actor;

select *
from film;



select *
from customer;

-- 3. Retrieve the following columns from their respective tables:
-- 3.1 Titles of all films from the film table
select title as film_title
from film;

-- 3.2 List of languages used in films, with the column aliased as language from the language table
select f.title as film_title, f.language_id, lang.name as language
from film as f
join  language as lang on f.language_id = lang.language_id;
-- seeing the result with 1000 rows, but only English as language, therefore I checked for distinct language_id column in table film to make sure the join is correct
select distinct language_id
from film;

-- 3.3 List of first names of all employees from the staff table
select first_name
from staff;

-- 4. Retrieve unique release years
select distinct release_year
from film;

-- Counting records for database insights:
-- 5.1 Determine the number of stores that the company has.
select count(store_id)
from store;

-- 5.2 Determine the number of employees that the company has.
select count(staff_id)
from staff;

-- 5.3 Determine how many films are available for rent and how many have been rented.
-- how many films are available for rent: 958 films/1000 films present in the film table
select count(distinct film_id)
from inventory;
-- in term of inventory, there are 4581 videos (of 958 films) can be rented
select count(inventory_id)
from inventory;
-- how many films have been rented: result is 958 films using the following code to retrieve the total amount of films have been rented
select  count(distinct i.film_id)
from inventory as i
left join rental as r on i.inventory_id = r.inventory_id;
-- however, in term of inventory, there are 4580 videos have been rented (out of 16045 rentals)
select count(distinct inventory_id)
from rental;

-- 5.4 Determine the number of distinct last names of the actors in the database.
select count(distinct last_name)
from actor;

-- 6. Retrieve the 10 longest films.
select *
from film 
order by length 
desc
limit 10;

-- 7. Use filtering techniques in order to:
-- 7.1 Retrieve all actors with the first name "SCARLETT".
select *
from actor
where first_name = "SCARLETT";

-- BONUS:

-- 7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
select *
from film
where (title like "%ARMAGEDDON%")
		and (length > 100)
;
-- Hint: use LIKE operator. More information here.

-- 7.3 Determine the number of films that include Behind the Scenes content
select count(film_id)
from film
where special_features like "%Behind the Scenes%"
;
