--using self join
SELECT q1.person_name
FROM Queue q1 , Queue q2
where q1.turn>=q2.turn 
group by (q1.turn)
having sum(q2.weight)<=1000
ORDER BY SUM(q2.weight) DESC
LIMIT 1
--using window function
SELECT person_name
FROM (Select * ,Sum(weight)over(order by turn)as total from Queue)as t
where total<=1000
order by total desc
limit 1