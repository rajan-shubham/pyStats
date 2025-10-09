use analEmployee;
select * from customers;
select id, name, segment from customers;
select id, name from customers where segment="Home Office";
select * from customers where segment="Home Office" and state="Texas";
select * from customers where segment="Home Office" or state="Texas";
select * from customers where segment="Home Office" and not state="Texas";
-- like operator (use thing with help of pattern)
-- finding name whose like "kumar", "martin" in it
select * from customers where segment like "Home%";


-- order by (data ordering, ascending, descinding
select * from customers order by name asc;
select * from customers order by state asc;
-- finding top 3 values by using limit
select * from customers order by name desc limit 5;
-- give 5 value after 3rd row value
select * from customers order by name desc limit 3, 5;


-- finding data between particular range, time period, this month data
-- finding salary whose range is between 1 to 1.5 lakh
select * from employees order by Salary desc;
select * from employees where Salary between 50000 and 100000;