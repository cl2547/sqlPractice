-- 1
select name
from teacher
where dept is null;
-- 2 (given)
SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id);
-- 3
SELECT teacher.name, dept.name
 FROM teacher left JOIN dept
           ON (teacher.dept=dept.id);
-- 4
SELECT teacher.name, dept.name
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id);
-- 5
select name, COALESCE (mobile, '07986 444 2266')
from teacher;
-- 6
SELECT teacher.name, COALESCE(dept.name, 'None')
 FROM teacher left JOIN dept
           ON (teacher.dept=dept.id);
-- 7
select count(name), count(mobile)
from teacher;
-- 8
SELECT dept.name, count(teacher.name)
 FROM teacher right JOIN dept
           ON (teacher.dept=dept.id)
group by dept.name;
-- 9
select name, case when dept=1 or dept=2 then 'Sci' else 'Art'  end
from teacher;

-- 10
select name, case when dept=1 or dept=2 then 'Sci' when dept=3 then 'Art' else 'None'  end
from teacher;