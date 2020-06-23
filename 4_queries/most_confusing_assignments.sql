SELECT assignments.id as id , assignments.name as name, 
assignments.day as day , assignments.chapter as chapter,
COUNT(*) as total_request
FROM assistance_requests
JOIN assignments ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_request DESC;