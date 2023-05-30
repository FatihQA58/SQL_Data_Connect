/*
====================CONSTRAINT-KISITLAMALAR===========================
1)UNIQUE   --->Bir sutundaki verilerin BENZERSIZ olmasidir.(2 veya daha fazla NULL degeri kabul eder. )

2)NOT NULL  -->Bir sutunun NULL ICERMEMESINI saglar.
(NOT NULL kisitlamasi, data turundan hemen sonra yazilir.constraint ismi tanimlanamaz.)

3)PRIMARY KEY->UNIQUE(BENZERSIZ)+NOT NULL
Bir tabloda en fazla bir adet Primary key olur.
Iki sutunun birlersiminden bir primary key OLUSTURULMASINA ise COMPOSITE PRIMARY KEY denir.

4)CHECK     -->Bir sutunun deger araligini sinirlamak icin kullanilir.

5)FOREIGN KEY->Baska bir tablodaki PRIMARY KEY'i referans gostermek icin kullanilir.
Byolelikle tablolar arasinda Parent-Child iliskisi olusur.

*/
create table officer(
officer_id int primary key,
officer_name varchar(30) unique,
officer_salary numeric check(officer_salary>5000),
officer_graduation_degree varchar(25) NOT NULL
);

insert into officer values(1,'John',10000,'Bachleor');
insert into officer values(2,'Mary',20000,'Master');
insert into officer values(3,'Geert',20000,'Bachleor');
insert into officer values(4,'Elif',10000,'Master');

insert into officer values(1,'Ali',10000,'Bachleor');--primary key sebebliyle error verir.
insert into officer values(5,'Mary',20000,'Master');--unique sebebiyle error verir.
insert into officer values(3,'Geert',4000,'Bachleor');--check sebebiyle error verir.
insert into officer values(4,'Elif',10000,null);--not null sebebiyle error verir.

drop table officer;

select * from officer;

create table peopleS(
name varchar(20),
surname varchar(30),
	CONSTRAINT pr_ks PRIMARY KEY(NAME),
	CONSTRAINT uni_ks UNIQUE(SURNAME)
);

SELECT * FROM PEOPLES;

INSERT INTO peoples VALUES('Harun','Tan');
INSERT INTO peoples VALUES('Azra','Can');

INSERT INTO peoples VALUES('Harun','Kaan');--PRIMAR KEY SEBEBIYLE ERROR VERIR.
INSERT INTO peoples VALUES(null,'Er');     --PRIMAR KEY SEBEBIYLE ERROR VERIR.
INSERT INTO peoples VALUES('Kudret','Can');--UNIQUE SEBEBIYLE ERROR VERIR.

CREATE TABLE ANIMALS(
Animal_name varchar(20),
animal_type varchar(25),
CONSTRAINT COMP_PR PRIMARY KEY(Animal_name,animal_type)--IKI SUTUNUN BIRLESIMINDEN BIR PRIMAR KEY (COMPOSITE KEY) ELDE ETTIK.
);

INSERT INTO ANIMALS VALUES('FINDIK','SUS KOPEGI');
INSERT INTO ANIMALS VALUES('FINDIK','COBAN KOPEGI');
INSERT INTO ANIMALS VALUES('DUMAN','SUS KOPEGI');
INSERT INTO ANIMALS VALUES('FINDIK',NULL);        --PRIMAR KEY SEBEBIYLE ERROR VERIR.IT MUST NOT CONTAINS 'NULL' VALUE.
INSERT INTO ANIMALS VALUES(NULL,'SUS KOPEGI');    --PRIMAR KEY SEBEBIYLE ERROR VERIR.IT MUST NOT CONTAINS 'NULL' VALUE.
INSERT INTO ANIMALS VALUES('FINDIK','SUS KOPEGI');--PRIMAR KEY SEBEBIYLE ERROR VERIR.

/*
constrait'leri sutun isimlerinin altinda yazmamin bize sagladigi avantajlar:
1)constrait ismlerini kendimiz belirliyebiliyoruz.
2)iki sutunun birlesiminden bir primary key olusturabiliyoruz.(COMPOSITE kEY)
*/







