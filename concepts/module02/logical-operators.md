# 🔍 SQL Logical Operators: AND, OR, NOT

Logical operators are used in SQL to combine or negate conditions in the `WHERE` clause. They allow you to build complex filtering logic by combining simple expressions.

---

## 🔸 AND

Returns `TRUE` only if **both** conditions are true.

### ✅ Example:

```sql
SELECT * FROM employees
WHERE department_id = 50 AND salary > 5000;
```

This returns employees who are in department 50 **and** whose salary is greater than 5000.

---

## 🔸 OR

Returns `TRUE` if **at least one** of the conditions is true.

### ✅ Example:

```sql
SELECT * FROM employees
WHERE department_id = 50 OR department_id = 60;
```

This returns employees who are in **either** department 50 **or** 60.

---

## 🔸 NOT

Reverses the result of a condition.

### ✅ Example:

```sql
SELECT * FROM employees
WHERE NOT department_id = 50;
```

This returns employees **not** in department 50.

---

## 🔁 Combining Operators

You can mix logical operators to create complex conditions. Use parentheses to control evaluation order and avoid logic errors.

### ✅ Example:

```sql
SELECT * FROM employees
WHERE (department_id = 50 OR department_id = 60)
AND salary > 5000;
```

This returns employees who are in department 50 or 60 **and** have a salary greater than 5000.

---

## 📊 Operator Precedence

Logical operators are evaluated in the following order:

| Precedence  | Operator |
| ----------- | -------- |
| 1 (highest) | NOT      |
| 2           | AND      |
| 3 (lowest)  | OR       |

Use parentheses `()` to ensure correct evaluation, especially when mixing AND and OR.

---

## 📚 References

* [Oracle SQL WHERE Clause](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/Conditions.html)
* [Oracle SQL SELECT Documentation](https://docs.oracle.com/en/database/oracle/oracle-database/23/sqlrf/SELECT.html)

---

Mastering logical operators is essential for writing flexible, powerful SQL queries that match real-world logic and business rules.

---

*Created with reference to Oracle Database 23c official documentation.*

