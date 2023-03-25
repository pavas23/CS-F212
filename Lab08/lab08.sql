create table book(
bid int primary key,
title varchar(10),
price int
);

-- for using procedures in PL/SQL
set serveroutput on;

insert into book values(101,'operations',300);
insert into book values(102,'databases',370);
insert into book values(128,'networks',175);

create or replace procedure proc1(arg1 in number, arg2 out number) as
n number;
begin
dbms_output.put_line(':'||arg1||' :'||arg2);
n:=arg1+10;
arg2:=60;
dbms_output.put_line(' :'||n ||' :'||arg2);
end;
/

declare
m number;
p number;
begin
m:=20;
p:=5;
dbms_output.put_line(' :'||m||' :'||p);
proc1(m,p);
dbms_output.put_line(' :'||m||' :'||p);
end;
/

create or replace procedure proc1 as
begin
update book set price = 250 where price = 300;
dbms_output.put_line(' Update done : ');
end;
/

begin
proc1;
dbms_output.put_line(' Proc1 executed');
end;
/

exec proc1;

create or replace procedure proc6(id in number,name in varchar,pr in number) as
begin
insert into book values(id,name,pr);
dbms_output.put_line('Book:'||id||':name:'||name||' : added to table');
end;
/

exec proc6(1444,'Economics',570);

create or replace procedure proc7(id in number,name in varchar,pr in number) as n number:=0;
begin
insert into book values(id,name,pr);
select count(*) into n from book;
-- as a select statement requires a from clause so we use dummy table dual which is present in data dictionary
select MOD(n,2) into n from dual;
if n <> 0 then
dbms_output.put_line(' ODD Number of tuples in Book table');
end if;
end;
/

create or replace procedure proc8(id in number) as
n number;
bname varchar(30);
begin
select price,title into n,bname from book where bid = id;
if n > 300 then
dbms_output.put_line('The book '||id||' with the title '||bname||' is costly');
else
dbms_output.put_line('The book '||id||' with the title '||bname||' is cheap');
end if;
end;
/

exec proc8(1000);

create or replace procedure proc9 as
n number:=10;
begin
loop
dbms_output.put_line(' Value of n is: '||n||'');
n:=n+10;
exit when n>100;
end loop;
end;
/

exec proc9;

create function func1(arg in number) return number is
var number;
begin
select price into var from book where bid = arg;
return var;
end;
/

declare
n number;
begin
n:=func1(1000);
dbms_output.put_line(' '||' price is :'||n);
end;
/

create or replace procedure proc10(id in number,name in varchar,sal in number,dno in number) as
n number:=0;
begin
insert into emp values(id,name,sal,dno);
select total_emps into n from dept where dnum = dno;
update dept set total_emps = n+1 where dnum = dno;
dbms_output.put_line(' Emp inserted into emp table and count updated');
end;
/
