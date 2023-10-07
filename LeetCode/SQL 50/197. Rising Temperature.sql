-- using self join
Select w1.id as id
from weather w1
join weather w2
on  w1.recorddate = DATE_ADD(w2.recorddate, interval 1 day)
where w1.temperature>w2.temperature;

--using DATEDIFF
Select w1.id as id
from weather w1 ,weather w2
where DATEDIFF(w1.recorddate,w2.recorddate)=1 and w1.temperature>w2.temperature;