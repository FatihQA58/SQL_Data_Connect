select * from companies;

select * from employees;

--Find the name of the companies, company ids maximum and minimum salaries per company
SELECT company, company_id,
                          (select max(salary) from Employees where employees.company=companies.company)as max_salary_per_company,
                          (select min(salary) from Employees where employees.company=Companies.company)as min_salary_per_company
FROM companies;

--LIKE CONDITION-->It is used with wildcards
--WILDCARDS--useful expression to do search operations
--1)% WILDCARD : It represents zero or more characters

--Select employee names which start with 'E'
SELECT name FROM employees
WHERE name LIKE 'E%';

--Select employee names which ends with 'e'
SELECT name FROM EMPLOYEES
WHERE name LIKE '%e';

--Select employee names which start with 'B' and ends with 't'
SELECT name FROM employees
WHERE name LIKE 'B%t';

--Select employee names which has 'a' in any position
SELECT name FROM employees
WHERE name LIKE '%a%';

--Select employee names which has 'e' and 'r' in any position
SELECT name FROM employees
WHERE name LIKE '%e%r%' OR name LIKE '%r%e%';

--2)Underscore WILDCARD:It represents a single character

--Select state whose second character is 'e'and forth is 'n'
SELECT state FROM employees
WHERE state LIKE '_e_n%';

--Select state whose last second character is 'i'
SELECT state FROM employees
WHERE state LIKE '%i_';

--Select state whose second character is 'e' and it has least six characters
SELECT state from employees
where state LIKE '_e____%';

--Select state which has 'i' in any position after second character
SELECT state from employees
WHERE state LIKE '__%i%';

--NOT LIKE CONDITION
CREATE TABLE words(
word_id char(10) unique,
word varchar(50) not null,
number_of_letters smallint
);

insert into words values(1001,'hot',3);
insert into words values(1002,'hit',3);
insert into words values(1003,'hbt',3);
insert into words values(1004,'hct',3);
insert into words values(1005,'adem',4);
insert into words values(1006,'selena',6);
insert into words values(1007,'yusuf',5);

--Select words which do not have 'h' in any position
SELECT word from WORDS
WHERE word not like '%h%';

--Select words which do not end 't' and do not end 'f' in any position
SELECT word from WORDS
WHERE word not like '%t%'and word not like '%f%' ;

--Select words which start with any character, not followed by 'a', not followed by 'e'.
select word from words
where word not like '_a%' AND WORD NOT LIKE '_e%';

--REGEXP_LIKE condition : You can use regular expression with REGEXP_LIKE Condition
--Select words whose first character is'h', last character is 't' and second character is 'o' or 'a' or 'i'
SELECT word from words 
where regexp_like (word,'h[oai](.*)t');

--OR USE ~
SELECT WORD FROM WORDS
WHERE WORD ~ 'h[oai](.*)t';

----Select words whose first character is'h', last character is 't' and second character is 'a' to 'e'
SELECT WORD FROM WORDS
WHERE word ~ 'h[a-e](.*)t';

--Selece words whose first character is 's' or 'a' or 'y'
SELECT WORD FROM WORDS
WHERE WORD ~ '^[say](.*)';--'^'means first character if you use it before brackets

--Selece words whose last character is 'm' or 'a' or 'f'
SELECT WORD FROM WORDS
WHERE word ~ '(.*)[maf]$'--'$' means last character when you use it after the brackets

--Selece words which have 'a' in any position
--1.WAY
select word from words
where word ~ '(.*)a(.*)';

--2.WAY
select word from words
where word ~ 'a'; --3.WAY We %And %

--Select words which have characters from 'd' to 't' at the begining followed by any character and then 'l'
SELECT word FROM words
where word ~'^[d-t].l';--> '.' means "any character"

--Select words which have characters from 'd' to 't' at the begining followed by any two character and then 'e'
SELECT word FROM words
where word ~ '^[d-t]..e';

--Select employee names which do not start with 'E' and do not end with 'y'
--1.WAY
SELECT * FROM employees;

select name from employees 
Where name not like 'E%y';

--2.WAY
select name from employees 
Where name ~ '^[^E](.*)[^y]$';--if you use '^' insede the brackets([^]) it means the character different from identified character

--select states whose third character is 'o' or 'x'
select state from employees
where state ~ '..[ox](.*)';

--select states whose third character from the end is not "n" or 'x'
select state from employees
where state ~ '(.*)[^nx]$';