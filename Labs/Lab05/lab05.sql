select max(sal), avg(sal), min(sal) from emp,dept where deptno = dnum group by deptno having deptno = 10;

select count(*) from emp, dept where deptno = dnum group by deptno having deptno = 10;

select count(*) from emp, dept where deptno = dnum group by deptno having deptno = 20;

select sum(sal) from emp where job = 'CLERK';

select job, count(*) , avg(sal) from emp group by job;

select eno,ename,dname from emp,dept where deptno = dnum and ename like '%ER' or ename like '%EN';

select * from (emp join dept on deptno = dnum);

select * from (emp left outer join dept on deptno = dnum);

select * from (emp right outer join dept on deptno = dnum);

select * from (emp full outer join dept on deptno = dnum);

select e.eno,e.ename,m.ename from emp e,emp m where e.mgr = m.eno and e.eno in 
(select eno from emp,dept where deptno = dnum and dname = 'SALES');

select deptno,dname,count(*) from emp,dept where deptno = dnum and sal > 1300 group by deptno,dname;

select eno,ename from emp where eno in (select mgr from emp);

select m.eno,m.ename,count(*) from emp e, emp m where e.mgr = m.eno and m.eno in (select mgr from emp) group by m.eno,m.ename; 

select eno,ename from emp where comm is null;

select eno,ename from ((select eno,ename from emp,dept where deptno = dnum) minus 
(select eno,ename from emp,dept where deptno = dnum and dname = 'SALES'));

select eno,ename from emp where deptno not in (select dnum from dept where dloc = 'BOSTON');

create view emp_dept as select eno,ename,job,dname,dloc from emp,dept where deptno = dnum;

select eno,ename,dloc from emp_dept;

select eno,ename from emp_dept where dloc = 'BOSTON';
