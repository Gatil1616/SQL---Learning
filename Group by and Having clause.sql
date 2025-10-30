show databases;
use sql_intro;
show tables;

# Group by Clause

create table employees(
Emp_id int primary key,
Emp_name varchar(10),
Age int , Gender char(1),
doj date , city varchar(20),
dept varchar(20));
describe employees;
insert into employees
values
(101, 'Amit', 28, 'M', '2020-06-15', 'Delhi', 'IT'),
(102, 'Sneha', 25, 'F', '2021-03-20', 'Mumbai', 'HR'),
(103, 'Rohan', 30, 'M', '2019-11-10', 'Bangalore', 'Finance'),
(104, 'Priya', 27, 'F', '2022-01-05', 'Pune', 'Marketing'),
(105, 'Vikas', 35, 'M', '2018-08-25', 'Chennai', 'Sales'),
(106, 'Neha', 26, 'F', '2023-04-18', 'Kolkata', 'IT'),
(107, 'Raj', 29, 'M', '2020-09-12', 'Delhi', 'Finance'),
(108, 'Isha', 31, 'F', '2017-12-01', 'Hyderabad', 'HR');
select * from employees;
select distinct city from employees;
select avg(age) as avg_age from employees;
select dept,avg(age) as avg_age from employees
group by dept;
select dept,round(avg(age)) as avg_age from employees
group by dept;
select count(Emp_id),city from employees
group by city
order by count(Emp_id) desc;
select year(doj) as year,count(Emp_id)
from employees
group by year(doj);
create table sales (
product_id int , 
sell_price float,
quantity int , state varchar(20));
insert into sales 
values(201, 499.99, 5, 'Delhi'),
(202, 1299.50, 3, 'Maharashtra'),
(203, 899.00, 7, 'Karnataka'),
(204, 1499.75, 2, 'Tamil Nadu'),
(205, 299.25, 10, 'Gujarat'),
(206, 750.00, 4, 'West Bengal'),
(207, 999.00, 6, 'Delhi'),
(208, 1999.99, 1, 'Maharashtra'),
(209, 450.50, 8, 'Karnataka'),
(210, 850.00, 5, 'Punjab');
select *from sales;
select state,sum(sell_price * quantity) as revenue from sales
group by state;

create table c_product (
product_id int,
cost_price float);
insert into c_product
values(201,2890.89),
(208,432789.978);

# To combine both the tables by inner join and to find the profit.

select c.product_id,sum((s.sell_price-c.cost_price)*s.quantity) as profit
from sales as s 
inner join c_product as c
where s.product_id=c.product_id
group by c.product_id

# Having clause

select *from sales;
select state,avg(sell_price) as avg_sp 
from sales
group by state
having avg_sp>1000;

select dept,count(*) as employee
from employees
group by dept
having employee>1;

select dept,count(emp_id) as employee
from employees
group by dept
having employee>1;

select city,count(*) as employee
from employees
where city!='Delhi'
group by city
having employee>1;

select dept,count(*) as employee
from employees
group by dept
having dept='IT'









