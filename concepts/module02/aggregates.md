## SQL Aggregate Functions: COUNT(), SUM(), AVG(), MIN(), MAX()

SQL aggregate functions perform a calculation on a set of rows and return a single summary value. They 
are commonly used with the `GROUP BY` clause to perform calculations on groups of rows, but they can also
be used on an entire table (or result set) to return a single summary for all rows.  

By default, aggregate functions ignore `NULL` values in the columns on which they operate. The `DISTINCT` 
keyword can be used with some aggregate functions to count only unique non-NULL values.

### 1. `COUNT()`
The `COUNT()` function returns the number of rows that match a specified criterion.

#### Syntax:
```sql
COUNT(column_name)
COUNT(DISTINCT column_name)
COUNT(*)
```

#### Explanation:

- `COUNT(column_name)`: Returns the number of non-NULL values in the specified column_name. If a row has a 
`NULL` value in `column_name`, it is not counted.

- `COUNT(DISTINCT column_name)`: Returns the number of unique, non-NULL values in the specified `column_name`.

- `COUNT(*)`: Returns the total number of rows in a table or result set, including rows with NULL values. This
is generally the most common way to count all rows.

#### Examples (using a hypothetical Employees table):

|EmployeeID|FirstName|LastName|Department|Salary|StartDate|
|----------|---------|--------|----------|------|---------|
|1         |John     |Doe     |Sales     |60000 |2020-01-15|
|2         |Jane     |Smith   |Marketing |55000 |2019-03-20|
|3         |Peter    |Jones   |Sales     |62000 |2021-07-01|
|4         |Alice    |Brown   |HR        |58000 |2018-11-10|
|5         |Bob      |White   |Marketing |55000 |2020-05-22|
|6         |Charlie  |Green   |Sales     |60000 |2022-02-28|
|7         |Diana    |Prince  |NULL      |70000 |2017-09-01|

#### Example 1: Count all employees
```SQL
SELECT COUNT(*) AS TotalEmployees
FROM Employees;
```
#### Result:
| TotalEmployees |
| :------------- |
| 7              |

Example 2: Count employees with a non-NULL Department
```SQL
SELECT COUNT(Department) AS EmployeesWithDepartment
FROM Employees;
```
Result:
| EmployeesWithDepartment |
| :-------------------- |
| 6                     |

(Diana Prince is not counted because her Department is NULL)

#### Example 3: Count distinct departments
```SQL
SELECT COUNT(DISTINCT Department) AS UniqueDepartments
FROM Employees;
```
#### Result:
| UniqueDepartments |
| :---------------- |
| 3                 |

(Sales, Marketing, HR)

#### Example 4: Count employees per department
```SQL
SELECT Department, COUNT(*) AS NumberOfEmployees
FROM Employees
GROUP BY Department;
```
Result:
| Department | NumberOfEmployees |
| :--------- | :---------------- |
| HR         | 1                 |
| Marketing  | 2                 |
| Sales      | 3                 |
| NULL       | 1                 |

### 2. `SUM()`
The `SUM()` function calculates the total sum of a numeric column.

#### Syntax:
```SQL
SUM(column_name)
SUM(DISTINCT column_name)
```
Explanation:
`SUM(column_name)`: Returns the sum of all non-`NULL` values in the specified `column_name`. `NULL` values are ignored.

`SUM(DISTINCT column_name)`: Returns the sum of all unique, non-NULL values in the specified `column_name`.

#### Examples (using the Employees table):

Example 1: Calculate the total salary of all employees
```SQL
SELECT SUM(Salary) AS TotalSalaries
FROM Employees;
```
Result:
| TotalSalaries |
| :------------ |
| 420000        |

Example 2: Calculate the total salary per department
```SQL
SELECT Department, SUM(Salary) AS TotalDepartmentSalary
FROM Employees
GROUP BY Department;
```
Result:
| Department | TotalDepartmentSalary |
| :--------- | :-------------------- |
| HR         | 58000                 |
| Marketing  | 110000                |
| Sales      | 182000                |
| NULL       | 70000                 |

