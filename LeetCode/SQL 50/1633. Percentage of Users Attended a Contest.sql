Select contest_id ,round(Count(distinct user_id) *100 /(Select 
count(user_id)from Users),2) as percentage
from register
group by contest_id
order by percentage desc,contest_id