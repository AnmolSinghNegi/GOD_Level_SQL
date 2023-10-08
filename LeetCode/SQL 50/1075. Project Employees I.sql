--using window function
Select distinct p.project_id,round(avg(e.experience_years) over(Partition by p.project_id order by p.project_id),2)as  average_years 
from Project as p
Left Join Employee as e
on p.employee_id=e.employee_id;

--using avg
Select p.project_id,round(avg(e.experience_years),2)as  average_years 
from Project as p
Left Join Employee as e
on p.employee_id=e.employee_id
Group by p.project_id;