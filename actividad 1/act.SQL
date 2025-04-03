SELECT * FROM film where title
SELECT * FROM film where title like "apache divine"
SELECT * FROM film f INNER JOIN inventory i 
on f.film_id = i.film_id 
WHERE f.title = 'APACHE DIVINE'

SELECT * FROM film f 
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN store s on i.store_id = s.store_id
INNER JOIN address a on s.address_id = a.address_id
INNER JOIN city c on a.city_id = c.city_id
INNER JOIN country co on c.country_id = co.country_id 

WHERE f.title = 'APACHE DIVINE'

--Ejercicio 2
SELECT c.name, f.title, l.name,  FROM film f 
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN language l on f.language_id = l.language_id
INNER JOIN film_category fc on f.film_id = fc.film_id
INNER JOIN  category c on fc.category_id = c.category_id
WHERE f.title = 'APACHE DIVINE' and length between 60 and 120
  

--Ejercicio 3
SELECT st.first_name, st.last_name, co.country, c.city FROM staff st
INNER JOIN store s on st.store_id = s.store_id
INNER JOIN address a on s.address_id = a.address_id
INNER JOIN city c on a.city_id = c.city_id
INNER JOIN country co on c.country_id = co.country_id 


--Ejercicio 4
SELECT title, max(rental_date), min(return_date) FROM film f 
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN rental r on i.inventory_id = r.inventory_id



--Ejercicio 5

SELECT * FROM film f 
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN film_text ft on i.film_id = ft.film_id
INNER JOIN film_actor fa on f.film_id = fa.film_id
INNER JOIN language l on l.language_id = f.language_id
INNER JOIN film_category fc on fc.film_id = f.film_id
INNER JOIN category c on c.category_id = fc.category_id
INNER JOIN actor a on a.actor_id = fa.actor_id
INNER JOIN store s on i.store_id = s.store_id
INNER JOIN staff st on s.store_id = st.store_id
INNER JOIN payment p on st.staff_id = p.staff_id
INNER JOIN rental r on p.rental_id = r.rental_id
INNER JOIN address ad on s.address_id = ad.address_id
INNER JOIN city ci on ad.city_id = ci.city_id
INNER JOIN country co on ci.country_id = co.country_id 
INNER JOIN customer cu on ad.address_id = cu.address_id


--Ejercicio 6
SELECT count() rating
FROM film f
GROUP BY rating


--Ejercicio 7
SELECT count(*) AS cant_peliculas, c.name 
FROM category c
INNER JOIN film f on f.film_id = fc.film_id
INNER JOIN film_category fc on fc.category_id = c.category_id 
GROUP BY c.name


--Ejercicio 8
SELECT a.first_name, a.last_name, count(a.actor_id) as "cant_actor", f.title
FROM film f
INNER JOIN film_actor fa on fa.film_id = f.film_id
INNER JOIN actor a on a.actor_id = fa.actor_id
GROUP BY fa.film_id
ORDER BY cant_actor DESC LIMIT 10 


--Ejercicio 9
SELECT c.city, co.country, count(i.film_id) FROM  inventory i
INNER JOIN store s on i.store_id = s.store_id
INNER JOIN address a on s.address_id = a.address_id
INNER JOIN city c on a.city_id = c.city_id
INNER JOIN country co on c.country_id = co.country_id 
GROUP BY a.address_id


--Ejercicio 10
SELECT c.city, co.country, count(f.title) as cont_peliculas FROM film f 
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN store s on i.store_id = s.store_id
INNER JOIN address a on s.address_id = a.address_id
INNER JOIN city c on a.city_id = c.city_id
INNER JOIN country co on c.country_id = co.country_id 
GROUP BY a.address_id



--Ejercicio 11
SELECT avg(f.rental_rate * f.rental_duration) AS promedio, c.name
FROM film f 
INNER JOIN film_category fc on fc.film_id = f.film_id
INNER JOIN category c on c.category_id = fc.category_id
GROUP BY c.name




--Ejercicio 12
SELECT f.rental_duration as dias, f.rental_rate as cost_dias, (f.rental_duration * f.rental_rate) as costo_total, min(return_date) as fecha_min, max(rental_date) as fecha_max
FROM film f
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN rental r on  i.inventory_id = r.inventory_id
WHERE f.title = 'ALABAMA DEVIL'
