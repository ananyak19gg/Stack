SELECT *
FROM Parks_and_Recreation.employee_demographics;

SELECT first_name
FROM Parks_and_Recreation.employee_demographics;

SELECT first_name, last_name, birth_date,age,  (age + 10) * 10 + 10
FROM parks_and_recreation.employee_demographics;

# PEMDAS - Paranthesis, Exponent, Multiplication, Division, Addition, Substraction
SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

-- Where Clause
SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie'; 

SELECT * 
FROM employee_salary
WHERE salary >= 50000; 

SELECT *
FROM employee_demographics
WHERE gender != 'Female';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

-- AND OR NOT --
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male';

SELECT * 
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 46;

-- Like statement
-- % and _
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a%';
-- 2 _ means only two letter after a (specific value) -- 
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__';

-- 3 _ will return different
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___';

 -- this says specific 2 letters after a and then anything after --
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%';

-- Group by
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- order by -- sort in either ascending or descending order
SELECT *
FROM employee_demographics
ORDER BY first_name DESC; -- ASC and DESC 

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC; -- writing ORDER BY age, gender will return different table
-- gender, age DESC - here DESC will only work for age

SELECT *
FROM employee_demographics
ORDER BY 5, 4; -- 5 and 4 are column number

-- Having vs Where (you cannot use aggregate functions in where clause
SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary) > 75000; -- having will only work in aggregated fnx after group by 

-- LIMIT and aliasing
SELECT *
FROM employee_demographics
ORDER BY age DESC -- oldest 3 people
LIMIT 3;

SELECT *
FROM employee_demographics
ORDER BY age DESC 
LIMIT 2, 1; -- this will start at 2 and give next 1 after

-- Aliasing
SELECt gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40;

-- JOINS 
-- inner join
 SELECT dem.employee_id, age, occupation -- if we want to select a column which is common in both then we need to specify which table like dem.employee_id
 FROM employee_demographics AS dem
 INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;
    
-- outer join - left outer and right outer join
 SELECT * 
 FROM employee_demographics AS dem -- left table 
 RIGHT JOIN employee_salary AS sal -- employee_salary is right table
	ON dem.employee_id = sal.employee_id;

-- SELF JOIN
SELECT emp1.employee_id AS emp_santa, 
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name, 
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id;
    
-- Joining multiple tables together
 SELECT * 
 FROM employee_demographics AS dem -- left table 
 INNER JOIN employee_salary AS sal -- employee_salary is right table
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id;
    
SELECT *
FROM parks_departments;

-- UNIONS
SELECT first_name, last_name
FROM employee_demographics
UNION -- use UNION ALL to get result with duplictes
SELECT first_name, last_name
FROM employee_salary;

SELECT first_name, last_name,'OLD lady' AS label
FROM  employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'OLD man' AS label
FROM  employee_demographics
WHERE age > 40 AND gender = 'MALE'
UNION
SELECT first_name, last_name, 'highly paid employee' AS label
FROM  employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;

-- String functions
SELECT LENGTH('skyfall');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2; 
SELECT UPPER('sky');
SELECT LOWER('MOUnt');
SELECT first_name, UPPER(first_name)
FROM employee_demographics;

SELECT TRIM('      sky     ');
SELECT RTRIM('                   sky     '); -- LTRIM for left and RTRIM for right
SELECT first_name,
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name,3,2),
birth_date,
SUBSTRING(birth_date,6,2) birth_month
FROM employee_demographics;  

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

SELECT LOCATE('x','Alexander');
SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) full_name
FROM employee_demographics;

SELECT first_name, last_name,
CASE
    WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 and 50 THEN 'old'
    WHEN age >= 50 THEN 'on death door'
END Age_Bracket
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- Pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus

SELECT first_name, salary, dept_id,
CASE 
     WHEN salary > 50000 THEN salary + (salary*0.07)
     WHEN salary < 50000 THEN salary * 1.05 -- same 
END  AS salary_upated,
CASE
    WHEN dept_id = 6 THEN salary * .10
END AS bonus
FROM employee_salary;
SELECT *
FROM parks_departments;

-- subqueries
SELECT *
FROM employee_demographics
WHERE employee_id IN -- IN is an opeartor
				(SELECT employee_id -- operand can only have one column
                 FROM employee_salary
			     WHERE dept_id = 1);

SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary)
FROM employee_salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;
                 
SELECT gender, AVG(`MAX(age)`) -- backtick not quotes
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table	
GROUP BY gender;		
                 
SELECT dem.first_name, gender, AVG(salary) as avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	 ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name,  gender;

-- Window function
SELECT dem.first_name, gender, 
SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	 ON dem.employee_id = sal.employee_id;

-- rolling total
SELECT dem.first_name, gender, salary,
SUM(salary) OVER(PARTITION BY dem.employee_id) as Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal
	 ON dem.employee_id = sal.employee_id;
     
SELECT dem.employee_id, dem.first_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as dense_rank_num -- gives next rank positionally not numerically 
FROM employee_demographics dem
JOIN employee_salary sal
	 ON dem.employee_id = sal.employee_id;
     
-- ON DATEDIFF(w1.recordDate, w2.recordDate) = 1 -- DATEDIFF function
-- CTE
WITH CTE_example (Gender, AVG_Sal, MAX_Sal, MIN_Sal,COUNT_Sal) AS
(     
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT * -- AVG(avg_sal) works fine  -- CTE will only be used only immediately after
FROM CTE_example;

WITH CTE_example  AS
(     
SELECT gender, birth_date, employee_id
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT * -- CTE will only be used only immediately after
FROM CTE_example
JOIN CTE_example2
	ON CTE_example.employee_id = CTE_example2.employee_id;

-- TEMPORARY TABLES -- only lasts one session

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar (50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES('Ananya', 'Dubey', 'just like heaven');
SELECT *
FROM temp_table;

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM salary_over_50k;

-- Stored procedure

SELECT *
FROM employee_salary
WHERE salary >= 50000;

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salaries();

DROP procedure if exists 'large_salaries2' 
DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salaries2();

DROP procedure if exists 'large_salaries3' 
DELIMITER $$
CREATE PROCEDURE large_salaries3(muffin INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = muffin;
END $$
DELIMITER ;

CALL large_salaries3(1);

-- TRIGGER
DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary 
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name); -- new will take only new row that are inserted, (old) will take deleted or updated row
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean', 'Saperstein', 'Entertainment', 10000, null);

Select *
From  employee_salary;
SELECT *
FROM employee_demographics;

-- EVENTS
SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retires
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;
SHOW VARIABLES LIKE 'event%';