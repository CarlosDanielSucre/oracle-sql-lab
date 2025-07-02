## SQL: `GROUP BY` and `HAVING`

In SQL, the `GROUP BY` and `HAVING` clauses are powerful tools used in conjunction with aggregate
functions (`COUNT()`,`SUM()`, `AVG()`, `MIN()`, `MAX()`,) to summarize and filter data. While 
`GROUP BY`  organizes rows into groups, `HAVING` filters those groups based on specified conditions.

### 1. The `GROUP BY` Clause

The `GROUP BY clause is used to group rows that have the same values in sapecified columns into 
summary rows. It is mos commonly used with aggregate functions to perfom calculations on each group.

#### Purpose:

- To summarize data by categories.
- To apply aggregate functions to subsets of rows rather than the entire result set.

#### Syntax:

```sql
SELECT column1, column2, aggregate_function(column3)
FROM table_name
WHERE condition_on_rows -- Optional: filters individual rows BEFORE grouping
GROUP BY column1, column2 -- Groups rows based on these columns
ORDER BY column1; -- Optional: orders the final result set
```

#### Explanation:

 - 1. Grouping Logic: When you use `GROUP BY`, the database scans the table and collects all rows
that have identical values in the columns specified in the `GROUP BY` clause into a single group.

 - 2. **Aggregate Function Application**: After grouping, any aggregate function in the `SELECT` list
is applied to the values within each group, producing a single summary value for that group.

 - 3. **`SELECT` List Rules**:
       - Any column in the `SELECT` list that is not part of an aggregate function **must** also
be included in the `GROUP BY` clause. This is because for each group, the database needs to know
non-aggregated columns to display. If you select `Department` and `COUNT(*)`, `Department` defines
the group.
        - Columns that are part of an aggregate function (e.g., `Salary` in `SUM(Salary)`) do not
need to be in the `GROUP BY` clause.

#### Flow of Execution  (Conceptual):

- 1. `FROM`: Identifies the source table(s).
- 2. `WHERE`: Filters individual rows based on a condition. Only rows that satisfy the `WHERE`
  3. condition proceed to the next step.
  4. `GROUP BY`: Organizes the remaining rows into groups based on the specified columns.
  5. `SELECT`: Calculates aggregate functions for each group and selects the specified columns (which
  6. must be either in `GROUP BY` or an aggregate function).
 
#### Example (using a hypothetical `Employees` table):    

![image](https://github.com/user-attachments/assets/f385ced2-6969-4e1c-8523-ab04a94ea04d)

You can include this table with this script:

```sql
-- SQL Command to Create the Employees Table

-- DROP TABLE IF EXISTS Employees; -- Uncomment this line if you want to drop the table if it already exists

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,      -- Unique identifier for each employee, set as Primary Key
    FirstName VARCHAR(50) NOT NULL,  -- Employee's first name, cannot be NULL
    LastName VARCHAR(50) NOT NULL,   -- Employee's last name, cannot be NULL
    Department VARCHAR(50),          -- Employee's department (can be NULL)
    Salary DECIMAL(10, 2) NOT NULL,  -- Employee's salary (e.g., up to 10 digits total, 2 after decimal)
    StartDate DATE NOT NULL          -- Date when the employee started, cannot be NULL
);

-- SQL Commands to Insert Data into the Employees Table

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(1, 'John', 'Doe', 'Sales', 60000.00, TO_DATE('2020-01-15', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(2, 'Jane', 'Smith', 'Marketing', 55000.00, TO_DATE('2019-03-20', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(3, 'Peter', 'Jones', 'Sales', 62000.00, TO_DATE('2021-07-01', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(4, 'Alice', 'Brown', 'HR', 58000.00, TO_DATE('2018-11-10', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(5, 'Bob', 'White', 'Marketing', 55000.00, TO_DATE('2020-05-22', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(6, 'Charlie', 'Green', 'Sales', 60000.00, TO_DATE('2022-02-28', 'YYYY-MM-DD'));

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, Salary, StartDate) VALUES
(7, 'Diana', 'Prince', NULL, 70000.00, TO_DATE('2017-09-01', 'YYYY-MM-DD'));
```
Example 1: Calculate the average salary for each department.

```SQL
SELECT Department, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Department;
```
Result:  
![image](https://github.com/user-attachments/assets/b4bb6087-6704-4228-a075-177bcba56721)

(Explanation: Rows are grouped by their Department value. For each unique Department, AVG(Salary) is calculated over the salaries of employees in that group.)  

Example 2: Count the number of employees in each department and show the minimum salary.  

```SQL
SELECT Department, COUNT(*) AS NumberOfEmployees, MIN(Salary) AS MinSalary
FROM Employees
GROUP BY Department;
```

Result:  
![image](https://github.com/user-attachments/assets/32c308ee-1595-42a4-9a0b-efcee8b17268)

### 2. The `HAVING` Clause  

The `HAVING` clause is used to filter groups based on conditions applied to aggregate functions.
It is similar to the `WHERE` clause, but `WHERE` filters individual rows before grouping, while `HAVING` filters groups of rows after grouping and aggregation.

#### Purpose:

- To apply conditions on the results of aggregate functions.
- To filter out entire groups that do not meet a specific criterion.

#### Syntax:  

```sql
SELECT column1, aggregate_function(column2)
FROM table_name
GROUP BY column1
HAVING aggregate_function(column2) condition -- Filters groups based on aggregate results
ORDER BY column1;
```

#### Explanation: 

- 1) **Execution Order**: The `HAVING` clause is processed after the `GROUP BY` clause and after the aggregate functions have been calculated for each group.
  2) **Conditions on Aggregates**: You can use aggregate fuunctions directly in the `HAVING` clause's condition (e.g., `COUNT(*) > 10`, `AVG(Salary) > 50000`). This is its primary distinction from `WHERE`.
  3) **No Row-Level Filtering**: `HAVING` cannot filter individual rows; it only filters groups.
 
#### Flow of execution (Conceptual, extended):

- 1) `FROM`: Indentifies the source table(s).
  2) `WHERE`: Filters individual rows.
  4) `GROUP BY`: Organizes the remaining rows into groups.
  5) `Aggregatrer Functions`: Calculations are performed for each group.
  6) `HAVING`: Filters the groups based on the aggregate results.
  7) `SELECT`: Selects the final columns for the remaining groups.
  8) `ORDER BY`: Sorts the final result set.
 



