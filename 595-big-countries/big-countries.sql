#select name,  population, area from World where area >= 3000000 or population >= 25000000;

# Write your MySQL query statement below - SG
select w.name , w.population, w.area 
from World as w
where w.population >= 25000000 or w.area >= 3000000