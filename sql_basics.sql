/* SQL BASICS */

-- 1 & 2. view the table (SELECT, FROM)
SELECT * -- columns (* : all) can be specified by table also
FROM students;

-- 3. show students who get school lunch (WHERE)
SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes'; --- Shows only rows where "school_lunch" is "Yes", and it's posible to use "AND" to add more conditions.

-- 4. sort the students by gpa (ORDER BY)
SELECT student_name, gpa, school_lunch
FROM students
WHERE school_lunch = 'Yes' AND gpa > 3.3
ORDER BY gpa; -- This clause orders the rows by the specified column in ascending order by default. 
-- To sort in descending order, you can add DESC.

-- 5. show the average gpa for each grade level (GROUP BY)
SELECT grade_level, AVG(gpa) -- The AVG returns the average value of the GPA Column
FROM students
GROUP BY grade_level -- GROUP BY combines rows that have the same values in the grade_level column
ORDER BY grade_level; -- Orders the result by grade_level in ascending order

-- 6. show the grade levels with an average gpa below 3.3 (HAVING)
SELECT grade_level, AVG(gpa) AS avg_gpa   -- Selects the grade level and calculates the average GPA, naming it "avg_gpa"
FROM students                             -- From the "students" table
GROUP BY grade_level                      -- Groups the rows by grade_level so we can calculate averages per group
HAVING avg_gpa < 3.3                      -- Filters the groups where the average GPA is less than 3.3 (HAVING is used after aggregation)
ORDER BY grade_level;                     -- Sorts the final results by grade_level in ascending order


/* THE BIG 6 */

/*    SELECT  -- Choose Columns
      FROM  -- Choose tables
      WHERE  -- Filter Rows
      GROUP BY  -- Group Rows 
      HAVING  -- Filter Grouped Rows
      ORDER BY  -- Sort Rows
*/

/* MORE SQL CONCEPTS */

-- 7. special keywords: LIMIT | COUNT | DISTINCT

-- 8. show the final grades for each student: LEFT JOIN
SELECT *
FROM students;

SELECT *
FROM student_grades;

SELECT *  
FROM students LEFT JOIN student_grades          -- Performs a LEFT JOIN to include all rows from "students" table
    ON students.id = student_grades.student_id; -- Matches each student with their grades using the student ID

SELECT students.id, students.student_name,        -- Selects the student ID and name from the "students" table
       student_grades.class_name, student_grades.final_grade -- Selects the class name and final grade from the "student_grades" table
FROM students LEFT JOIN student_grades
    ON estudents.id = student_grades.student_id; -- The ON clause is used to define the condition for how two tables should be joined.
