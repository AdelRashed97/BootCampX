SELECT avg(assistance_duration) as  average_assistance_request_duration
FROM (
  SELECT completed_at - started_at as assistance_duration
  FROM assistance_requests
) as duration_table;