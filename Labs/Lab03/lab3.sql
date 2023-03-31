
-- for opening up sqlplus cli
sqlplus

-- for connecting
username: sys as sysdba
password: manager

-- for starting the oracle instance
startup

-- connecting to user created in last lab
connect pavas/pavas123
show user
USER is "PAVAS"


-- To creating tables with Foreign key

create table dept(
    dnum int primary key,
    dname varchar(20),
    dloc varchar(10)
);

create table emp(
    eno int primary key,
    ename varchar(15),
    job varchar(15),
    mgr int,
    hiredate date,
    sal int,
    comm int,
    deptno int,
    foreign key(mgr) references emp(eno),
    foreign key(deptno) references dept(dnum)
);

INSERT INTO dept VALUES (10,'ACCOUNTING','NEW YORK');
INSERT INTO dept VALUES (20,'RESEARCH','DALLAS');
INSERT INTO dept VALUES (30,'SALES','CHICAGO');
INSERT INTO dept VALUES (40,'OPERATIONS','BOSTON');

INSERT INTO emp VALUES (7839,'KING','PRESIDENT',NULL,'17-NOV81',5000,NULL,10);
INSERT INTO emp VALUES (7566,'JONES','MANAGER',7839,'02-APR81',2975,NULL,20);
INSERT INTO emp VALUES (7788,'SCOTT','ANALYST',7566,'19-APR87',3000,NULL,20);
INSERT INTO emp VALUES (7902,'FORD','ANALYST',7566,'03-DEC81',3000,NULL,20);
INSERT INTO emp VALUES (7369,'SMITH','CLERK',7902,'17-DEC-80',800,NULL,20);
INSERT INTO emp VALUES (7698,'BLAKE','MANAGER',7839,'01-MAY81',2850,NULL,30);
INSERT INTO emp VALUES (7782,'CLARK','MANAGER',7839,'09-JUN81',2450,NULL,10);
INSERT INTO emp VALUES (7844,'TURNER','SALESMAN',7698,'08-SEP81',1500,0,30);
INSERT INTO emp VALUES (7876,'ADAMS','CLERK',7788,'23-MAY87',1100,NULL,20);
INSERT INTO emp VALUES (7900,'JAMES','CLERK',7698,'03-DEC-81',950,NULL,30);
INSERT INTO emp VALUES (7934,'MILLER','CLERK',7782,'23-JAN82',1300,NULL,10);
INSERT INTO emp VALUES (7499,'ALLEN','SALESMAN',7698,'20-FEB81',1600,300,30);
INSERT INTO emp VALUES (7521,'WARD','SALESMAN',7698,'22-FEB81',1250,500,30);
INSERT INTO emp VALUES (7654,'MARTIN','SALESMAN',7698,'28-SEP81',1250,1400,30);

select * from emp;

select eno, ename from emp;

select * from emp where job = 'CLERK';

select eno, ename ,sal from emp where job = 'MANAGER';

select eno, ename ,sal from emp where job = 'MANAGER' and deptno = 30;

select eno, ename, hiredate from emp where hiredate > '01-JUNE-1981';

select eno, ename, sal, deptno from emp order by deptno asc;

select eno, ename, sal, deptno from emp order by deptno desc;

select eno, ename, sal, deptno from emp order by deptno asc, sal desc;

select ename from emp where job = 'CLERK' and sal > 2000;

select * from emp where sal between 1000 and 1500;

select * from emp where deptno = 10 or deptno = 30;

select max(sal), min(sal), avg(sal) from emp where deptno = 10;

select count(*) num_of_emps from emp where deptno = 20;

select sum(sal) from emp where job = 'CLERK';