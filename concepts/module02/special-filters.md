# 📘 Special Filters in SQL

This guide covers advanced filtering techniques using `LIKE`, `IN`, `BETWEEN`, and `IS NULL` clauses.

---

## 🔠 1. `LIKE` – Pattern Matching

Used to search for **text patterns** inside string columns.

### 🔹 Syntax:
```sql
WHERE column_name LIKE 'pattern';
```

### 🔹 Wildcards:
| Symbol | Meaning                     |
|--------|-----------------------------|
| `%`    | Any sequence of characters  |
| `_`    | A single character          |

### 🔍 Examples:
```sql
-- Names that start with 'C'
SELECT * FROM users WHERE name LIKE 'C%';

-- Names that end with 'n'
SELECT * FROM users WHERE name LIKE '%n';

-- Names that contain 'ar'
SELECT * FROM users WHERE name LIKE '%ar%';

-- Names with exactly 4 letters, second is 'a'
SELECT * FROM users WHERE name LIKE '_a__';
```

> 🔸 Case sensitivity depends on the DBMS:
- MySQL: case-insensitive by default
- PostgreSQL: case-sensitive
- Oracle: case-sensitive unless using `UPPER()`

---

## 🔢 2. `IN` – Match Any Value in a List

Checks if a value exists inside a given set.

### 🔹 Syntax:
```sql
WHERE column_name IN (value1, value2, ...);
```

### 🔍 Examples:
```sql
-- Users from specific countries
SELECT * FROM users WHERE country IN ('Brazil', 'USA', 'Argentina');

-- IDs in a specific list
SELECT * FROM orders WHERE order_id IN (101, 105, 110);
```

> ✅ `IN` is cleaner and often faster than multiple `OR` statements.

---

## 🔛 3. `BETWEEN` – Range Filtering

Used to filter values within a range (inclusive).

### 🔹 Syntax:
```sql
WHERE column_name BETWEEN value1 AND value2;
```

### 🔍 Examples:
```sql
-- Birthdates from 2000 to 2010
SELECT * FROM users WHERE birth_date BETWEEN '2000-01-01' AND '2010-12-31';

-- Prices between 10 and 50
SELECT * FROM products WHERE price BETWEEN 10 AND 50;
```

> ✅ Includes both boundaries: 10 and 50 are included.

---

## ⚠️ 4. `IS NULL` / `IS NOT NULL`

Checks for missing or unassigned values.

### 🔹 Syntax:
```sql
WHERE column_name IS NULL;
WHERE column_name IS NOT NULL;
```

### 🔍 Examples:
```sql
-- Users without phone number
SELECT * FROM users WHERE phone IS NULL;

-- Orders that have a delivery date
SELECT * FROM orders WHERE delivered_at IS NOT NULL;
```

> ❗ `NULL` is not equal to anything, not even `NULL`. Always use `IS NULL`.

---

## 🧪 Practice Challenge

Given a table `employees` with columns: `id`, `name`, `salary`, `birthdate`, `department`, `phone`:

1. Employees whose name starts with "Jo"
2. Employees in departments "HR", "Finance", or "IT"
3. Employees with salary between 4000 and 8000
4. Employees without a registered phone

Write and test these queries!

[Back to Main README](../../README.md)
