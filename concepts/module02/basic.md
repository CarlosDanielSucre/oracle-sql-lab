## SELECT, FROM, WHERE, ORDER BY

This document explains the foundational parts of a SQL query using the **SELECT-FROM-WHERE-ORDER BY** pattern.  
These clauses are essential for querying and organizing data in relational databases.


### 🔹 1. SELECT — What columns to return

The `SELECT` clause specifies the columns (or expressions) you want to retrieve.

### Syntax:

```sql
SELECT column1, column2, ...
```

### Notes:

* You can use `*` to select all columns (not recommended for production).
  ```sql
  SELECT * FROM ...
  ```
* You can use expressions, aliases (`AS`), functions, or even subqueries.
```sql
SELECT first_name, last_name FROM employees;
SELECT salary * 12 AS annual_salary FROM employees;
```

##### Source:[Oracle SQL SELECT Docs](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/SELECT.html)


### 2. FROM — The data source

The `FROM` clause tells the database which table(s) or view(s) you want to query.

### Syntax:

```sql
FROM table_name
```

#### Notes:

* You can use multiple tables with `JOIN`.
* You can also use subqueries as data sources.

#### Example:

```sql
SELECT * FROM employees;
SELECT e.first_name, d.department_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id;
```

##### Source: [Oracle SQL FROM Clause](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/SELECT.html#GUID-FB9B8F32-E90A-4E5A-9792-2C06774B5AC5)


### 3. WHERE — Filter rows

The `WHERE` clause filters rows that satisfy a condition.

#### Syntax:

```sql
WHERE condition
```

#### Notes:

* Conditions can include comparisons (`=`, `>`, `<`, `<>`), logical operators (`AND`, `OR`, `NOT`), and functions.
* Use `IS NULL` for null values.

#### Examples:

```sql
SELECT * FROM employees WHERE department_id = 50;
SELECT * FROM employees WHERE salary > 5000 AND hire_date > TO_DATE('2020-01-01', 'YYYY-MM-DD');
```

##### Source: [Oracle SQL WHERE Clause](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Conditions.html)

### 4. ORDER BY — Sort the result

The `ORDER BY` clause sorts the result set based on one or more columns.

#### Syntax:

```sql
ORDER BY column1 [ASC|DESC], column2 ...
```

#### Notes:

* Default order is `ASC` (ascending).
* You can sort by column alias, name, or position.

#### Examples:

```sql
SELECT * FROM employees ORDER BY salary DESC;
SELECT first_name, salary FROM employees ORDER BY 2 ASC;
```

##### Source: [Oracle SQL ORDER BY Clause](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/SELECT.html#GUID-4BD4728B-8BD5-4141-BD94-174B5024B5AD)


## ✅ Summary Table

| Clause   | Purpose                            |
| -------- | ---------------------------------- |
| SELECT   | Defines the columns or expressions |
| FROM     | Specifies the data source (tables) |
| WHERE    | Filters rows based on conditions   |
| ORDER BY | Sorts the result set               |


##### [Back to Main README](../../README.md)
