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


employee_id |	department_id	| salary	| salary_rank	| max_salary	| prev_salary
101	        | 10	          | 8000	  | 1	          | 8000        | null
102	        | 10	          | 5000	  | 2           |	8000        |	8000
