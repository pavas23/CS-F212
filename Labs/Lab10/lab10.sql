create table book(
    bid int primary key,
    title varchar(10),
    price int
);

insert into book values(101,'operations',300);
insert into book values(107,'databases',370);
insert into book values(128,'networks',175);

set serveroutput on

create or replace procedure proc1 as
id number;
pr number;
cursor book_cursor is select bid,price from book;
begin
open book_cursor;
loop
fetch book_cursor into id,pr;
exit when book_cursor%notfound;
dbms_output.put_line('For the book with id: ' || id || ' the price is ' || pr);
end loop;
close book_cursor;
end;
/

exec proc1;

-- used for generating keys for large databases
create sequence bookid_seq start with 500;

insert into book values(bookid_seq.nextval,'Biology',650);
insert into book values(bookid_seq.nextval,'History',800);

create or replace trigger T1 after insert on book
begin
dbms_output.put_line('inserted a new record into the book table');
end;
/

create or replace trigger t1 after insert on book
declare
totalBooks number;
begin
select count(*) into totalBooks from book;
dbms_output.put_line('After new entry total number of books are: ' || totalBooks);
end;
/

create or replace trigger t1 before insert on book
declare
totalBooks number;
begin
select count(*) into totalBooks from book;
dbms_output.put_line('before new entry total number of books are: ' || totalBooks);
end;
/

-- update done will be printed only once, doesn't depend on how many rows are updated, these are called
-- table level triggers
create or replace trigger t1 before update of price on book
begin
dbms_output.put_line('update done');
end;
/

update book set price = 1000 where price > 300;

-- row-level triggers
create or replace trigger t1 before update of price on book
for each row
begin
dbms_output.put_line('update done');
end;
/

update book set price = 300 where price > 300;

create or replace trigger t1 before update of price on book
for each row
begin
dbms_output.put_line('old price: '||:old.price || ' new price is ' || :new.price);
end;
/

update book set price = 500 where price < 300;

create or replace trigger t1 before insert on book
for each row
begin
dbms_output.put_line('New book id is: '||:new.bid||' and name is: '||:new.title||' worth: '||:new.price);
end;
/

create or replace trigger t1 before update of price on book
for each row
begin
if :new.price <= :old.price then
dbms_output.put_line('Alert !!');
end if;
end;
/

update book set price = 300 where price > 300;

create or replace trigger t1 before update of price on book
for each row
begin
if :new.price <= :old.price then
dbms_output.put_line('Alert !!');
:new.price := :old.price;
end if;
end;
/

-- takes ascii value as input and prints the corresponding character
select chr(97) from dual;

-- gives user name
select user from dual;

-- concatenates two strings
select concat('H','I') from dual;
select concat('Hi','!!') from dual;

-- gives starting index of substring, 1 based indexing
-- if substring not present then it gives 0
select instr('hello','o') from dual;

select length('hello World') from dual;

-- left pad in this case will give 4 characters from the string s, as s has only 1 char so it will pad 3 d on left side
select lpad('s',4,'d') from dual;

-- no padding in this case as >= 4 chars are present in the string
select lpad('hello',4,'d') from dual;
-- hell

select rpad('h',4,'d') from dual;
-- hddd

-- trims all the left spaces
select ltrim('     hello') from dual;
-- length is 5
-- without ltrim length is 10

select length(ltrim('     hello   ')) from dual;
-- 8

select length(rtrim('     hello   ')) from dual;

-- replaces the search string with the given string in the original string
select replace('BITSPILANI','BITS','BITSPILANIABCD') from dual;
-- BITSPILANIABCDPILANI
-- if search string not found then no changes

-- changes all occurences of search string
select replace('BITSPILANIBITS','BITS','BITSPILANIABCD') from dual;
-- BITSPILANIABCDPILANIBITSPILANIABCD

select substr('BITSPILANI',1,5) from dual;
-- BITSP

-- capitalizes the first character
select initcap('bits pilani') from dual;
-- Bits Pilani

select lower('BITS PILANI') from dual;

select upper('bits pilani') from dual;

-- replaces w with i, o -> n, r -> d and so on every occurence
select translate('hello world good world','world','india') from dual;
-- heiin india gnna india

select translate('hello world good world','oo','xy') from dual;
-- hellx wxrld gxxd wxrld

select translate('hello world good world','ol','x') from dual;
-- hex wxrd gxxd wxrd

select abs(-23.90) from dual;

select ceil(3.4) from dual;

-- input in radians
select cos(1.57) from dual;

select (2) from dual;

select exp(0) from dual;

select floor(9.7) from dual;

select mod(12,2) from dual;

select power(2,5) from dual;

select round(2.5) from dual;

select round(2.5123132131,5) from dual;
-- number of decimal places

select sign(123) from dual;
-- 1

select sign(-123) from dual;
-- -1

select sqrt(64) from dual;

select sysdate from dual;
-- gives the current date

select trunc(123.462342,1) from dual;
-- 123.4

select add_months('26-APR-23',4) from dual;
-- 26-AUG-23

select next_day('26-APR-23','WED') from dual;
-- 03-MAY-23

select greatest(2,4,-5,5.6,78) from dual;

select least(2,4,-5,5.6,78) from dual;

