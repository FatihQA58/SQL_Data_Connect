CREATE TABLE Film(
film_no int,
film_name varchar(30),
film_type varchar(30)
);

INSERT INTO Film values(111,'Eyvah Eyvah','Komedi');
INSERT INTO Film values(112,'Eltilerin Savasi','Komedi');
INSERT INTO Film values(113,'Kurtlar Vadisi','Aksiyon');
INSERT INTO Film values(114,'Aile Arasinda','Komedi');
INSERT INTO Film values(115,'G.O.R.A','Bilim Kurgu');
INSERT INTO Film values(116,'Organize Isler','Komedi');
INSERT INTO Film values(117,'Babam ve Oglum','Dram');

SELECT * FROM Film;

UPDATE Film SET film_name='Recep Ivedik' WHERE film_no=112;

UPDATE Film SET film_type='Aksiyon';

UPDATE Film SET film_name='Cakallarla Dans', film_type='Komedi'WHERE film_no=111;

UPDATE Film SET film_type='Dram'WHERE FILM_NAME='Babam ve Oglum';

UPDATE Film SET film_name='A.R.O.G' WHERE film_name='G.O.R.A';

UPDATE Film SET film_no=film_no+1 WHERE film_no>115;

drop table Film;

CREATE TABLE CARS(
ID INT,
MARKA VARCHAR(20),
MODEL VARCHAR(20),
VITES VARCHAR(20),
PRICE NUMERIC
);

INSERT INTO CARS VALUES(1,'MERCEDES','C100','AUTOMATIC',90000);
INSERT INTO CARS VALUES(2,'TOYOTA','CORALLA','AUTOMATIC',100000);
INSERT INTO CARS VALUES(3,'HONDA','CIVIC','MANUAL',70000);
INSERT INTO CARS VALUES(1,'CITROEN','C3','AUTOMATIC',80000);

UPDATE CARS SET ID=4 WHERE MARKA='CITROEN';

SELECT * FROM CARS;

DROP TABLE CARS;

ALTER TABLE CARS DROP COLUMN KM;

ALTER TABLE CARS ADD COLUMN KM VARCHAR(10);

ALTER TABLE CARS ADD COLUMN AGE INT;

UPDATE CARS SET AGE=12 WHERE ID=1;

ALTER TABLE CARS DROP COLUMN VITES;

ALTER TABLE CARS RENAME COLUMN PRICE TO AMOUNT;

ALTER TABLE CARS RENAME TO GARAGE;








