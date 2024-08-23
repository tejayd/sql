# Write your MySQL query statement below
-- select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
-- from Signups as s left join Confirmations as c on s.user_id= c.user_id group by user_id;

/* select s.user_id
,round(count(case when c.action='confirmed' then c.action end)/count(s.user_id),2) as "confirmation_rate"
from Signups as s
left join confirmations as c
on s.user_id = c.user_id
group by 1
*/


select C.user_id as  user_id, coalesce(round(B.c_count/B.t_count,2),0) as confirmation_rate
from signups C left join 
(select A.user_id,
    sum(case when A.action="confirmed" then 1 else 0 end) as c_count,
    count(*) as t_count
from confirmations A group by A.user_id) B
on C.user_id=B.user_id












