SELECT cohorts.name as cohorts_name ,COUNT(*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = assignment_submissions.student_id
JOIN cohorts ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
ORDER BY total_submissions DESC;