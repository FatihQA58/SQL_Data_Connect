/*---------FOREIGN KEY-------------------
Baska bir tablodaki primary key'i referans gostermek icin kullanilir.
Boylelikle tablolar arasinda parent-child iliskisi olusur.

FOREIGN KEY'in bulundugu tablo child tablodur.
PRIMARY KEY'in bulundugu tablo parent tablodur.

FOREIGN KEY kisitlamasi sayesinde;
-------------------------------------
1-)Parent tabloda olmayan primary key ile child tabloya veri girisi yapilamaz.
(Child tablo null degeri kabul eder.)

2-)Child tablodaki veri silinmeden, parent tablodaki veri silinmez.

3-)Child tablo silinmeden,parent tablo silinmez.
*/

CREATE TABLE HOSPITALS(
Hospital_name varchar(30) PRIMARY KEY,
Hospital_address varchar(30),
Hospital_area_code int
);
INSERT INTO HOSPITALS VALUES('Meddem','Isparta',0246);
INSERT INTO HOSPITALS VALUES('Sifa','Ankara',0236);
INSERT INTO HOSPITALS VALUES('Deva','Antalya',0242);
INSERT INTO HOSPITALS VALUES('Davraz','Istanbul',0216);

create table doctors(
work_place varchar(20),
doctor_name varchar(20),
diploma_number int,
expert_name varchar(20),
	
CONSTRAINT fk FOREIGN KEY(work_place) REFERENCES Hospitals(Hospital_name)
);
DROP TABLE Doctors;
INSERT INTO DOCTORS VALUES ('Meddem','John Paul',123456,'Psychiatry');
INSERT INTO DOCTORS VALUES ('Sifa','John pieter',234560,'Pediatry');
INSERT INTO DOCTORS VALUES ('Davraz','Paul Gelir',345612,'Noroloji');
INSERT INTO DOCTORS VALUES ('Meddem','Cemil Gider',456123,'Dahiliye');
INSERT INTO DOCTORS VALUES ('Deva','Ali Hal',561234,'Dermatoloji');
INSERT INTO DOCTORS VALUES ('Sifa','Veli can',612345,'Anestezi');
INSERT INTO DOCTORS VALUES ('Davraz','Suat Ari',123457,'Ortepedi');

select * from doctors;

--Enter data in the Doctors table with the place of work 'Meddem'.
INSERT INTO DOCTORS VALUES('Meddem','Ali Sagir',345765,'Uroloji');

--Enter data in the Doctors table with the place of work 'Okmeydani'.
-->data cannot be entered into the child table with the primary key that is not in the parent table
INSERT INTO DOCTORS VALUES ('Okmeydani','Kemal kilic',367765,'Uroloji');--Because of that it gives error

--Enter null as data into work_space in the doctors table.
INSERT INTO DOCTORS VALUES (null,'Haydar kilic',369765,'Patoloji');--Child table accepts null as data.

--Delete data that is called as 'Meddem' from Hospitals table.
--Do not delete data in the parent class before deleting data from child class.
delete  from hospitals where hospital_name='Meddem';--because of that it gives error.

--Delete data which is called 'Meddem' as work_space in the Doctors
DELETE FROM DOCTORS WHERE work_place='Meddem';

--Delete data which is called 'Meddem' as work_space in the Hospitals
DELETE FROM HOSPITALS WHERE HOSPITAL_NAME='Meddem';

select * from doctors;

select * from hospitals;

--delete hospitals table
--Hospitals table cannot be deleted before delete doctors table.
drop table hospitals;--Because of that It will give error.

--delete doctors table
drop table doctors;

--delete hospitals table
drop table hospitals;--After deleting doctors table that is possible.

/*---------------------ON DELETE CASCADE---------------------------

-------> ON DELETE CASCADE sayesinde;
1)Direk parent tablodaki veriyi silebiliyoruz.
Ayrica,
Direk parent tabloyu silebiliyoruz.
Bunun icin FK olan satirin en sonuna ON DELETE CASCADE komutu yazmaniz yeterli
___________________________________________________________________
*/
CREATE TABLE PARENT(
Tax_no int PRIMARY KEY,
company_name varchar(30),
contact_name varchar(20)
);

