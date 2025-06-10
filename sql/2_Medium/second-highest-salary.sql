WITH second_highest_salary_person AS (
  SELECT 
    RANK() OVER(ORDER BY salary DESC) AS second_highest_salary, 
    salary
  FROM employee
)

SELECT salary
FROM second_highest_salary_person
WHERE second_highest_salary = 2;