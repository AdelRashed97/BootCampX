SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort, COUNT(*) as total_assistance
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY cohorts.name ,teachers.name  
ORDER BY teacher
;