create database myDb;
use myDb;
create table student(
sid int primary key,
sname varchar(20) not null,
mobile char(12) unique,
city varchar(20));


create table faculty(
fid int primary key auto_increment,
fname varchar(20),
city varchar(20));


create table course(
cid int primary key,
cname varchar(30),
start_date date,
duration int default 50,
fac_id int,
constraint f_fid foreign key (fac_id) references faculty(fid)
on delete set null
on update cascade);


create table marks(
sid int,
cid int,
marks int,
primary key(sid, cid),
constraint c_sid foreign key (sid) references student(sid)
on delete cascade
on update cascade,
constraint c_cid foreign key (cid) references course(cid)
on delete cascade
on update cascade);


-- how many students in course with cid 20
select cid, count(*)
from marks
-- where cid=20;
where cid in (20, 30)
group by cid
having count(*) > 4;

-- find avg marks for each sutdent
select sid, avg(marks)
from marks
group by sid;

-- display course and the faculty of that course who stays in pune
select cid, cname, fid, fname
from course c join faculty f
on c.fid=f.fac_id
where f.city='Pune';

-- display sid,sname,cid,cname,fid,fname
select sid,sname, cid, cname, fid, fname
from student s join faculty f
on;

-- display sid,sname,cid,cname,marks
select s.sid,sname,c.cid,cname,marks
from student s join marks m on s.sid=m.sid join course c on m.cid=c.cid;