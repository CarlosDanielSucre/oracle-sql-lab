SELECT   employee_id,
         department_id,
         salary,
    ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) as rank_salary,
    MAX(salary) OVER(PARTITION BY department_id) AS max_salary,
    LAG(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS prev_salary
FROM employees;
