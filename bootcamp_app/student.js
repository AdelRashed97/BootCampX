const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});
const args = process.argv.slice(2);
const queryString = `
SELECT students.id as id, students.name as name, cohorts.name as cohort 
FROM students
JOIN cohorts ON students.cohort_id = cohorts.id
WHERE cohorts.name LIKE $1
LIMIT $2`;
pool.query(queryString,[`${args[0]}%`,args[1]])
  .then(res => {
    for (const row of res.rows) {
      console.log(`${row.name} has an id of ${row.id} and was in the ${row.cohort} cohort`);
    }
    
  })
  .catch(err => console.error('query error', err.stack));