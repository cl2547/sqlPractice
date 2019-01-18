-- 1
select count(id)
from stops;
-- 2
select id 
from stops
where name = 'Craiglockhart';
-- 3
select id, name
from stops join route on (id=stop)
where num = '4' and company = 'LRT';
-- 4
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
having  COUNT(*)=2;
-- 5
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE b.stop=149 and a.stop = 53;
-- 6
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'London Road';
-- 7
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop = 137
group by a.company, a.num;
-- 8
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' and stopb.name = 'Tollcross';
-- 9
SELECT stopb.name, a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
group by stopb.name, a.company, a.num;
-- 10
SELECT a.num, a.company, stops.name, c.num, c.company
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num),
 route c JOIN route d ON   (c.company=d.company AND c.num=d.num), stops
WHERE a.stop = (select id from stops where name = 'Craiglockhart' ) 
and c.stop = (select id from stops where name = 'Lochend' ) and b.stop=d.stop
and stops.id = d.stop;