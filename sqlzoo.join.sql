-- 1
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER';
-- 2
SELECT id,stadium,team1,team2
  FROM game
where id=1012;
-- 3
SELECT player,teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
where teamid = 'GER'
-- 4
select team1, team2, player
from goal join game on(id=matchid)
where player LIKE 'Mario%';
-- 5
SELECT player, teamid, coach, gtime
  FROM goal join eteam on (teamid=id)
 WHERE gtime<=10
-- 6
select mdate, teamname
from game join eteam on (eteam.id=team1)
where coach =  'Fernando Santos';
-- 7
select player
from goal join game on (id = matchid)
where stadium='National Stadium, Warsaw'
-- 8
SELECT DISTINCT player
  FROM game JOIN goal g1 ON matchid = id 
    WHERE (team1='GER' or team2='GER') and teamid != 'GER';

-- 9
SELECT teamname, COUNT(player)
  FROM eteam JOIN goal ON id=teamid
 group BY teamname;
-- 10
select stadium, count(player)
from game join goal on (id=matchid)
group by stadium;
-- 11
SELECT matchid,mdate, count(player)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
group by matchid,mdate
-- 12
select matchid, mdate, count(player)
from goal join game on (matchid= id)
where teamid = 'GER'
group by mdate, matchid
-- 13
SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1,
team2,
  sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END)  score2
  FROM game LEFT JOIN goal ON matchid = id
group by mdate, team1, team2
order by mdate, matchid, team1, team2;
