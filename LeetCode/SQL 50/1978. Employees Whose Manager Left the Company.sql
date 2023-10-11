select employee_id 
from Employees
where salary< 30000 and (manager_id) not in (
    Select e1.employee_id from Employees e1,Employees e2
    where e1.employee_id=e2.manager_id
) 
Order by employee_id;