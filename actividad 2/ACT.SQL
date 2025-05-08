--Actividad 1
SELECT FirstName, LastName FROM employees
ORDER by FirstName ASC, LastName ASC

--Actividad 2
SELECT a.Title, t.Milliseconds from albums a
INNER JOIN tracks t
on a.AlbumId = t.AlbumId
WHERE Title like 'big ones'
ORDER by t.Milliseconds DESC--mayor a menor

--Actividad 3
SELECT g.name, count(t.name) as num_canciones FROM genres g
INNER JOIN tracks t
on t.GenreId = g.GenreId
GROUP by g.name
ORDER by num_canciones DESC


--Actividad 4
SELECT a.Title, count(t.name) as canciones FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
GROUP by t.name
HAVING canciones >= 5

--Actividad 5
SELECT a.Title, count(t.UnitPrice) as precio FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
GROUP by a.Title
ORDER by precio ASC LIMIT 5

--Actividad 6
SELECT a.Title, count(t.UnitPrice) as precio, g.name, t.name FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
INNER JOIN genres g
on g.GenreId = t.GenreId
GROUP by a.Title
ORDER by precio ASC 