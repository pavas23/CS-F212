create table book(
    bid int primary key,
    title varchar(10),
    price int
);

insert into book values(101,'operations',300);
insert into book values(107,'databases',370);
insert into book values(128,'networks',175);

set serveroutput on

-- in arguments are treated as constants, we can't reassign new value to in parameters
create or replace procedure proc1(arg1 in number) as n number;
begin
dbms_output.put_line(' argument value :' || arg1);
n := arg1+10;
dbms_output.put_line(' argument value after modification is :' || n);
end;
/

create or replace procedure proc1(arg1 in number,arg2 out number) as n number;
begin
n := arg1 + 10;
arg2 := 60;
end;
/

-- as arg2 is out parameter so p also points to same value, out parameter reflects changes
declare
m number;
p number;
begin
m := 20;
p := 5;
dbms_output.put_line(' :'||m||' :'||p);
proc1(m,p);
dbms_output.put_line(' :'||m||' :'||p);
end;
/

create or replace procedure proc1(arg1 in out number) as
begin
dbms_output.put_line(' argument value :' || arg1);
arg1 := arg1 + 10;
dbms_output.put_line(' argument value after modification is :' || arg1);
end;
/
declare
m number;
begin
m := 20;
proc1(m);
end;
/

create or replace procedure proc1(id in number,name in varchar,pr in number) as 
begin
insert into book values(id,name,pr);
dbms_output.put_line('Book :'|| id || ' name: ' || name || ' price: '|| pr);
end;
/

begin
proc1(1000,'dsa',109);
end;
/

-- <> for not equal
-- if cond then
-- -----
-- else if cond then
-- -----
-- else
-- -----
-- end if;
-- dual is a dummy table to write select keyword
create or replace procedure proc1(id in number,name in varchar,price in number) as n number := 0;
begin
insert into book values(id,name,price);
select count(*) into n from book;
select MOD(n,2) into n from dual;
if n <> 0 then
dbms_output.put_line('Odd number of tuples in book table');
else
dbms_output.put_line('Even number of tuples in book table');
end if;
end;
/

create or replace procedure proc1(id in number) as p number := 0; t varchar(100);
begin
select price,title into p,t from book where bid = id;
if p <= 300 then
dbms_output.put_line('The book ' || id || ' with the title ' || t || ' is Cheap');
else
dbms_output.put_line('The book ' || id || ' with the title ' || t || ' is Costly');
end if;
end;
/

exec proc1(107);

create or replace procedure proc1(id in number,name in varchar,sal in number,dep in number) as n number := 0;
begin
insert into emp values(id,name,sal,dep);
select count(*) into n from emp where dno = dep;
update dept set total_emps = n where dnum = dep;
dbms_output.put_line(' insert and update done for emp with id: '|| id || ' ');
end;
/

-- loop in PL/SQL
create or replace procedure proc1 as n number := 10;
begin
loop
dbms_output.put_line(' Value of n is '|| n || ' ');
n := n + 10;
exit when n > 100;
end loop;
end;
/

exec proc1;

-- procedures are meant for manipulating data, they can't return values
-- functions in PL/SQL are same as procedures and they can additionally return value too

create function func1(arg1 in number) return number is
var number;
begin
select price into var from book where bid = arg1;
return var;
end;
/

declare
n number;
begin
n := func1(101);
dbms_output.put_line(' ' || 'price is ' || n);
end;
/

create or replace function func2(a in number,b in number) return number is
n number;
begin
n := a + b;
return n;
end;
/

declare
a number;
b number;
ans number;
begin
a := 10;
b := 20;
ans := func2(a,b);
dbms_output.put_line(' sum is : '|| ans);
end;
/















