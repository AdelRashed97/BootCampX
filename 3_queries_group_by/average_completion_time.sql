SELECT students.name as student_name, AVG(duration) as average_assignments_submission
FROM assignment_submissions
JOIN students ON 
students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY average_assignments_submission DESC;