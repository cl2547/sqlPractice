/*
Enter your query here.
*/
select concat(name, '(', CASE WHEN occupation='Doctor' then 'D' WHEN occupation='Singer' then 'S' WHEN occupation='Actor' then 'A' when occupation='Professor' then 'P' end, ')')
from OCCUPATIONS
order by name;

select concat('There are a total of', ' ', count(name),' ', lower(occupation), 's.')
from OCCUPATIONS
group by occupation
order by count(name), occupation;