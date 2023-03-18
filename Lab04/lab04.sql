insert into dept values(50, 'MARKETING','BOSTON');
insert into dept values(60,'PRODUCTION','SANFRANISC');

insert into emp values(7947,'MIKE','CLERK',7900,'18-MAY-85',1500,200,50);
insert into emp values(7954,'BILL','MANAGER',7782,'20-FEB-81',1000,0,NULL);

select eno,ename,dname from emp,dept where deptno = dnum and ename like 'J____';

select eno,ename,dname from emp,dept where dnum=deptno and ename like '%IN%';

select eno,ename,dname from emp,dept where deptno=dnum and ename like '____';

select eno,ename,deptno,sal from emp order by deptno asc,ename desc;

select eno,ename,dname from (emp left outer join dept on deptno=dnum) where deptno is null;

select eno,ename,dname from ((select eno,ename,dname from (emp left outer join dept on deptno = dnum)) minus (select eno,ename,dname from emp,dept where deptno = dnum));

select eno,ename,dname from emp,dept where deptno = dnum and dloc = 'BOSTON';

select eno,ename,dname from emp,dept where dnum = deptno and deptno in (select dnum from dept where dloc = 'BOSTON');

select eno,ename,dname from emp,dept where deptno = dnum and exists (select dnum from dept where dnum = deptno and dloc = 'BOSTON');

select eno,ename,dname,sal from emp,dept where sal > (select avg(sal) from emp) and deptno = dnum;

select dnum,dname from dept where dnum not in (select deptno from emp where deptno is not null);

select e.eno empID,e.ename empName,m.eno managerId,m.ename managerName from emp e,emp m where e.mgr = m.eno;

select e.eno,e.ename from emp e, emp m where e.mgr = m.eno and m.eno
in (select eno from emp,dept where deptno = dnum and dname = 'SALES');

select e.eno,e.ename from emp e, emp m , dept where e.mgr = m.eno and m.deptno = dnum and dname = 'SALES';

select e.eno,e.ename,m.eno from emp e,emp m where e.mgr = m.eno and m.ename = 'BLAKE';

select e.eno,e.ename from emp e where e.eno in (select eno from emp,dept where deptno = dnum and dname = 'SALES');

select e.eno,e.ename from emp e where exists (select eno from emp e1,dept where e1.deptno = dnum and e.deptno = dnum and dname = 'SALES');
