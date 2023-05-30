SELECT * From workers;

--Increase the salary of Veli Han to 20 percent less than the highest salary
UPDATE workers SET worker_salary=(SELECT MAX(worker_salary)*0.8 FROM workers)
WHERE worker_name='JOHN PAUL';

--Decrease the salary of George Smith to 30 percent more than the lowest salary
UPDATE workers SET worker_salary=(SELECT MIN(worker_salary)*1.13 FROM workers)
WHERE worker_name='GEORGE SMITH';

--Increase the salaries by 1000 if the salaries are less then the averege salary.
UPDATE workers SET worker_salary=(worker_salary+1000)
WHERE worker_salary < (SELECT AVG(worker_salary) FROM workers);

--Make the salaries equal to the average salary if the salaries are less then the average salary
UPDATE workers SET worker_salary=(SELECT AVG (worker_salary) FROM workers)
WHERE worker_salary<(SELECT AVG(worker_salary)FROM workers);
 
 --CONDITIONS, STATEMENTS, EXPRESSIONS IN SQL
 --IS NULL Conditition
 CREATE TABLE PEOPLE(
 SSN INT,
 NAME VARCHAR(50),
 ADDRESS VARCHAR(80)
 );
 
 INSERT INTO people values (123456789,'Mark Star','Florida');
 INSERT INTO people values (234567890,'John Star','Frankfurt');
 INSERT INTO people values (345678912,'Alies Star','Paris');
 INSERT INTO people(SSN,ADDRESS) values (456789123,'Istanbul');
 INSERT INTO people(SSN,ADDRESS) values (567891234,'Amsterdam');
 INSERT INTO people(SSN,name) values (678912345,'Mary Pret');
 
 --Change null names to "Name will be inserted later"
 UPDATE people 
 SET name='Name will be inserted later'
 WHERE name IS NULL;
 
 --Change null addresses to "Name will be inserted later"
 UPDATE people 
 SET address= 'Addres will be inserted later'
 WHERE address IS NULL;
 
 --How to Delete record from a table
 DELETE FROM people
 WHERE ssn=123456789;
 
 --Delete records which do not have name
 DELETE FROM people 
 WHERE name IS NULL;
 
 --Delete ALL records
 DELETE FROM people;
 
 --Delete command deletes just the records, it does not destroy the table from database.
 
 ----Delete ALL records whose name is null or address is null
 DELETE FROM people
 WHERE name IS NULL OR address IS NULL;
 
 ----Delete ALL records whose ssn is greater than 123456789 and less than 345678912
 DELETE FROM people
 WHERE ssn>123456789 AND ssn<345678901;
 
 --Delete all records whose name is not null
 DELETE FROM people 
 WHERE name IS NOT NULL;
 
 --TRUNCATE COMMAND REMOVES ALL RECORDS EVERYTIME
 TRUNCATE TABLE people;
 --INTERVIEW
 --What is the difference between DELETE and TRUNCATE and DROP query?
--The DELETE command deletes one or more existing records from the table in the database. 
--The DROP Command drops the complete table from the database. 
--The TRUNCATE Command deletes all the rows from the existing table, leaving the row with the column names.
 
 SELECT * from people;
 
 DROP TABLE people;
 
 SELECT * FROM WORKERS;--DQL: Data Query Language.We use "SELECT" keyword to do queries.
 
 --How to get specific field from a table
 SELECT worker_name FROM WORKERS;
 
 --How to get multiple specific field from a table
 SELECT worker_name,worker_salary from WORKERS;
 
 --How to get a specific record
 SELECT * FROM WORKERS
 WHERE worker_id=101;
 
 --Get the records whose salary is 2000 or 7000 or 12000
 --1.WAY
 SELECT * FROM workers
 WHERE worker_salary=2000 OR worker_salary=16483 OR worker_salary=16113;
 
 --2.WAY
 SELECT * FROM WORKERS
 WHERE WORKER_SALARY IN(2000,16483,16113); --IN() is used instead of repeated 'OR'
 
 --Interview Question: How to select record whose salary is second highest (TASK)
SELECT MAX(worker_salary) AS max_second_salary FROM workers
WHERE worker_salary<(SELECT MAX(worker_salary)FROM workers);

--Select Maximum salary
--By using 'AS'(ALLIES) You can put temporary filed names for your table on the console
SELECT MAX(WORKER_SALARY) AS maximum_salary FROM WORKERS;

--Select minimum salary by using AS
SELECT MIN(WORKER_SALARY) AS MINIMUM_SALARY FROM WORKERS;

--Select average salary value by using "AS"
select avg (worker_salary) as average_salary from workers;

--Count the number of workers
select count(worker_id) as number_of_workers from workers;

--Find the sum of worker_salaries
SELECT SUM(worker_salary) AS total_salary FROM workers;

SELECT * FROM WORKERS;

--Aggregate functions in postgreSQL MAX,MIN,SUM,COUNT,AVG

--Interview Question : Select the second lowest salary
SELECT MIN(worker_salary) AS second_lowest_salary FROM workers
WHERE worker_salary >(SELECT MIN (worker_salary)FROM workers);


--Interview Question : How to select records whose salary is the lowest and highest
--1.WAY
SELECT * from workers
where worker_salary=(select min(worker_salary)from workers) OR worker_salary=(select max(worker_salary)from workers);

--2.WAY
SELECT * FROM workers
WHERE worker_salary IN ((SELECT MIN(worker_salary) FROM workers),(SELECT MAX (worker_salary)FROM workers));





