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

|EmployeeID    |  FirstName    |  LastName    |  Department    |  Salary    |  StartDate    |
|--------------|---------------|--------------|----------------|------------|---------------|
|1             |John           |Doe           |Sales           |60000       |2020-01-15     |
|
