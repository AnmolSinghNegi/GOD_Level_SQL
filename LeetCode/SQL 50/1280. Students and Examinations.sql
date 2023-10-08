SELECT 
    s.student_id,
    s.student_name,
    sub.subject_name,
    COUNT(e.student_id) as attended_exams
FROM Students s
CROSS JOIN Subjects as sub
Left Join Examinations as e
on s.student_id=e.student_id and sub.subject_name=e.subject_name
Group by s.student_id,sub.subject_name
ORDER BY s.student_id,sub.subject_name
