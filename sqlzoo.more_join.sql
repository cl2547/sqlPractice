-- 1
SELECT id, title
 FROM movie
 WHERE yr=1962;
-- 2
select yr
from movie
where title = 'Citizen Kane';
-- 3
select id, title, yr
from movie
where title like '%Star Trek%'
order by yr
-- 4
select id
from actor
where name = 'Glenn Close'
-- 5
select id
from movie
where title = 'Casablanca'
-- 6
select name
from actor join casting on (actorid=id)
where movieid=11768
-- 7
select name
from actor join casting on (actorid=id)
where movieid = (select id from movie where title =  'Alien')
-- 8
select title
from movie
where id in (select movieid from casting join actor on (actorid=id) where name = 'Harrison Ford' )
-- 9
select title
from movie
where id in (select movieid from casting join actor on (actorid=id) where name = 'Harrison Ford' and ord!=1)
-- 10
select title, name
from movie join casting on (movie.id = movieid) join actor on (actorid=actor.id)
where yr=1962 and ord=1
-- 11 (original)
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)
-- 12
select distinct title, name
from movie join casting on (movie.id=movieid) join actor on (actorid = actor.id)
where ord=1 and movieid in (
SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))

-- 13
select name
from actor join casting on (actor.id=actorid)
where ord =1
group by actorid, name
having count(movieid)>=30
order by name;

-- 14
select title, count(actorid)
from movie join casting on (movie.id=movieid) join actor on (actorid = actor.id)
where yr=1978
group by title
order by count(name) desc,title 

-- 15
select distinct name from actor join casting on (actorid=actor.id)
where movieid in (
select movieid
from casting join actor on (actorid=actor.id) 
where name = 'Art Garfunkel') and name != 'Art Garfunkel'