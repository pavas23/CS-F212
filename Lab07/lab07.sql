select p.pid,p.pname from part p where p.pid not in (select pid from supply) and p.price > (select avg(price) from part);

select pid,pname from (select p.pid,p.pname from supply s, part p where s.pid = p.pid) minus 
(select p.pid,p.pname from supply s,part p,vendor v where s.vid = v.vid and s.pid = p.pid and v.vloc = 'Chennai');

select p.pid,p.pname from part p where not exists (select * from supply s,vendor v where s.vid = v.vid and p.pid = s.pid and v.vloc = 'Chennai');

select vid,vname from vendor where vid not in (select s.vid from supply s,part p where s.pid = p.pid and p.price > 100);

select vid,vname from vendor where vid not in (select s.vid from supply s,part p where s.pid = p.pid and p.pname like 'S%');

select v.vid,v.vname,count(*) from supply s,vendor v where s.vid = v.vid and s.qty >= 200 group by v.vid,v.vname;

create view PVS as select p.pid,p.pname,v.vid,v.vname,s.qty from part p,supply s,vendor v where s.vid = v.vid and s.pid = p.pid;

select vid,vname,sum(qty) from pvs where vid in (select vid from vendor where vloc = 'Delhi') group by vid,vname;

