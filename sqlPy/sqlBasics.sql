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
select * from employees where Salary between 35000 and 40000;


-- shopping website pe diff type of filters we put
-- in operator is used for filter while gettng the data from dataset
select * from employees where Team in ("Marketing", "Client Services");
select * from employees where Team not in ("Marketing", "Client Services");
select * from employees where Team in ("Marketing", "Client Services") and Gender in ("Male");


-- string functions 1. concat()
select concat(state," - ", city) as Location from customers;
select concat_ws(" - ", name, state, city) as Emp_details from customers;
-- 2. length()
select length(Salary) as digitCount from employees;
-- 3. Upper() , Lower()
select Upper(`First Name`) as Names from employees;
select Lower(`First Name`) as Names from employees;
-- 4. left() , right(), mid() finding last 4 char of phonenumber or making username
select left(name, 4) as username from customers;
select right(name, 4) as username from customers;
select mid(name, 2, 5) as username from customers; -- 2 se 5 character in length i want


-- data aggregation (numeric functions)
-- order count in a hotel, total no. of customers, max min avg payments
select sum(Salary) as amountSpentPerMonth from employees;
select count(`First Name`) as totalEmployees from employees;
select avg(Salary) as avgSalary from employees;
select max(Salary) as highestSalary from employees;
select min(Salary) as lowestSalary from employees;
select truncate(`Bonus %`, 1) as aDecimalSalary from employees; -- make to one decimal places
select ceil(`Bonus %`) as roundedOffBonus from employees; -- rounded to higher values
select floor(`Bonus %`) as roundedOffBonus from employees; -- rounded to lower values


-- date functions 
select * from employees;
select date(`Start Date`) as joiningDates from employees;
select time(`Start Date`) as joiningDates from employees;
select datediff(`End Date`, `Start Date`) as empWorkingYear from employees;
select dayname(`Start Date`) as dayOfJoining from employees;
select month(`Start Date`) as monthOfJoining from employees;
