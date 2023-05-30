 --Interview Question: How to select record whose salary is second highest (TASK)
 SELECT * FROM WORKERS;
 
 --second highest
 --1.WAY
 SELECT MAX(WORKER_SALARY)FROM WORKERS
 WHERE WORKER_SALARY<(SELECT MAX(WORKER_SALARY)FROM WORKERS);
 
 --second highest
 --2.WAY-->IN NATURAL ORDER IN ASCENDING ORDER 
 SELECT *
 FROM WORKERS
 ORDER BY WORKER_SALARY DESC
 OFFSET 1 ROW
 FETCH NEXT 1 ROW ONLY;
 
 --second lowest
 SELECT *
 FROM WORKERS
 ORDER BY WORKER_SALARY 
 OFFSET 1 ROW 
 FETCH NEXT 1 ROW ONLY;
 
 --third highest
 --1.WAY
 SELECT MAX(WORKER_SALARY)
 FROM WORKERS
 WHERE WORKER_SALARY<(SELECT MAX(WORKER_SALARY)AS second_highest 
 FROM WORKERS
 WHERE WORKER_SALARY<(SELECT MAX(WORKER_SALARY)FROM WORKERS));
 
 --third highest
 --2.WAY
 SELECT * FROM WORKERS
 ORDER BY WORKER_SALARY DESC
 OFFSET 2 ROW
 FETCH NEXT 1 ROW ONLY;
 
 CREATE TABLE employees 
(  
  id CHAR(9), 
  name VARCHAR(50), 
  state VARCHAR(50), 
  salary SMALLINT,
  company VARCHAR(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT * FROM employees;

CREATE TABLE companies 
(  
  company_id CHAR(9), 
  company VARCHAR(20),
  number_of_employees SMALLINT
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);

SELECT * FROM companies;

SELECT * FROM employees;

--Find the employee and company names whose company has more than 15000 employees
 SELECT name,company FROM employees
 WHERE company IN (SELECT company FROM companies WHERE number_of_employees>15000);
 
 --Find the company names and company ids which are in Florida.
 SELECT COMPANY,COMPANY_ID FROM COMPANIES
 WHERE company IN (SELECT COMPANY FROM EMPLOYEES WHERE state='Florida');
 
 --Find names and their states whose company id is greater than 100
 SELECT name,state FROM employees
 WHERE company IN(SELECT company from COMPANIES where company_id>'100');
 
 --Find the company name, number of employees and average salary for every company
 SELECT company, number_of_employees FROM companies
 WHERE company=
 (SELECT AVG(salary) FROM employees)
 
 
 
 
 
 
 
 
 