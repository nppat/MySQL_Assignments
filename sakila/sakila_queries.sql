USE sakila;  --  Select the sakila schema to use for the exercise

/* 1 )What query would you run to get all the customers inside city_id = 312?
Your query should return customer first name, last name, email, and address. */
SELECT customer.first_name AS first_name, customer.last_name AS last_name, # select fname,lname,email,address
customer.email, address
FROM customer # from table customer
LEFT JOIN address #left join table address
ON customer.address_id = address.address_id # on the address_id key
LEFT JOIN city #left join table city to be able to sort to city_id = 312
ON address.city_id = city.city_id # join on city_id
WHERE address.city_id = 312; # select records from city 312

/* 2) What query would you run to get all comedy films? Your query should return film title,
description, release year, rating, special features, and genre. */
SELECT film.title as title, film.release_year as realease_year,
film.rating as rating, film.special_features as special_features,category.name as genre
FROM film
LEFT JOIN film_category
ON film.film_id = film_category.film_id
LEFT JOIN category
ON film_category.category_id = category.category_id
WHERE category.name = "Comedy";


/* 3) What query would you run to get all the films joined by actor_id=5?
Your query should return the film title, description, and release year. */
SELECT film.title as title, film.description as description, film.release_year as release_year
FROM film
LEFT JOIN film_actor
ON film.film_id = film_actor.film_id
LEFT JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE actor.actor_id = 5;

/* 4) What query would you run to get all the customers in store_id = 1
and inside these cities (1, 42, 312 and 459)? Your query should return
customer first name, last name, email, and address. */
SELECT customer.first_name, customer.last_name, customer.email, address.address
FROM customer
LEFT JOIN store
ON customer.store_id = store.store_id
LEFT JOIN address
ON customer.address_id = address.address_id
LEFT JOIN city
ON address.city_id = city.city_id
WHERE store.store_id = 1
AND (city.city_id = 42 OR city.city_id = 1 OR
city.city_id = 42 OR city.city_id = 312 OR city.city_id = 459);

/* 5)What query would you run to get all the films with a "rating = G"
and "special feature = behind the scenes", joined by actor_id = 15?
Your query should return the film title, description, release year, rate,
and special feature. Hint: You may use LIKE function in getting the 'behind the scenes' part. */
SELECT film.title, film.description, film.release_year, film.rating, film.special_features
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
WHERE film.rating = 'G'
AND film_actor.actor_id = 15
AND film.special_features LIKE '%behind the scenes%';  # LIKE using '%..%' returns the pattern that you are looking for

/* 6) What query would you run to get all the actors that joined in
the film_id = 369? Your query should return the film_id, title, actor_id, and actor_name. */
SELECT film.film_id, film.title as title, CONCAT(actor.first_name," ",actor.last_name)
FROM film
JOIN film_actor
ON film.film_id = film_actor.film_id
JOIN actor
ON film_actor.actor_id = actor.actor_id
WHERE film_actor.film_id = 369;
/* 7) What query would you run to get all drama films with a rental rate of 2.99?
Your query should return film title, description, release year, rating, special features, and genre. */
SELECT film.title, film.description, film.release_year, film.rating, film.special_features, category.name as genre
FROM film
JOIN film_category
ON film.film_id = film_category.film_id
JOIN category
ON film_category.category_id = category.category_id
WHERE category.name = "Drama" AND film.rental_rate = 2.99;

/* 8) What query would you run to get all the action films which are
joined by SANDRA KILMER? Your query should return film title, description,
release year, rating, special features, genre, and actor's first name and last name. */
SELECT film.title, film.description, film.release_year, film.rating, film.special_features,
category.name as genre, CONCAT(actor.first_name, " ", actor.last_name) as actor
FROM film
JOIN film_category ON film.film_id = film_category.film_id
JOIN category ON film_category.category_id = category.category_id
JOIN film_actor ON film.film_id = film_actor.film_id
JOIN actor ON film_actor.actor_id = actor.actor_id
WHERE actor.first_name = "SANDRA" AND actor.last_name = "KILMER"
AND category.name = "Action";