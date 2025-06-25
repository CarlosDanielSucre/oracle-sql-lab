--1. view the table
SELECT *
FROM baby_names;

--2. order by popularity
SELECT *
FROM baby_names
ORDER BY Total DESC;

--3. add a popularity column
SELECT Gender, Name, Total,                                      -- Selects gender, name, and total count of each baby name
       ROW_NUMBER() OVER(ORDER BY total DESC) AS Popularity      -- Adds a row number to each result row, ordered arbitrarily (no ORDER BY)
FROM baby_names;                                                 -- Uses data from the "baby_names" table


--4. try different functions
SELECT Gender, Name, Total,                                     
       ROW_NUMBER() OVER(ORDER BY Total DESC) AS Popularity,           -- Assigns a unique row number ordered by Total descending
       RANK() OVER(ORDER BY Total DESC) AS Popularity_R,               -- Assigns ranks with gaps for ties ordered by Total descending
       DENSE_RANK() OVER(ORDER BY Total DESC) AS Popularity_D          -- Assigns ranks without gaps for ties ordered by Total descending
FROM baby_names;                                                       -- Selects data from the baby_names table                                               

--5. try different windows
SELECT Gender, Name, Total,                                  
       ROW_NUMBER() OVER(PARTITION BY gender ORDER BY total DESC) AS Popularity     -- Resets the row numbering for each gender group separately, 
                                   -- This line explains the commands above         -- Orders each gender group by Total in descending order (highest first)
                                   -- This line explains the commands above         -- Assigns a unique row number within each gender group, named Popularity
FROM baby_names; 

--6. what are the top 3 most popular names for each gender
