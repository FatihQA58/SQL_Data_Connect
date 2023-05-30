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
 SELECT company, number_of_employees,
 (SELECT AVG(salary) FROM employees WHERE employees.company=companies.company)
 FROM companies;
 
 
 CREATE TABLE customers_products
( 
  product_id INT,
  customer_name VARCHAR(50),
  product_name VARCHAR(50)
);
 
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_products VALUES (20, 'John', 'Apple');
INSERT INTO customers_products VALUES (30, 'Amy', 'Palm');
INSERT INTO customers_products VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_products VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_products VALUES (40, 'John', 'Apricot');
INSERT INTO customers_products VALUES (20, 'Eddie', 'Apple');               

SELECT *
FROM customers_products

--Find the records that has the product_name value as Orange, Apple or Palm
--1.way:
 SELECT * FROM customers_products
 WHERE product_name IN ('Orange','Apple','Palm');
 
 --2.way:
 SELECT * FROM customers_products
 WHERE PRODUCT_NAME='Orange' OR PRODUCT_NAME='Apple' OR PRODUCT_NAME='Palm';
 
 --Find the records that has not the product_name value as Orange, Apple or Palm
--NOT IN() CONDITION
SELECT * FROM customers_products
WHERE product_name NOT IN ('Orange','Apple','Palm');

--Find the product_names that have product_id less than 30 or equal to 30 and greater than 20 or equal to 20
--BETWEEN CONDITION
--1.way:
SELECT product_name FROM customers_products
WHERE product_id <=30 AND product_Id>=20;

--2.WAY
SELECT product_name FROM customers_products
WHERE product_id BETWEEN 20 AND 30;        --20 AND 30 ARE INCLUSIVE

--NOT BETWEEN CONDITION
--Select the records whose product id is less than 20 greater than 25
SELECT * FROM customers_products
WHERE product_id NOT BETWEEN 20 AND 25;

CREATE TABLE customers_likes
( 
  product_id CHAR(10),
  customer_name VARCHAR(50),
  liked_product VARCHAR(50)
);


INSERT INTO customers_likes VALUES (10, 'Mark', 'Orange');
INSERT INTO customers_likes VALUES (50, 'Mark', 'Pineapple');
INSERT INTO customers_likes VALUES (60, 'John', 'Avocado');
INSERT INTO customers_likes VALUES (30, 'Lary', 'Cherries');
INSERT INTO customers_likes VALUES (20, 'Mark', 'Apple');
INSERT INTO customers_likes VALUES (10, 'Adem', 'Orange');
INSERT INTO customers_likes VALUES (40, 'John', 'Apricot');
INSERT INTO customers_likes VALUES (20, 'Eddie', 'Apple');

SELECT * FROM customers_likes;
DROP table customers_likes;

--EXISTS COndition-->
--If the customer_name field has "Lary" among the customer_name field, update all customer_name field as "No Name".
--QUERY-->search operation to read the data--->SELECT is used to make quaries
--SUBQUERY-->If we use multiple SELECT keyword or if we use SELECT keyword in other lines of syntax it means it is a subquery

update customers_likes
SET customer_name='No name'
where exists (select customer_name from customers_likes where customer_name='Lary');