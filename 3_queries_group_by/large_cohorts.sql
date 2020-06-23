SELECT cohorts.name as cohort_name, COUNT (*) as students_count 
FROM students
JOIN cohorts ON
students.cohort_id = cohorts.id
GROUP BY cohorts.name
Having COUNT(*) >= 18
ORDER BY students_count;
