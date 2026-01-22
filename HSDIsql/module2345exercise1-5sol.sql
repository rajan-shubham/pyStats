show databases;
use pubs;

SELECT * FROM employee;

select emp_id as "Employee ID", fname "First Name", lname "Last Name" 
from employee;

# combine colums
select emp_id as "Employee ID" ,concat(fname,lname," ---> ",hire_date) as Details
from employee;

select emp_id, concat(rpad(concat(fname," ", lname, " "), 30, "-"), ">", " ", hire_date) as Details
from employee;

-- skip first 2 row (offset) and then 5 row
select emp_id as "Employee ID"
from employee
limit 2, 5;


-- sorting data by order by 
select * from authors;
-- display first 4 rows of authors table, sorted on city, and if city is same
-- arrange it on fname
select au_id, au_fname, city
from authors
where city="Berkeley"
order by city, au_fname
limit 4;

-- less no. of times is true use and, more no. of times false use OR
-- for range use between also it is inclusive
-- use in for differ, exact value
select * from employee
where job_id between 3 and 10;
-- where job_id in (5, 8, 10);

-- if the col data is null (empty), space is taken as not null
select * from employee
where minit is null;

select * from employee
where job_id not in (3, 10);

-- % for one or many char, _ for one char
select * from employee
where fname like '_n%'
order by fname desc;

select * from employee
where fname like 'A%' OR fname like '%n'
order by fname, lname desc;


select * from titles limit 10;

select title_id, title, price, price*0.9 as "Discounted Price" from titles;

select distinct job_id
from employee;

-- combination unique
select distinct job_id, job_lvl
from employee;


-- test and check of your querry
-- inserting rows
desc employee;
insert into employee values ('1001a', 'shubham', 'M', 'kumar', 6, 215, '9952', '19800101'); 

insert into employee(job_id,fname,lname) values('3001b','shubham','rajan');

update employee
set fname='Shubham',lname='Rajan'
where emp_id='1001a'; 

delete from employee where emp_id='1001a';

-- aggregate fun
-- condition on agg fun, or on group by data use have
select type,min(price),max(price),avg(price),count(*),count(price) from titles
group by type
having count(*) > 3;


select * from authors;
select * from titleauthor;
-- 
select *
from authors a inner join titleauthor ta
on a.au_id=ta.au_id;

-- module 2 ex:
select * from authors;
select au_lname, au_fname from authors;
select title, price from titles;
select pub_name from publishers;
select stor_name, city stores;

-- module 3 ex:
insert into stores values ('9000', 'Books Galore', '123 Main St.', 'Anytown', 'NY', '12345');
insert into employee values('XYZ123', 'John', 'D', 'Smith', 6, 215, '9952', '19800101');
insert into sales values('7066', 'XYZ789', '20230621', 10, 'Net 30', 'PS2091');
insert into discounts values('Bundle Discount', NULL, 100, 1000, 8.5);
insert into roysched values('BU1032', 5000, 10000, 15);

-- module 4 ex;
select count(au_id) as "Total Authors" from authors;
select avg(price) as "avg" from titles;
-- select * from authors order by city;
select city, count(au_id) as "No of Author" from authors group by city;
select type, count(title_id) as "No of Title" from titles group by type;
select state, count(au_id) as "No of Author" from authors group by state having count(au_id) > 1;

-- module 5 ex:
select au_lname, au_fname, a.au_id, ta.au_id, title_id, royaltyper 
from authors a left join titleauthor ta
on a.au_id=ta.au_id;

select title, price, pub_name
from titles inner join publishers;