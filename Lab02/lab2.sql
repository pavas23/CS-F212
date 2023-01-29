-- to show user
show user

-- to show connection name
-- Does not work in 11g version works from version 12 onwards
show con_name;

-- Root DB is the one to which sqlplus client is connected by default which is inside CDB

-- for connecting to one of PDB
connect sys/oracle@hostname:port/XEPDB1 as sysdba;
-- abc is name of user and abc123 is password for that user
create user abc identified by abc123;

show con_name;
-- Now connection is switched to PDB

-- to create new user
create user abc identified by abc123 default tablespace users temporary tablespace temp;

-- giving access to new user
grant connect to abc;
grant create table to abc;

show user;

-- switching user from sys to abc
alter user abc quota unlimited on users;
connect abc/abc123;
show user;

-- creating table
CREATE TABLE student(
    rollno INT,
    name VARCHAR(20),
    DOB DATE,
    gender CHAR(1),
    class INT,
    college VARCHAR(20),
    city VARCHAR(20),
    marks INT,
    primary key(rollno)
);

-- inserting records into student table
INSERT INTO student VALUES(101,'Kiran','10-MAR-1998','M',10,'SBTM','Delhi',67);
INSERT INTO student VALUES(103,'Malini','22-DEC-1997','F',9,'Gandhi Memorial','Mumbai',73);
INSERT INTO student VALUES(104,'Ahmad','18-APR-1998','M',10,'Princeton','Nagpur',50);
INSERT INTO student VALUES(108,'James','30-APR-1998','M',12,'SBTM','Delhi','77');
INSERT INTO student VALUES(109,'Shivani','11-AUG-1999','F',11,'Stanley','Chennai',46);
INSERT INTO student VALUES(112,'Akul','23-MAR-1993','M',12,'Stanley','Chennai',67);

-- to see structure of table
desc student;

-- to display all cols
SELECT * FROM student;

SELECT rollno, name , class FROM student;

SELECT rollno, name, class FROM student WHERE city = 'Delhi';

SELECT * FROM student WHERE DOB > '01-MAR-1998';

DELETE FROM student WHERE name = 'Shivani';

UPDATE student SET marks = 75 WHERE class = 10;

-- display rollno and class for all students with labels SID and Standard
SELECT rollno SID, class Standard FROM student;
-- only for display column name will change but won't reflect in DB

-- finding the average marks
SELECT AVG(MARKS) FROM student;

SELECT MIN(MARKS) FROM student;
SELECT MAX(MARKS) FROM student;
SELECT COUNT(MARKS) FROM student;
SELECT SUM(MARKS) FROM student;

SELECT rollno, name FROM student WHERE marks >= 70 AND marks <=75;

-- to display marks+10 in each row and column name will become MARKS+10
SELECT name, marks+10 FROM student;
-- no change of marks in DB

CREATE TABLE Book(
    bid INT,
    title VARCHAR(10),
    primary key(bid)
);

-- inserting values into book table
INSERT INTO Book VALUES(101,'DSA');
INSERT INTO Book VALUES(102,'DBMS');

-- adding a new column named price
ALTER TABLE Book ADD Price INT;
-- col name is Price and datatype is INT

-- for dropping a column
ALTER TABLE Book DROP COLUMN Price;

-- saving the changes
commit;




