select * from demo1.emp_data where not Gender = "Female";


-- like operator (use thing with help of pattern)
-- finding name whose like "kumar", "martin" in it
select * from demo1.emp_data where FullName like "%mar%"
select * from demo1.emp_data where Email like "%@gmail.com"


-- order by (data ordering, ascending, descinding
select * from demo1.emp_data order by Department asc
select * from demo1.emp_data order by Department asc, Age desc;