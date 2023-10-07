--using self join
Select a1.machine_id,round(Avg(a2.timestamp-a1.timestamp),3) as processing_time
from Activity as a1
join Activity as a2
on a1.machine_id=a2.machine_id and a1.process_id=a2.process_id and a1.activity_type='start'and a2.activity_type='end'
Group By a1.machine_id;

-- using subquery
Select a.machine_id,round(Avg(
  (Select avg(a1.timestamp) from Activity as a1 where a1.machine_id= a.machine_id and a1.activity_type='end')-(Select avg(a1.timestamp)from Activity as a1 where a1.machine_id= a.machine_id and a1.activity_type='start')
),3) as processing_time
from Activity as a
Group By a.machine_id;