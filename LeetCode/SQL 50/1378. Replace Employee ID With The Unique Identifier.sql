--using right join
Select unique_id , name 
from EmployeeUNI as t1
right join Employees as t2
on t1.id=t2.id;

--using left join
Select unique_id , name 
from Employees as t1
left join EmployeeUNI as t2
on t1.id=t2.id;