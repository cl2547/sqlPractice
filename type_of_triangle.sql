/*
Enter your query here.
*/
select 
case when A+B<=C or B+C<=A or A+C<=B then 'Not A Triangle'
 when A=B and A=C then 'Equilateral' 
 when A=C or B=C or A=B then 'Isosceles'
 when A!=C and A!=B and B!=C then 'Scalene' end
from TRIANGLES