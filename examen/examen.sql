-- 1
SELECT a.Title, count(t.name) as canciones FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
WHERE a.Title like 'unplugged'
GROUP by a.Title

-- 2
SELECT ar.name, count(t.name) as canciones FROM albums a
INNER JOIN tracks t
on t.AlbumId = a.AlbumId
INNER JOIN artists ar
on ar.ArtistId = a.ArtistId
GROUP by ar.name
HAVING canciones  >= 30 
ORDER by canciones DESC

-- 3
INSERT into tracks( name, MediaTypeId, Composer, Milliseconds,UnitPrice)
VALUES( "La incondicional", 3, "Luis Miguel", "331189",  "0.99"),
( "Culpa mia", 4, "Romeo santos", "331745", "1.99"),
( "Boda", 4, "Romeo santos", "331731",  "1.99"),
( "Me matas", 1, "Ken-Y", "331476",  "0.99"),
( "Un sueño", 1, "Ken-Y", "331280",  "1.99"),
( "Debate de 4", 5, "Romeo santos", "251280", "0.99")


-- 4
UPDATE tracks
SET name = "Calienta el sol", Milliseconds = "343719"
WHERE TrackId = 3508


-- 5
DELETE FROM tracks
WHERE  TrackId BETWEEN  3506 and 3507 