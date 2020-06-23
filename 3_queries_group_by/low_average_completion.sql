SELECT students.name as student, 
AVG(assignment_submissions.duration) as average_assignments_duration,
AVG(assignments.duration) as average_assignments_estimated
FROM assignment_submissions
JOIN students ON 
students.id = assignment_submissions.student_id
JOIN assignments ON
assignments.id = assignment_submissions.assignment_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING AVG(assignment_submissions.duration) < AVG(assignments.duration) 
ORDER BY average_assignments_duration ;