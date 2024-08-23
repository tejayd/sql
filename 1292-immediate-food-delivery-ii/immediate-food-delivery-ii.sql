-- with cte as (
-- select customer_id, order_date from (
-- select customer_id, row_number() over(partition by customer_id order by order_date ) as rank2, order_date
-- from Delivery
-- ) as t
-- where rank2 =1
-- ),

-- cte2 as (
--   select a.customer_id
--   from Delivery a
--   join cte b
--   on a. customer_id =b.customer_id
--   and b.order_date=a.customer_pref_delivery_date
-- )

-- select round(100*count(b.customer_id)/count(a.customer_id),2) as "immediate_percentage"
-- from cte a
-- left join cte2 b
-- on a.customer_id = b.customer_id



/*with cte as (
select * from (
select delivery_id
,customer_id
,order_date
,customer_pref_delivery_date
,row_number() over(partition by customer_id order by order_date asc) as ranks
from Delivery
group by 1,2,3,4
) as Temp 
where ranks=1
)

select round(avg(case when order_date=customer_pref_delivery_date then 1 else 0 end)*100.0,2) as immediate_percentage
from cte


*/




select round(SUM(case when order_date=customer_pref_delivery_date then 1 else 0 end)/count(*) * 100,2) as immediate_percentage from (select customer_id,min(order_date) as early_date from delivery group by (customer_id)) A
left join delivery B
on A.customer_id=B.customer_id and A.early_date=B.order_date









