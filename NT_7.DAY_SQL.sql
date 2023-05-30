SELECT * FROM EMPLOYEES;

--Select states whose third character is 'o' or 'x'

--1.way
SELECT state FROM EMPLOYEES 
WHERE state LIKE '__o%' or state LIKE '__x%';

--2.way
SELECT state FROM EMPLOYEES 
WHERE state ~ '..[ox]';

--Select states whose third character from the end is not 'n' or 'x'

--1.way
SELECT DISTINCT state FROM EMPLOYEES 
WHERE state NOT like '%n__' AND state not like '%x__';

--2.way
SELECT DISTINCT state FROM EMPLOYEES 
WHERE state ~ '[^nx]..$';

/*---------------------ORDER BY---------------------

-->TO PUT THE RECORDS IN ASCENDING OR DESCENDING ORDER WE USE ORDER BY
   ORDER BY CAN BE USED JUST WITH SELECT STATEMENT
   
--------------------------------------------------*/

--Put the records in descending order by using number_of_letters
SELECT * FROM WORDS
ORDER BY number_of_letters ASC;--ASC (ascending) is optional to type but if required for DESC(descending) you have to type it

--2.way
SELECT *
FROM words
ORDER BY 3 ASC;--3 stands for field order number for the given field

--In ORDER BY instead field names, the order number of the field can be used as well.


--Put the records in descending order by using word
SELECT * FROM WORDS
ORDER BY word DESC;

CREATE TABLE points
(
    name VARCHAR(50),
    point SMALLINT
);

INSERT INTO points values('Ali', 25);
INSERT INTO points values('Veli', 37);
INSERT INTO points values('Kemal', 43);
INSERT INTO points values('Ali', 36);
INSERT INTO points values('Ali', 25);
INSERT INTO points values('Veli', 29);
INSERT INTO points values('Ali', 45);
INSERT INTO points values('Veli', 11);
INSERT INTO points values('Ali', 125);

SELECT *
FROM points;

--Put the records in descending order by using name field, and ascending order by using points
SELECT * FROM POINTS
ORDER BY NAME DESC ,POINT ASC;

CREATE TABLE employee 
(  
  employee_id CHAR(9), 
  employee_first_name VARCHAR(20),
  employee_last_name VARCHAR(20)
);

INSERT INTO employee VALUES(14, 'Chris', 'Tae');
INSERT INTO employee VALUES(11, 'John', 'Walker');
INSERT INTO employee VALUES(12, 'Amy', 'Star');
INSERT INTO employee VALUES(13, 'Brad', 'Pitt');
INSERT INTO employee VALUES(15, 'Chris', 'Way');

SELECT * FROM employee;

CREATE TABLE addresses 
(  
  employee_id CHAR(9), 
  street VARCHAR(20),
  city VARCHAR(20),
  state CHAR(2),
  zipcode CHAR(5)
);

INSERT INTO addresses VALUES(11, '32nd Star 1234', 'Miami', 'FL', '33018');
INSERT INTO addresses VALUES(12, '23rd Rain 567', 'Jacksonville', 'FL', '32256');
INSERT INTO addresses VALUES(13, '5th Snow 765', 'Hialeah', 'VA', '20121');
INSERT INTO addresses VALUES(14, '3rd Man 12', 'Weston', 'MI', '12345');
INSERT INTO addresses VALUES(15, '11th Chris 12', 'St. Johns', 'FL', '32259');

SELECT * FROM addresses;

--ALIES -->

--How to use aliase for table names
--1)Select employee_first_name and state, for employee first name use "firstname" as field name 
--and for state use "employee state" as field name
SELECT e.employee_first_name AS firstname, a.state AS "employee state"
FROM employees e, addresses a
WHERE e.employee_id=a.employee_id;


--How to put multiple fields into one field and use alies for naming the field
--2)Get employee id use "id" as field name, get firstname and lastname put them into the same field and use "full_name" as field name

SELECT employee_id AS id,employee_first_name || '' || employee_last_name AS full_name
FROM employee;

select * from employees;

--Find the total salary for every employee
select name ,SUM(salary) as total_salary
from employees
GROUP BY name
ORDER BY TOTAL_salary ASC;

--Find the number of employees per state in descending order by employee number
SELECT state, count(name) as employee_number
from employees
group by state
order by employee_number desc;

--Find the number of the employees whose salary is more than $2000 per company
SELECT company,count(ID) AS NUMBER_OF_EMPLOYEE
FROM EMPLOYEES
WHERE salary>2000
GROUP BY company
ORDER BY NUMBER_OF_EMPLOYEE DESC;

--Find the minimum and maximum salary for every company
SELECT company, MAX(salary) as max_salary,MIN(salary) as min_salary
from employees
group by company
order by max_salary desc,min_salary desc ;

--HAVING CLAUSE
--Find the total salary if it is greater than 2500 for every employee
SELECT NAME,SUM(SALARY) AS TOTAL_SALARY
FROM EMPLOYEES
GROUP BY NAME
HAVING SUM(SALARY)>2500;

--After GROUP BY use HAVING. We cannot use WHERE after GROUP BY. Because after WHERE condition you cannot use 
--Aggregate Functions like SUM, COUNT, MAX, MIN, AVG

--Find the number of employees if it is more than 1 per state
SELECT STATE,COUNT(STATE) AS NUMBER_OF_EMPLOYEES
FROM EMPLOYEES
GROUP BY STATE 
HAVING COUNT(STATE)>1;



