------------------SUBQUERY---------------------
--SUBQUERY IS A QUERY THAT RUNS WITHIN A QUERY
----------------------------------------------
create table materials(
ted_taxno int,
material_id int,
material_name VARCHAR(20),
CUSTOMER_NAME varchar(25)
);

INSERT INTO materials VALUES(201,1001,'LAPTOP','Geert B');
INSERT INTO materials VALUES(202,1002,'PHONE','John P');
INSERT INTO materials VALUES(203,1003,'TV','Geert D');
INSERT INTO materials VALUES(204,1004,'PC','Hasan B');
INSERT INTO materials VALUES(205,1005,'PHONE','Geda B');

CREATE TABLE WHOLESALERS(
TAX_NO INT,
COMPANY_NAME VARCHAR(40),
CONTACT_NAME VARCHAR(30)
);

INSERT INTO WHOLESALERS VALUES (201,'IBM','KADIR A.');
INSERT INTO WHOLESALERS VALUES (202,'DELL','SALIH B.');
INSERT INTO WHOLESALERS VALUES (203,'CASPER','ALI C.');

SELECT * FROM MATERIALS;

SELECT * from WHOLESALERS;

--Question 1: Materials table daki customer_name 'Geda B' olanin material_name'ini,
--wholesalers table'da contact_name 'KADIR A' olan company_name ile guncelleyiniz.

UPDATE MATERIALS SET MATERIAL_NAME =(SELECT COMPANY_NAME FROM WHOLESALERS WHERE CONTACT_NAME='KADIR A.') 
WHERE CUSTOMER_NAME='Geda B';

--QUESTION 2:Materials table'daki material_name'i 'LAPTOP' olan customer_name'leri ,
--wholesalers table'da company_name 'Apple'in contact_name ile guncelleyiniz.
UPDATE MATERIALS SET customer_name=(SELECT contact_name FROM WHOLESALERS WHERE company_name='IBM')
WHERE material_name='LAPTOP';

SELECT * FROM MATERIALS;
 
SELECT * FROM MATERIALS ORDER BY MATERIAL_NAME  ;

SELECT * FROM MATERIALS ORDER BY MATERIAL_ID DESC;

select * from Materials where customer_name='John P' order by ted_taxno desc ;

select * from Materials ORDER BY LENGTH(MATERIAL_NAME);

select * from Materials ORDER BY LENGTH(CUSTOMER_NAME) DESC;

SELECT * FROM WORKERS;












