--CONSTRAINT 

--1)Primary Key: It is for making records unique.
--             It does not accept "null" as value
--             It does not accept "repeated data", all data in primary key field must be unique
--             A table can have just a single "primary key" field.
           --  Field Name - Data Type - Constraint
		   --  patient_id   VARCHAR     PRIMARY KEY
		   
--2)Foreign Key: It is for creating relationships between tables.
--             It accepts "null" as value
--             It accepts repeated data
--             A table can have multiple "foreign key" fields. 

--3)Unique Key: It is for making data in a field "unique"
--            When you insert the data in a "Unique Key Field", Postgre will check if it is mathcing with this constraint or not.
--            If there is repeated data Postgre will give error.
--            When we update a data in a "Unique Key" field, Postgre will check if it is matching with the existing ones
--            "Unique Key" field can have multiple "null" values

--            email_address  VARCHAR  UNIQUE

--4)Check: It checks conditions we put for the data inserted.

--         age_of_student  NUMERIC/INTEGER Check(age_of_student>0)

--5)NOT NULL: It tells to Postgre, do not accept "null" values in the field.
--            To make a field "Required Field" we use "Not Null" constraint

--DATA TYPES IN POSTGRESQL
--1)BOOLEAN: It has 3 values  i)true  ii) false  iii)null
--           BOOLEAN can be used as "BOOL" as well

--           is_retired  BOOLEAN or is_retired BOOL

--2)CHAR: It is for using "fixed" lengths
--        CHAR(n) does not accept more than "n" characters
--        CHAR (n) accepts "n" less than "n" characters
--        CHAR --> CHAR(1)

--        social_security_number  CHAR (9)

--3)VARCHAR: It is for Strings
--           VARCHAR and TEXT are completely same
--           address VARCHAR or address TEXT-->same for postgre

--4)NUMERIC: This is for storing numeric values(whole or decimal)


-- price(5, 2) --> 487.83
--               5--> is called precision and it displays the total number of digits in the field
--               2--> is called "scale" and it displays the total number of digits in decimal part
--price(5, 2) -->If you use more than 5 digits in total, Postgre gives error
--price(5, 2) -->If you use more than 2 digits in total for scale part, Postgre gives error
--price(5, 2) --> Using less than 5 in total or less than 2 in decimal part is allowed

-- price(5, 0) -->Whole Number like 98564
-- price NUMERIC -->There is no limit for "precision" and "scale" 

--5)DATE: It is for storing date values
--       Default date format "yyyy-mm-dd"
--       When you insert a date value, if you donot use "yyyy-mm-dd", postgre gives error

--       date_of_birth   DATE
--If you want to insert current date automatically you can use 
--       registration_date DATE CURRENT_DATE

--6)TIME: It is for storing time values
--       hh:mm:ss format is the default format for the time data type

--       appoinment_time TIME 

--7)JSON:If you need to store data in key-value sructure you can use JSON data type

--        fruit_prices  JSON
--        apple:12, orange: 21, apricot:13

--How to create a table
CREATE TABLE student(
student_id CHAR(5) PRIMARY KEY,
	student_name VARCHAR,
	email_address VARCHAR NOT NULL,
	student_age NUMERIC(2) CHECK(student_age>0),
	phone_number CHAR(10) UNIQUE
)
--How to see a table
SELECT * FROM STUDENT;

--How to insert data into a table
INSERT INTO student VALUES('1111','Tom Hanks','th@gmail.com',15,'1234567890');
INSERT INTO student VALUES('1112','Brad Pitt','bp@gmail.com',14,'9876543210');
INSERT INTO student VALUES('1113','Jim Carry','cd@gmail.com',16,'2345678901');

--How to insert data into specific fields
INSERT INTO student(student_id,email_address,phone_number) VALUES('1114','abc@gmail.com','5678904321');
INSERT INTO student(email_address,phone_number,student_id) VALUES('abc@gmail.com','5678904323','1115');

--How to update existing data in a table 
--Example 1: Update student_id as '1116' where it is '1111'
UPDATE student 
SET student_id='1116'
WHERE student_id='1111';

--Example 2: Change Tom Hanks to Anthony Quinn
UPDATE student
SET student_name='Anthony Quinn'
WHERE student_name='Tom Hanks';

--Example 3:Change bp@gmail.com to null
UPDATE student
SET email_address='abcd@gmail.com'
WHERE email_address='bp@gmail.com';

--Example 4:Update all student ages to maximum age
UPDATE student
SET student_age=(SELECT MAX (student_age) FROM student);

--How to delete a table
DROP TABLE student;

--Example 5: Create parents table with the parent_id, parent_name, student_id, parent_address, parent_dob fields
CREATE TABLE parents(
	parent_id CHAR(5) PRIMARY KEY ,
parent_name VARCHAR NOT NULL,
student_id CHAR(5),
parent_address TEXT,
parent_dob DATE
);

--Example 6: Insert 4 records into parents table

INSERT INTO parents VALUES('21111', 'Mark Hanks', '11111', 'Miami, FL', '1994-10-23');
INSERT INTO parents VALUES('21112', 'Angie Pitt', '11112', 'New York, USA', '1987-2-13');
INSERT INTO parents values('21113', 'John Walker', '11113', 'Berlin, Germany', '1975-12-05');
INSERT INTO parents VALUES('21114', 'Mary Star', '11114', 'Istanbul, Turkey', '1975-10-3');

--Example 7:Change all date of births to the minimum date of birth 
UPDATE parents
SET parent_dob=(SELECT MIN (parent_dob) FROM parents);

SELECT * FROM parents;


















