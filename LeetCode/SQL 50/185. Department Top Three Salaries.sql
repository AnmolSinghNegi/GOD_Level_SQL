With my_cte as (
  Select d.name as Department, e.name as Employee, e.salary, DENSE_RANK()OVER(PARTITION BY e.departmentId ORDER BY e.salary desc) as rnk from Employee e inner join Department d on e.departmentId=d.id
)
Select Department, Employee, Salary from my_cte where rnk<=3;