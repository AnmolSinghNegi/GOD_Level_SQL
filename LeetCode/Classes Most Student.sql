SELECT class 
FROM Courses
GROUP BY class
HAVING COUNT(student) = (
    SELECT MAX(student_count) 
    FROM (
        SELECT COUNT(student) as student_count 
        FROM Courses
        GROUP BY class
    ) as subquery