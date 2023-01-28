-- for starting the database on ubuntu

-- For Lab Systems
-- username : sys as sysdba
-- password : manager

-- for starting the oracle instance (i.e connecting the sqlplus client to database)

-- startup

-- sql is NOT case sensitive

-- for creating table
CREATE TABLE stud(
    -- 10 specifies the length of sno
    sno NUMBER(10),
    name VARCHAR2(10),
    age INT(3)
);

-- for description of the table (showing schema)
desc stud;

-- for inserting rows into table
INSERT INTO stud VALUES(101,'Raju',20);
INSERT INTO stud VALUES(103,'John',19);
INSERT INTO stud VALUES(104,'Mohan',21);
INSERT INTO stud VALUES(107,'Mary',20);

-- for displaying all the columns of table
SELECT * FROM STUD;

-- for displaying sno and name from table
SELECT sno, name FROM STUD;

-- for displaying sno and name where age is 20
SELECT sno, name FROM STUD WHERE age = 20;

-- updating records
UPDATE STUD
    SET name = 'Ram'
    WHERE sno = 101;

-- deleting row
DELETE FROM STUD WHERE sno = 107;

-- for saving the table in database
commit;
