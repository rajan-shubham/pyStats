select * from demo1.emp_data where not Gender = "Female";


-- like operator (use thing with help of pattern)
-- finding name whose like "kumar", "martin" in it
select * from demo1.emp_data where FullName like "%mar%"
select * from demo1.emp_data where Email like "%@gmail.com"


-- order by (data ordering, ascending, descinding
select * from demo1.emp_data order by Department asc
select * from demo1.emp_data order by Department asc, Age desc;


-- set operator (union, union all, intersect, except)
-- we have two tables and sayad dono ke ander same data ho sakta hai, to unke uper ham set operation lagate hai
select * from employeedb.employee1; -- previous year data
select * from employeedb.employee2; -- current year data

-- gives unique values from both the table (if any similar data it will come ones)
select FirstName, Department from employee2
union
select FirstName, Department from employee1;

-- gives all the values from both the table (if any similar data it will come twice)
select FirstName, Department from employee2
union all
select FirstName, Department from employee1;

-- intersect operation (common data between both the table)
select FirstName, Department from employee2
intersect
select FirstName, Department from employee1;

select FirstName, Department from employee2
where FirstName in (select FirstName from employee1);

-- except (pahli table ka data jo ki dusri table ke ander nahi hai) -> table1 data - table2 data
select FirstName, Department from employee2
except
select FirstName, Department from employee1;

select FirstName, Department from employee2
where FirstName not in (select FirstName from employee1);
