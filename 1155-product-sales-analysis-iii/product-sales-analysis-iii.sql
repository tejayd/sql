# with cte1 as (select product_id, min(year) as first_year
# from sales
# group by product_id)

# select a.*,b.quantity, b.price
# from cte1 a left join sales b
# on a.product_id=b.product_id and a.first_year=b.year

/* with cte as (
select product_id, min(year) as first_year
from sales
group by product_id
)


select c.*, p.quantity, p.price
from cte as c
left join sales as p
on c.product_id = p.product_id
and c.first_year=p.year

*/

with first_year as(
    SELECT a.product_id, min(a.year) as first_year

    FROM SALES a GROUP BY (a.product_id) 
)

SELECT f.*,f1.quantity,f1.price FROM first_year f
JOIN sales f1
ON f.product_id=f1.product_id WHERE f.first_year=f1.year









