use analEmployee;
select * from customers;
select id, name, segment from customers;
select id, name from customers where segment="Home Office";
select * from customers where segment="Home Office" and state="Texas";
select * from customers where segment="Home Office" or state="Texas";
select * from customers where segment="Home Office" and not state="Texas";