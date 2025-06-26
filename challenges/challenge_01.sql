SELECT   employee_id,
         department_id,
         salary,
    ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) as rank_salary,
    MAX(salary) OVER(PARTITION BY department_id) AS max_salary,
    LAG(salary) OVER (PARTITION BY department_id ORDER BY salary DESC) AS prev_salary
FROM employees;

--  Mini Challenge A - Dense Salary Ranking
/*
 Mini Challenge A – Dense Salary Ranking
📝 Task:
List employees with their DENSE_RANK() salary within their department, ordered from highest to lowest salary.

🔑 Difference: Unlike ROW_NUMBER, if two people have the same salary, they get the same rank.

-- Expected columns: employee_id, department_id, salary, dense_salary_rank
*/
SELECT  employee_id,
        department_id,
        salary,
    DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) as dense_salary_rank 
FROM employees; 

--  Mini Challenge B - First and Last Salary per Department
/*
🔹 Mini Challenge B – First and Last Salary per Department
📝 Task:
For each employee, show:

Their salary

The first salary hired in their department (FIRST_VALUE)

The last salary hired in their department (LAST_VALUE)

Use ORDER BY hire_date
*/
-- Expected columns: employee_id, department_id, hire_date, salary, first_salary, last_salary
SELECT  employee_id,
        department_id,
        hire_date,
        salary,
    FIRST_VALUE(salary) OVER(PARTITION BY department_id ORDER BY hire_date) as first_salary,
    FIRST_VALUE(salary) OVER(PARTITION BY department_id ORDER BY hire_date DESC) as last_salary
 FROM  employees;

-- Mini Challenge C – Salary Difference from Max
/*
📝 Task:
Show each employee’s salary and how much below the department’s max salary they are.

💡 Use: MAX(salary) OVER (...) - salary as a calculated column.
-- Expected columns: employee_id, department_id, salary, max_salary, difference
*/
SELECT  
  employee_id,
  department_id,
  salary,
  MAX(salary) OVER (PARTITION BY department_id) AS max_salary,
  MAX(salary) OVER (PARTITION BY department_id) - salary AS difference
FROM employees;
