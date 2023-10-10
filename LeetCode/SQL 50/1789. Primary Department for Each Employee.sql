SELECT DISTINCT e1.employee_id, e1.department_id
FROM employee as e1
WHERE e1.primary_flag = 'Y' OR (SELECT COUNT(*) FROM employee WHERE employee_id = e1.employee_id) = 1;
