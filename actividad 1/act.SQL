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
SELECT * FROM film f 
INNER JOIN inventory i on f.film_id = i.film_id 
INNER JOIN rental r on i.inventory_id = r.inventory_id
ORDER by 

