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
    
)



