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


-- case operator
select * from products;
select avg(`Stock Quantity`) as avgStockQuantity from products;
select `Product Name`, `Stock Quantity`,
case
	when `Stock Quantity` < 50 then "Urgent need of more stock"
    else "no requirement as of now"
end as production_details
from products;

select * from products order by `Product Ratings` asc;
select avg(`Price`) as avgRating from products; -- 254.67
select max(`Price`) as avgRating from products; -- 499.97
select min(`Price`) as avgRating from products; -- 10.22
select `Product Name`, Price,
case
	when Price <= 200 then "cheap product"
    when Price > 200 and Price <= 300 then "average product"
    else "expensive product"
end as productMarket
from products;


-- Group By -> when you want to see your data in ceratain groups
select * from employees;
select Team, count(`First Name`) as noOfEmployees from employees group by Team;
select Gender, count(`First Name`) as noOfEmployees from employees group by Gender order by count(`First Name`) asc;
select * from products;
select `Product Category`, count(`Product ID`)as productVerity from products group by `Product Category`order by count(`Product ID`) desc;


-- Having clause (used as agg fun ke saath ham where clause ka use nahi kar sakte hai)
-- have clause is used by -> group by
select Team, count(`First Name`) as noOfEmployees from employees group by Team having count(`First Name`) > 95;
select `Product Category`, count(`Product ID`)as productVerity from products group by `Product Category` having count(`Product ID`) > 3300 order by count(`Product ID`) desc;


-- JOINS (INNER, LEFT, RIGHT, CROSS)
-- ex tables in databases are of products, customers, orders, delivery
-- to build relationships among these data/tables we use joins
-- to extract data from multiple tables simultaneously
-- make relationships on the basis of common column(Primary & Foreign Key)
use HomeRental;
select * from Client;
select * from Branch;
select * from Registration;
select * from Staff;

-- inner joins says we find columns which have common elements(Two table common data)
select Client.clientNo, Client.fName, Registration.staffNo from Client
inner join Registration
on Client.clientNo = Registration.clientNo;

-- left join -> left ka sara data milega but right ka sirf matched data hi milega
-- right join -> right ka sara data milega but left ke sirf matched data hi milega
-- corss join -> from both the table you will get whole the data
select * from Client cross join Registration;
select * from Client cross join Registration on Client.clientNo = Registration.clientNo;
-- if in any case you have data in left but not in right table then cross join yield null in the resulted columns after join


-- set operator (union, union all, intersect, except)
-- we have two tables and sayad dono ke ander same data ho sakta hai, to unke uper ham set operation lagate hai


-- subqueries (outer + inner quaries) inner quaries execute first
select * from employees;
select avg(Salary) as averageSalary from employees;
-- finding employees name whose salary greater then avg salary
select * from employees where Salary > 90662;
select * from employees where Salary > (select avg(Salary) from employees);
select employee1.Firstname, employee1.Department from employeedb.employee1 where employee1.FirstName in (select employee2.FirstName from employeedb.employee2);
select employee1.Firstname, employee1.Department from employeedb.employee1 where employee1.FirstName not in (select employee2.FirstName from employeedb.employee2);



-- views -> it is virtual table (sirf apne hisab se dekhne ke liye kuch data fetch)
select * from customers;

create view count_of_customer_in_state as
select state, count(id) as noOfCustomer from customers group by state;

create view California_data as
select id, name, city from customers where state='California';


-- Stored Procedure : it works like function and we have to call it for there execution, here we have also pass parameter values
Delimiter &&
create procedure getProductData()
begin
	select * from analEmployee.products;
end &&
Delimiter ;

call analEmployee.getProductData();

-- parameter type -> in, out, inout
Delimiter &&
create procedure getLimit(in var int)
begin
	select * from analEmployee.products limit var;
end &&
Delimiter ;

call analEmployee.getLimit(6); -- starting ke 6 value hame chahiye

-- out : kisi bhi value ko nikal ke store karwana
Delimiter &&
create procedure getProductMaxPrice(out var int)
begin
	select max(Price) into var from analEmployee.products;
end &&
Delimiter ;

call analEmployee.getProductMaxPrice(@m);
select @m;

-- inout
-- Drop the old procedure if it exists
DROP PROCEDURE IF EXISTS getProductNameById;

-- Re-create the procedure
DELIMITER &&
CREATE PROCEDURE getProductNameById(
    IN  product_id_in VARCHAR(50),  -- IN parameter for the ID
    OUT product_name_out VARCHAR(255) -- OUT parameter for the name
)
BEGIN
    -- Use `SELECT ... INTO ...` to assign the value to the OUT parameter
    -- Use backticks (`) for column names with spaces
    SELECT `Product Name`
    INTO product_name_out
    FROM analEmployee.products
    WHERE `Product ID` = product_id_in;
END &&
DELIMITER ;

-- ---
-- How to call the new procedure
-- ---

-- 1. Set your input ID
SET @id = '93TGNAY7';

-- 2. Initialize your output variable (good practice)
SET @name = NULL;

-- 3. Call the procedure, passing both variables
CALL analEmployee.getProductNameById(@id, @name);

-- 4. Select the output variable to see the result
SELECT @name;



-- window function we can create partition kisi bhi chig ke basis ke uper