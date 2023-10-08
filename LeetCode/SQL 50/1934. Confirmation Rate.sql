--using count , CASE and Coalesce
Select s.user_id, 
round(
    Coalesce(
    Count(Case When c.action="confirmed" then 1 end)/
    Count(c.action),0),2) as confirmation_rate 
from Signups as S
Left Join Confirmations as c
on s.user_id=c.user_id
Group by s.user_id

--using sum and CASE
Select s.user_id, CASE When c.time_stamp is null then 0.00 
Else round(Sum(c.action="confirmed")/Count(c.action),2) END as confirmation_rate
from Signups as s
Left Join Confirmations as c 
on s.user_id= c.user_id 
group by user_id;

--using avg and if
Select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
From Signups as s
Left join Confirmations as c
on s.user_id =c.user_id
group by s.user_id;