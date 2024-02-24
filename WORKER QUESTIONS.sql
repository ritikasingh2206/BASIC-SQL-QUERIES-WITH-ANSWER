CREATE DATABASE ORG;

USE ORG;

CREATE TABLE Worker (
	WORKER_ID INT NOT NULL PRIMARY KEY,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	SALARY INT,
	JOINING_DATE DATETIME,
	DEPARTMENT VARCHAR(50));

SELECT * FROM Worker;

INSERT INTO Worker 
		(WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
		(001, 'Monika', 'Arora', 100000, '2021-02-20 09:00:00', 'HR'),
		(002, 'Niharika', 'Verma', 80000, '2021-06-11 09:00:00', 'Admin'),
		(003, 'Vishal', 'Singhal', 300000, '2021-02-20 09:00:00', 'HR'),
		(004, 'Amitabh', 'Singh', 500000, '2021-02-20 09:00:00', 'Admin'),
		(005, 'Vivek', 'Bhati', 500000, '2021-06-11 09:00:00', 'Admin'),
		(006, 'Vipul', 'Diwan', 200000, '2021-06-11 09:00:00', 'Account'),
		(007, 'Satish', 'Kumar', 75000, '2021-01-20 09:00:00', 'Account'),
		(008, 'Geetika', 'Chauhan', 90000, '2021-04-11 09:00:00', 'Admin');

CREATE TABLE Bonus (
	WORKER_REF_ID INT,
	BONUS_AMOUNT INT,
	BONUS_DATE DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) 
VALUES 
    (001, 5000, CONVERT(DATE, '2023-02-20', 23)),
    (002, 3000, CONVERT(DATE, '2011-06-23', 23)),
    (003, 4000, CONVERT(DATE, '2023-02-20', 23)),
    (001, 4500, CONVERT(DATE, '2023-02-20', 23)),
    (002, 3500, CONVERT(DATE, '2011-06-23', 23));

SELECT * FROM Bonus;


CREATE TABLE Title (
	WORKER_REF_ID INT,
	WORKER_TITLE CHAR(25),
	AFFECTED_FROM DATETIME,
	FOREIGN KEY (WORKER_REF_ID)
		REFERENCES Worker(WORKER_ID)
        ON DELETE CASCADE);

INSERT INTO Title 
	(WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
 (001, 'Manager', '2023-02-20 00:00:00'),
 (002, 'Executive', '2023-06-11 00:00:00'),
 (008, 'Executive', '2023-06-11 00:00:00'),
 (005, 'Manager', '2023-06-11 00:00:00'),
 (004, 'Asst. Manager', '2023-06-11 00:00:00'),
 (007, 'Executive', '2023-06-11 00:00:00'),
 (006, 'Lead', '2023-06-11 00:00:00'),
 (003, 'Lead', '2023-06-11 00:00:00');


SELECT * FROM Title;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from the Worker table using the alias name <WORKER_NAME>.

SELECT FIRST_NAME FROM Worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from the Worker table in upper case.

SELECT upper(FIRST_NAME) AS FIRST_NAME FROM Worker;

--Q-3. Write an SQL query to fetch unique values of DEPARTMENT from the Worker table.

SELECT DISTINCT(DEPARTMENT) AS DEPARTMENTS FROM Worker;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from the Worker table.

SELECT LEFT(FIRST_NAME, 3) FROM Worker;

SELECT SUBSTRING(FIRST_NAME, 1, 3) AS FIRST_NAME FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘a’) in the first name column ‘Amitabh’ from the Worker table.

SELECT * FROM Worker;

SELECT CHARINDEX('a', FIRST_NAME) AS POSITION_A from Worker 
WHERE FIRST_NAME = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from the Worker table after removing white spaces from the right side.

-- RTRIM - used to remove trailing (right-side) spaces from a string

SELECT RTRIM(FIRST_NAME) AS FIRST_NAME_WITHOUT_RIGHT_WHITESPACES FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from the Worker table after removing white spaces from the left side.

SELECT LTRIM(FIRST_NAME) AS FIRST_NAME_WITHOUT_LEFT_WHITESPACES FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from the Worker table and prints its length.

SELECT DISTINCT len(DEPARTMENT) AS LEN_DEPARTMENTS FROM Worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from the Worker table after replacing ‘a’ with ‘A’.

SELECT REPLACE(FIRST_NAME, 'a', 'A') AS FIRST_NAME FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from the Worker table into a single column COMPLETE_NAME. A space char should separate them.

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS COMPLETE_NAME FROM Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.

SELECT * FROM Worker
ORDER BY FIRST_NAME ASC;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending and DEPARTMENT Descending.

SELECT * FROM Worker
ORDER BY FIRST_NAME ASC, DEPARTMENT DESC;

-- Q-13. Write an SQL query to print details for Workers with the first names “Vipul” and “Satish” from the Worker table.

SELECT * FROM Worker
WHERE FIRST_NAME IN ('Vipul','Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from the Worker table.

SELECT * FROM Worker
WHERE FIRST_NAME NOT IN ('Vipul','Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin”.

SELECT * FROM Worker
WHERE DEPARTMENT IN ('Admin');

SELECT * FROM Worker WHERE DEPARTMENT LIKE 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.

SELECT * FROM Worker
WHERE FIRST_NAME LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.

SELECT * FROM Worker
WHERE FIRST_NAME LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.

SELECT * FROM Worker
WHERE FIRST_NAME LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.

SELECT * FROM Worker
WHERE SALARY BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who joined in Feb 2021.

SELECT * FROM Worker
WHERE YEAR(JOINING_DATE) = 2021 AND MONTH(JOINING_DATE)= 2;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.

SELECT COUNT(*) AS COUNT_ADMIN FROM Worker
WHERE DEPARTMENT = 'Admin';

-- Q-22. Write an SQL query to fetch worker names with salaries >= 50000 and <= 100000.

SELECT CONCAT(FIRST_NAME, ' ', LAST_NAME) AS WORKER_NAME, SALARY FROM Worker
WHERE SALARY BETWEEN 50000 AND 100000;

-- Q-23. Write an SQL query to fetch the number of workers for each department in descending order.

SELECT DEPARTMENT, COUNT(WORKER_ID) AS NO_OF_WORKERS FROM Worker
GROUP BY DEPARTMENT
ORDER BY NO_OF_WORKERS DESC;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.

SELECT Worker.FIRST_NAME, Title.WORKER_TITLE FROM Worker
INNER JOIN Title ON Worker.WORKER_ID = Title.WORKER_REF_ID
WHERE Title.WORKER_TITLE = 'Manager';

-- Q-25. Write an SQL query to fetch duplicate records having matching data in some fields of a table.

SELECT WORKER_TITLE, AFFECTED_FROM FROM Title
GROUP BY WORKER_TITLE, AFFECTED_FROM
HAVING COUNT(*) > 1;

-- Q-26. Write an SQL query to clone a new table from another table.

SELECT * INTO WorkerClone FROM Worker;

-- Q-27. Write an SQL query to fetch intersecting records of two tables.

SELECT * FROM Worker
INTERSECT
SELECT * FROM WorkerClone;

-- Q-28. Write an SQL query to show the current date and time.

SELECT GETDATE() AS TODAY_DATETIME;

-- Q-29. Write an SQL query to show the top n (say 10) records of a table.

SELECT TOP 10 * FROM Worker 
ORDER BY Salary DESC;

-- Q-30. Write an SQL query to print the names of employees having the highest salary in each department.

SELECT t.DEPARTMENT,t.FIRST_NAME,t.Salary FROM(SELECT MAX(Salary) 
AS TotalSalary,DEPARTMENT FROM Worker 
GROUP BY DEPARTMENT) AS TempNew 
Inner Join Worker t ON TempNew.DEPARTMENT=t.DEPARTMENT 
 and TempNew.TotalSalary=t.Salary;

 SELECT * FROM Title