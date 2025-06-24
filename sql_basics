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
SELECT *
FROM students
