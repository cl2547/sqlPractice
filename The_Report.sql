select case when grade>=8 then name else NULL end,  grade, marks
from Students join Grades on (marks <= max_mark and min_mark <= marks)
order by grade desc, name, marks