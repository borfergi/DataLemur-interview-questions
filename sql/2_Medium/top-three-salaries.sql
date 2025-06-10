WITH employee_department AS (
  SELECT
    d.department_name,
    e.name,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY d.department_id 
      ORDER BY e.salary DESC) AS salary_rank
  FROM employee e
  INNER JOIN department d 
    ON e.department_id = d.department_id
  ORDER BY d.department_name, e.salary DESC, e.name
)

SELECT
  department_name,
  name,
  salary
FROM employee_department
WHERE salary_rank <= 3;