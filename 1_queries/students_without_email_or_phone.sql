SELECT name,id,cohort_id
FROM students
WHERE email IS NUll
OR phone IS NULL;