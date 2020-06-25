const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `
SELECT DISTINCT teachers.name as teacher, cohorts.name as cohort
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
ORDER BY teacher;
`;
pool.query(queryString,[process.argv[2]])
  .then(res => {
    for (const row of res.rows) {
      console.log(`${row.cohort}: ${row.teacher}`);

    }
  
  
  })
  .catch(err => console.error('query error', err.stack));
