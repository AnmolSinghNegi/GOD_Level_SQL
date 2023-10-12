With cte as(
Select requester_id as id from RequestAccepted
UNION ALL (Select  accepter_id  from RequestAccepted)
)

Select id ,Count(id) as num from cte
group by 1
order by 2 desc
limit 1