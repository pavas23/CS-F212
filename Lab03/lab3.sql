
// for opening up sqlplus cli
sqlplus

// for connecting
username: sys as sysdba
password: manager

// for starting the oracle instance
startup

// connecting to user created in last lab
connect pavas/pavas123
show user
USER is "PAVAS"


//To creating tables with Foreign key

// creating faculty table before course table as it points to faculty table


// creating table with foreign key
CREATE TABLE Faculty(
	fid number primary key,
	fname varchar(10),
	fsal number
);

desc faculty
	Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 FID					   NOT NULL NUMBER
 FNAME						    VARCHAR2(10)
 FSAL						    NUMBER

// table with cid as primary key and fac as foreign key pointing to fid in faculty table
CREATE TABLE Course(
	cid number primary key,
	fac number references Faculty(fid),
	cname varchar(10)
);

desc course
	Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 CID					   NOT NULL NUMBER
 FAC						    NUMBER
 CNAME						    VARCHAR2(10)
drop table course;

CREATE TABLE Course(
	cid number,
	fac number,
	cname varchar(10),
	primary key(cid),
	foreign key(fac) references Faculty(fid)
);

// inserting values in faculty table
INSERT INTO Faculty VALUES(101,'Raj',60000);
INSERT INTO FACULTY VALUES(103,'Gopal',87000);

// inserting values in course table
INSERT INTO Course VALUES(10,107,'OS');

integrity constraint (PAVAS.SYS_C004074) violated - parent key not found

INSERT INTO COURSE VALUES(10,101,'OS');
INSERT INTO COURSE VALUES(20,null,'NW');

SELECT * FROM COURSE;

	       CID	  FAC CNAME
---------- ---------- ----------
	10	  101 OS
	20	      NW
	
//Creating tables that have Foreign keys after creating tables

//To create tables that have circular

create table staff(
	sid number primary key,
	ename varchar(10),
	sal number,
	dno number references Division(dnum)
);

//To create tables that have self-reference

create table course(
	cid number primary key,
	cname varchar(10),
	pr number
);

// for self referencing
alter table course add constraint self_ref foreign key(pr) references course(cid);


// q5
create table dept(
	dnum int primary key,
	dname varchar(20),
	dloc varchar(10)
);

	create table emp(
  2  eno int primary key,
  3  ename varchar(15),
  4  job varchar(10),
  5  mgr int,
  6  hiredate date,
  7  sal int,
  8  comm int,
  9  deptno int
 10  );
 
 desc emp
 
 Name					   Null?    Type
 ----------------------------------------- -------- ----------------------------
 ENO					   NOT NULL NUMBER(38)
 ENAME						    VARCHAR2(15)
 JOB						    VARCHAR2(10)
 MGR						    NUMBER(38)
 HIREDATE					    DATE
 SAL						    NUMBER(38)
 COMM						    NUMBER(38)
 DEPTNO 					    NUMBER(38)
// use different constraint name
alter table emp add constraint self_ref_emp foreign key(mgr) references emp(eno);

alter table emp add constraint fk_con foreign key(deptno) references dept(dnum);
	
