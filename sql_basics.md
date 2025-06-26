# 🧠 SQL Basics — Student Grades DB

This document contains annotated SQL examples using a fictional `students` and `student_grades` database.  
The examples cover beginner to intermediate concepts, written for clear understanding and future reference.

> All queries assume access to the tables provided in the `student-grades-db` schema.

---

## 📌 The Big 6 in SQL

These six clauses form the core of most queries:

```sql
SELECT      -- Choose columns
FROM        -- Choose tables
WHERE       -- Filter rows
GROUP BY    -- Group rows
HAVING      -- Filter grouped results
ORDER BY    -- Sort rows
```

---

## 1. `SELECT` and `FROM` – View the Table

```sql
SELECT * FROM students;
```

> `*` selects all columns. You can also specify them individually.

---

## 2. `WHERE` – Filtering Data

```sql
SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes';
```

> Filters rows where the student receives school lunch.

---

## 3. `ORDER BY` – Sorting Rows

```sql
SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes' AND gpa > 3.3
ORDER BY gpa;
```

> Default sort is ascending. Add `DESC` to reverse it.

---

## 4. `GROUP BY` – Aggregation by Category

```sql
SELECT grade_level, AVG(gpa)
FROM students
GROUP BY grade_level
ORDER BY grade_level;
```

> Calculates the average GPA per grade level.

---

## 5. `HAVING` – Filtering Aggregated Groups

```sql
SELECT grade_level, AVG(gpa) AS avg_gpa
FROM students
GROUP BY grade_level
HAVING avg_gpa < 3.3
ORDER BY grade_level;
```

> `HAVING` works **after** grouping, similar to how `WHERE` works **before**.

---

## 🧰 SQL Concepts & Extensions

### `COUNT`, `DISTINCT`, `LIMIT`
Not yet included — coming soon!

---

## 6. `JOIN` – Combining Tables

### View both tables:

```sql
SELECT * FROM students;
SELECT * FROM student_grades;
```

---

### `LEFT JOIN` – Match Students with Final Grades

```sql
SELECT students.id, students.student_name,
       student_grades.class_name, student_grades.final_grade
FROM students
LEFT JOIN student_grades
  ON students.id = student_grades.student_id;
```

> Shows all students, including those without grades yet.

---

## 🧑‍🎓 Notes

- All queries are written for clarity and reproducibility.
- Aliases and more advanced joins will be introduced in the next module.
- If you're using a SQL playground, make sure your schema is active.

---

## 🧪 Coming Up Next

- Aggregate functions: `SUM`, `COUNT`, `MIN`, `MAX`
- Subqueries
- Window functions
- Indexing and performance tips

---

🟢 *Maintained by Carlos Daniel Sucre — aspiring backend developer learning by doing.*
