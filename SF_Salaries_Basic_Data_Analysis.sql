-- San Fransisco Salaries data analysis

-- Creating a new database 
CREATE DATABASE sf_salaries;

-- Enter sf_salaries database
USE sf_salaries;

-- How many employees are there in the table?
SELECT COUNT(*)
FROM salaries;

-- show the unique job titles 
SELECT DISTINCT(jobtitle)
FROM salaries;

-- How many unique job titles are present?
SELECT COUNT(DISTINCT(jobtitle))
FROM salaries;

-- show the job title and overtime pay for employees greater than 50,000
SELECT jobtitle, overtimepay
FROM salaries
WHERE overtimepay > 50000
ORDER BY overtimepay DESC;

-- what is the average base pay for all the employees and round it upto 2 decimal.
SELECT ROUND(AVG(basepay),2) AS average_base_pay
FROM salaries;

-- show the top 10 highest paid employees
SELECT employeename, totalpay
FROM salaries
ORDER BY totalpay DESC
LIMIT 10;

-- what is the average pay for each employee
SELECT employeename, ROUND((basepay + overtimepay + totalpay)/3 , 2 ) AS average_pay
FROM salaries;

-- show all the empoyees who has the word "manager" in their job title.
SELECT employeename, jobtitle
FROM salaries
WHERE jobtitle LIKE "%manager";

-- show all employees with a job title not equal to "manager"
SELECT employeename, jobtitle
FROM salaries
WHERE jobtitle NOT LIKE "%manager";

-- show all employees with total pay between 50,000 and 75,000.
SELECT employeename, totalpay
FROM salaries
WHERE totalpay BETWEEN 50000 AND 75000;

-- show all employees with base pay less than 50,000 but total pay greater than 100,000
SELECT employeename, basepay, totalpay
FROM salaries
WHERE basepay < 50000 AND totalpay > 100000;

-- show all employees with total pay benefits between 125,000 and 150,000 and job title containing word "Director"
SELECT employeename, jobtitle, totalpaybenefits
FROM salaries
WHERE totalpay BETWEEN 125000 AND 150000
		AND jobtitle LIKE "%Director%";
        
-- show all the job titles with the average base pay of at least 100,000
SELECT jobtitle, ROUND(AVG(basepay) , 2) AS avg_jobtitle_pay
FROM salaries
GROUP BY jobtitle
HAVING avg_jobtitle_pay > 100000
ORDER BY avg_jobtitle_pay DESC;

-- delete the columns "Notes"
ALTER TABLE salaries
DROP COLUMN Notes;

-- update the base pay of all employees with job title containing "manager" by increasing it by 10%.
UPDATE salaries
SET basepay = basepay + (0.01 * basepay)
WHERE jobtitle LIKE "%manager%";

-- https://www.youtube.com/watch?v=8pQGJbcGLi0 
-- https://www.kaggle.com/datasets/kaggle/sf-salaries 
