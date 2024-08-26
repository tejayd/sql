# Write your MySQL query statement below

# select distinct customer_id from customer
# group by customer_id
# having count(distinct(product_key)) = (select count(*) from product);

# # Write your MySQL query statement below - SG
# with ideal as 
# (select * from (select distinct customer_id from Customer) as c
# cross join Product as p),

# list as 
# (select i.customer_id as c1, c.customer_id as c2
# from ideal as i 
# left join Customer as c
# on i.customer_id = c.customer_id and c.product_key = i.product_key)

# select distinct c1 as customer_id 
# from list as l
# where c1 not in (select c1 from list where c2 is null)








# select customer_id from customer
# group by 1
# having count(distinct(product_key)) = (select count(product_key) from product)

/*select customer_id
from customer
group by customer_id
having count(distinct product_key) = (select count(*) from Product)

*/

WITH buy_count AS (
    SELECT c.customer_id, COUNT(DISTINCT c.product_key) AS pro_count
    FROM customer c GROUP BY (c.customer_id)
)

SELECT bc.customer_id FROM buy_count bc 
WHERE bc.pro_count=(SELECT COUNT(*) FROM product)

























