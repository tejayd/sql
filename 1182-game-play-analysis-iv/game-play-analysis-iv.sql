-- with cte as (
--   select a.player_id, b.event_date
--   from Activity a 
--   join Activity b
--   on a.event_date = Date_add(b.event_date, interval 1 day)
--   and a.player_id=b.player_id
-- ),
-- cte2 as(
--   select player_id, min(event_date) as event_date2
--   from Activity
--   group by player_id
-- ),
-- cte3 as (
--   select a.player_id
--   from cte a
--   join cte2 b
--   on a.player_id=b.player_id
--   and a.event_date = b.event_date2
-- )
-- select round(count(*)/(select count(*) from cte2),2) as fraction
--  from cte3

/*
with cte as (
select 
player_id
, min(event_date) as min_date
from Activity
group by 1
)

, cte2 as (
select a1.player_id
from cte as a1
join Activity as a2
on a1.player_id=a2.player_id 
where a2.event_date= date_add(a1.min_date, interval 1 day)
)

select round(count(player_id)/(select count(distinct player_id) from activity),2) as fraction
from cte2
*/

with total_count as  (select a3.player_id as player_id,min(a3.event_date) as first_date from activity a3 group by a3.player_id),

consec_count as  (
select (a1.player_id) as player_id from activity a1
join total_count tc on
a1.player_id=tc.player_id where a1.event_date=DATE_ADD(tc.first_date,INTERVAL 1 DAY)
)

select round((SELECT COUNT(*) from consec_count)/(SELECT COUNT(*) from total_count),2) as fraction