INSERT INTO parent VALUES(101,'Sony','Paul K.');
INSERT INTO parent VALUES(102,'Asus','john S.');
INSERT INTO parent VALUES(103,'HP','Kamil K.');
INSERT INTO parent VALUES(104,'Apple','Geert D.');

DROP TABLE PARENT;

CREATE TABLE CHILD(
TED_TAX_NO INT,
PRODUCT_ID INT,
PRODUCT_NAME VARCHAR(50),
CUSTOMER_NAME VARCHAR(30),
CONSTRAINT FK FOREIGN KEY(TED_TAX_NO) REFERENCES PARENT(TAX_NO)
ON DELETE CASCADE);

INSERT INTO CHILD VALUES(101,1001,'PC','ALI CAN');
INSERT INTO CHILD VALUES(102,1002,'CAMERA','VELI CAN');
INSERT INTO CHILD VALUES(103,1003,'TV','CAN ATAK');
INSERT INTO CHILD VALUES(104,1004,'RADIO','ALI CANLI');
INSERT INTO CHILD VALUES(101,1005,'WATCH','SALIH CAN');
INSERT INTO CHILD VALUES(102,1006,'PC','HALIM CAN');
INSERT INTO CHILD VALUES(NULL,1007,'TV','SALLI CAN');

select * from parent;

select * from child;

--Delete all data in the parent table
delete from parent;
--Thanks to on delete cascade, deleting the parent table without deleting the child table does not cause an error.
--But at the same time, child table is too deleted with parent table.

--Delete Parent table
DROP TABLE PARENT CASCADE;

--Delete Child table
DROP TABLE child;

/*---------------------------AGGREGATE METHOD KULLANIMI------------------------
AGGREGATE METHODLARI: Tek bir deger elde etmek istediginizde kullanilir.

sum()===>Verilerin toplamini alir.
count()=>Verilerin sayisini alir.
min()===>Verilerin en kucuk degerini alir.
max()===>Verilerin en buyugunu alir.
avg()===>Verilerin ortalamasini alir.

------------------------------------------------------------------------------*/
CREATE TABLE Vechicle(
id int,
marka varchar(20),
model varchar(20),
fiyat int,
kilometer int,
gear varchar(20)
);
INSERT INTO VECHICLE VALUES(100,'Citroen','C3',40000,25000,'automaat');
INSERT INTO VECHICLE VALUES(101,'Citroen','C2',30000,45000,'automaat');
INSERT INTO VECHICLE VALUES(102,'Mercedes','E200',190000,72000,'MANUEL');
INSERT INTO VECHICLE VALUES(103,'Mercedes','C180',220000,42000,'MANUEL');
INSERT INTO VECHICLE VALUES(104,'Ford','Fiesta',24000,5000,'automaat');
INSERT INTO VECHICLE VALUES(105,'Honda','Civic',80000,85000,'manuel');
INSERT INTO VECHICLE VALUES(106,'Porsche','Panamera',490000,5000,'automaat');

--select the highest fiyat in the vecihle table
select max(fiyat) as max_price from vechicle;

--select the lowest fiyat in the vecihle table
SELECT MIN(FIYAT) AS MIN_PRICE FROM VECHICLE;

--select the TOTAL fiyat in the vecihle table
SELECT SUM(FIYAT) AS TOTAL_PRICE FROM VECHICLE;

--select the AVERAGE fiyat in the vecihle table
SELECT AVG(FIYAT) AS AVG_PRICE FROM VECHICLE;

SELECT ROUND(AVG(FIYAT)) AS AVG_PRICE FROM VECHICLE;
--THE COMMAND IS USED TO GET RID OF THE DECIMALISED PART.

SELECT ROUND(AVG(FIYAT),2) AS AVG_PRICE FROM VECHICLE;

--SELECT HOW MANY VECHICLE IS THERE IN THE VECHICLE TABLE
--1.WAY
SELECT COUNT(FIYAT)AS VECHICLE_NUMBER FROM VECHICLE;

--2.WAY
SELECT COUNT(*)AS VECHICLE_NUMBER FROM VECHICLE;