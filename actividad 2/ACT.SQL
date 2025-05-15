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
SELECT a.Title, g.name, t.name, t.UnitPrice as precio FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
INNER JOIN genres g
on g.GenreId = t.GenreId
WHERE t.UnitPrice = 0.99
GROUP by a.Title


--Actividad 7
SELECT a.Title, ar.name, t.name, t.Milliseconds as Duracion FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
INNER JOIN artists ar
on ar.ArtistId = a.ArtistId
ORDER by t.Milliseconds ASC LIMIT 20


--Actividad 8
SELECT e.LastName AS ApellidoEmpleado, e.Title AS Puesto, em.LastName AS ApellidoJefe,COUNT(c.CustomerId) AS CantidadClientes  
FROM employees e
INNER JOIN employees em
on e.ReportsTo = em.EmployeeId
INNER JOIN customers c
on c.SupportRepId = e.EmployeeId
GROUP by e.LastName
ORDER by CantidadClientes DESC


--Actividad 9
INSERT into tracks( name, MediaTypeId, Composer, Milliseconds,UnitPrice)
VALUES( "La incondicional", 3, "Luis Miguel", "331189",  "0.99"),
( "Culpa mia", 4, "Romeo santos", "331745", "1.99"),
( "Boda", 4, "Romeo santos", "331731",  "1.99"),
( "Me matas", 1, "Ken-Y", "331476",  "0.99")

--Actividad 10
SELECT * FROM tracks
WHERE TrackId >= 3504

--Actividad 11
UPDATE tracks
SET name = "Calienta el sol", Milliseconds = "343719"
WHERE TrackId = 3507;
UPDATE tracks
SET name = "beso", Milliseconds = "348910"
WHERE TrackId = 3506;

--Actividad 12
SELECT * FROM tracks
WHERE TrackId >= 3506

--actividad 13
DELETE FROM tracks
WHERE  TrackId BETWEEN  3506 and 3507 

