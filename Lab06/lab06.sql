create table part(
    pid int primary key,
    pname varchar(10),
    price int
);

create table vendor(
    vid int primary key,
    vname varchar(10),
    vloc varchar(10)
);

create table supply(
    pid int,
    vid int,
    qty int,
    primary key(pid,vid),
    foreign key(pid) references part(pid),
    foreign key(vid) references vendor(vid)
);

INSERT INTO part VALUES(101,'Scale',30);
INSERT INTO part VALUES(104,'Sketch',10);
INSERT INTO part VALUES(105,'Tape',15);
INSERT INTO part VALUES(107,'Pad',160);
INSERT INTO part VALUES(110,'Ink',25);
INSERT INTO Part VALUES(112,'Pin',5);
INSERT INTO Part VALUES(124,'Chalk',120);
INSERT INTO Part VALUES(135,'Paper',80);

INSERT INTO vendor VALUES(3,'Crown','Delhi');
INSERT INTO vendor VALUES(5,'Topper','Delhi');
INSERT INTO vendor VALUES(7,'Avon','Mumbai');
INSERT INTO vendor VALUES(11,'Swan','Hyderabad');
INSERT INTO vendor VALUES(13,'Rally','Chennai');
INSERT INTO vendor VALUES(15,'Buddy','Chennai');

INSERT INTO supply VALUES(104,7,420);
INSERT INTO supply VALUES(104,13,380);
INSERT INTO supply VALUES(105,13,350);
INSERT INTO supply VALUES(107,5,500);
INSERT INTO supply VALUES(107,11,200);
INSERT INTO supply VALUES(107,7,10);
INSERT INTO supply VALUES(110,3,22);
INSERT INTO supply VALUES(110,5,35);
INSERT INTO supply VALUES(110,13,150);
INSERT INTO supply VALUES(110,15,20);
INSERT INTO supply VALUES(124,7,300);
INSERT INTO supply VALUES(124,11,34);
INSERT INTO supply VALUES(124,13,12);

select pid,pname from part where pid not in (select pid from supply);

select pid,pname from part where pid in (select pid from supply where vid in (select vid from vendor where vloc = 'Delhi'));

select v.vid,v.vname from vendor v, supply s where s.vid = v.vid and v.vloc = 'Delhi' group by v.vid,v.vname having count(*) >=3;

select v.vid,v.vname from vendor v,supply s,part p where s.pid = p.pid and s.vid = v.vid and v.vid
not in (select sup.vid from supply sup,part par where sup.pid = par.pid and par.price > 100);

select p.pid,p.pname,count(*) chennaiVendors from part p,supply s where s.pid = p.pid and s.vid in 
(select vid from vendor where vloc = 'Chennai') group by p.pid,p.pname;

select v.vid,v.vname from vendor v where v.vid not in
(select s.vid from part p,supply s where s.pid = p.pid and p.price <= 100);

select p.pid,p.pname,count(*) from part p,supply s where s.pid = p.pid group by p.pid,p.pname;

select vid,vname from vendor where vid in (select vid from supply group by vid having sum(qty) >= 43);

select vid,vname from vendor where vid in (select s.vid from supply s,part p where s.pid = p.pid and p.pname = 'Pad');

select vid,vname from vendor where vid in (select s.vid from supply s where s.qty >= 250);

select v.vid,v.vname,count(*) from supply s,vendor v where s.vid = v.vid and s.qty > 100 group by v.vid,v.vname;

