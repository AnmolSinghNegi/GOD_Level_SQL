-- using subquery
Select name from employee
where id in 
(Select managerId from employee 
group by managerId
having count(*)>=5
)
-- using join
SELECT e1.name 
FROM Employee as e1 
JOIN Employee as e2 
ON e1.id = e2.managerId
Group By e1.id
having count(e2.managerid)>=5