### 3. AVG()
The `AVG()` function calculates the average value of a numeric column.

Syntax:
```SQL
AVG(column_name)
AVG(DISTINCT column_name)
```
Explanation:
`AVG(column_name)`: Returns the average of all non-`NULL` values in the specified column_name. `NULL` values are ignored.

`AVG(DISTINCT column_name)`: Returns the average of all unique, non-NULL values in the specified `column_name`.

#### Examples (using the Employees table):
Example 1: Calculate the average salary of all employees
```SQL
SELECT AVG(Salary) AS AverageSalary
FROM Employees;
```
Result:
| AverageSalary |
| :------------ |
| 60000.0       |

Example 2: Calculate the average salary per department
```SQL
SELECT Department, AVG(Salary) AS AverageDepartmentSalary
FROM Employees
GROUP BY Department;
```
Result:
| Department | AverageDepartmentSalary |
| :--------- | :---------------------- |
| HR         | 58000.0                 |
| Marketing  | 55000.0                 |
| Sales      | 60666.666666666664      |
| NULL       | 70000.0                 |

### 4. `MIN()`
The `MIN()` function returns the minimum value in a column. It works for numeric, string, and date/time data types.

Syntax:
```SQL
MIN(column_name)
```
#### Explanation:
`MIN(column_name)`: Returns the smallest non-NULL value in the specified column_name. NULL values are ignored.

#### Examples (using the Employees table):
Example 1: Find the lowest salary
```SQL
SELECT MIN(Salary) AS LowestSalary
FROM Employees;
```
Result:
| LowestSalary |
| :----------- |
| 55000        |

Example 2: Find the earliest start date per department
```SQL
SELECT Department, MIN(StartDate) AS EarliestStartDate
FROM Employees
GROUP BY Department;
```
Result:
| Department | EarliestStartDate |
| :--------- | :---------------- |
| HR         | 2018-11-10        |
| Marketing  | 2019-03-20        |
| Sales      | 2020-01-15        |
| NULL       | 2017-09-01        |

### 5. `MAX()`
The `MAX()` function returns the maximum value in a column. It works for numeric, string, and date/time data types.

Syntax:
```SQL
MAX(column_name)
```
#### Explanation:
`MAX(column_name)`: Returns the largest non-NULL value in the specified column_name. `NULL` values are ignored.

#### Examples (using the `Employees` table):

Example 1: Find the highest salary
```SQL
SELECT MAX(Salary) AS HighestSalary
FROM Employees;
```
Result:
| HighestSalary |
| :------------ |
| 70000         |

Example 2: Find the latest start date per department
```SQL
SELECT Department, MAX(StartDate) AS LatestStartDate
FROM Employees
GROUP BY Department;
```
Result:
| Department | LatestStartDate |
| :--------- | :-------------- |
| HR         | 2018-11-10      |
| Marketing  | 2020-05-22      |
| Sales      | 2022-02-28      |
| NULL       | 2017-09-01      |

Important Considerations for Aggregate Functions:
- `GROUP BY Clause`: When you use an aggregate function along with non-aggregated columns in your `SELECT` statement, you
must include those non-aggregated columns in a GROUP BY clause. This tells the database how to group the rows before
applying the aggregate function.

- `HAVING` Clause: You cannot use aggregate functions directly in a WHERE clause to filter groups. Instead, you use the
`HAVING` clause for filtering results based on aggregate conditions.
    - Example: `SELECT` `Department`, `AVG(Salary)` `FROM Employees GROUP BY Department HAVING AVG(Salary) > 60000`;

- `NULL` Values: As mentioned, all standard aggregate functions (except `COUNT(*)`) ignore `NULL` values. Be mindful of this
behavior when interpreting results.

- `DISTINCT` Keyword: Using `DISTINCT` within an aggregate function (like `COUNT(DISTINCT column_name`) or `SUM(DISTINCT column_name)`)
forces the function to consider only unique values before performing the aggregation.

- Performance: While powerful, complex aggregations on large datasets can be resource-intensive. Proper indexing and query
optimization are crucial.

Mastering these aggregate functions is fundamental for data analysis and reporting in SQL.
