# 🧩 SQL Challenges — Advanced Window Functions & Aggregations

Welcome! This document includes three SQL challenges focused on using **window functions**, **aggregations**, and advanced **analytical techniques** to extract deeper insights from relational data.

---

## Challenge 1 — 🏆 Salary Ranking by Department

### 📚 Table: `employees`
```sql
employee_id | department_id | salary | hire_date
```

# ✅ Goal:
For each employee, return:

Their salary

Salary rank within their department (ROW_NUMBER)

Maximum salary in their department (MAX)

Previous salary (just above theirs) in that department (LAG)

# 💡 Example Output:

| store\_id | sale\_date | total\_sale | prev\_sale | drop\_flag |
| --------- | ---------- | ----------- | ---------- | ---------- |
| 1         | 01-JAN     | 1000        | null       | No         |
| 1         | 02-JAN     | 800         | 1000       | **Yes**    |


_______________________________________________________________________________
_______________________________________________________________________________

## 🧩 Challenge 2 — Detecting Sales Drops

### 📝 Context:

### Table: sales_history

```sql
sale_id | store_id | sale_date | total_sale
```

# ✅ Task:
For each store, show:

- Sale ID

- Sale date

- Total sale

- The difference between this sale and the previous one (LAG)

- If the sale dropped (boolean or case statement)

### 💡 Expected Output Example:

| store\_id | sale\_date | total\_sale | prev\_sale | drop\_flag |
| --------- | ---------- | ----------- | ---------- | ---------- |
| 1         | 01-JAN     | 1000        | null       | No         |
| 1         | 02-JAN     | 800         | 1000       | **Yes**    |

_______________________________________________________________________________
_______________________________________________________________________________

## 🧩 Challenge 3 — Average and Min Dose by Prescription
### 📝 Context:
### You have a table or JSON called medication_doses:

```sql
nr_prescription | qt_dose
```

(You can use your JSON_TABLE if you want.)

✅ Task:
For each row, show:

- The current dose
- The average dose for that prescription (AVG)
- The minimum dose for that prescription (MIN)
- The lead dose (next one in sequence) (LEAD)

  ### 💡 Expected Output Example:
| nr\_prescription | qt\_dose | avg\_dose | min\_dose | lead\_dose |
| ---------------- | -------- | --------- | --------- | ---------- |
| 2001             | 5        | 4.3       | 2         | 4          |

### 📤 What to do:
- Implement each query.
- Test them using real or mock data.
- Push your scripts to oracle-sql-lab (one per file).
- Send the repo or files here for feedback.
