# Select statement

create database subqueries;
use subqueries;
show tables;
CREATE TABLE Employees (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(20),
    Age INT,
    Gender CHAR(1),
    Doj DATE,
    Dept VARCHAR(20),
    City VARCHAR(20),
    Salary INT
);
INSERT INTO Employees (Emp_Id, Emp_name, Age, Gender, Doj, Dept, City, Salary) VALUES
(106, 'Ammy', 35, 'F', '2014-12-20', 'IT', 'Seattle', 80000),
(107, 'Jack', 40, 'M', '2012-07-14', 'Finance', 'Houston', 100000),
(108, 'Angela', 36, 'F', '2007-02-04', 'Tech', 'New York', 110000),
(109, 'Marcus', 25, 'M', '2010-07-18', 'HR', 'Boston', 90000),
(110, 'David', 34, 'M', '2009-08-25', 'Product', 'Miami', 75000),
(111, 'Rose', 28, 'F', '2011-02-27', 'HR', 'Houston', 65000),
(112, 'Sophia', 23, 'F', '2019-03-27', 'HR', 'Houston', 65000),
(113, 'Amelia', 30, 'F', '2018-10-15', 'Finance', 'Austin', 95000),
(114, 'Robert', 40, 'M', '2016-04-10', 'Sales', 'Detroit', 83000),
(115, 'William', 32, 'M', '2004-08-09', 'IT', 'Chicago', 87000),
(116, 'John', 25, 'M', '2014-08-09', 'Marketing', 'Tech', 72000),
(117, 'Bella', 23, 'F', '2018-10-15', 'Tech', 'Houston', 84000),
(118, 'Maya', 25, 'F', '2019-05-28', 'Product', 'Seattle', 76000),
(119, 'Alice', 37, 'F', '2016-11-23', 'Sales', 'Chicago', 115000),
(120, 'Joseph', 45, 'M', '2016-11-23', 'Sales', 'Chicago', 115000);

select *from employees;

select Emp_name,Dept,salary
from employees
where Salary<(select avg(Salary) from employees);

# Insert Subquerry


CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    p_name VARCHAR(20),
    sell_price FLOAT,
    p_type VARCHAR(20)
);
INSERT INTO Products (product_id, p_name, sell_price, p_type) VALUES
(101, 'Laptop', 1400.5, 'Luxury'),
(102, 'Camera', 60.4, 'Non Luxury'),
(103, 'Necklace', 1200.6, 'Non Luxury'),
(104, 'Sofa', 800.3, 'Non Luxury');

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    product_sold VARCHAR(20),
    selling_price FLOAT
);

insert into Orders values
(101,'Laptop',1400.5),
(103,'Necklace',1200.6);

select*from products;

insert into Orders select product_id,p_name,sell_price
from Products
where product_id in (select product_id from Products where sell_price<1000);

select *from Orders;

#Update Subquerry


CREATE TABLE Employees_b (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(20),
    Age INT,
    Gender CHAR(1),
    Doj DATE,
    Dept VARCHAR(20),
    City VARCHAR(20),
    Salary INT
);
INSERT INTO Employees_b (Emp_Id, Emp_name, Age, Gender, Doj, Dept, City, Salary) VALUES
(106, 'Ammy', 35, 'F', '2014-12-20', 'IT', 'Seattle', 80000),
(107, 'Jack', 40, 'M', '2012-07-14', 'Finance', 'Houston', 100000),
(108, 'Angela', 36, 'F', '2007-02-04', 'Tech', 'New York', 110000),
(109, 'Marcus', 25, 'M', '2010-07-18', 'HR', 'Boston', 90000),
(110, 'David', 34, 'M', '2009-08-25', 'Product', 'Miami', 75000),
(111, 'Rose', 28, 'F', '2011-02-27', 'HR', 'Houston', 65000),
(112, 'Sophia', 23, 'F', '2019-03-27', 'HR', 'Houston', 65000),
(113, 'Amelia', 30, 'F', '2018-10-15', 'Finance', 'Austin', 95000),
(114, 'Robert', 40, 'M', '2016-04-10', 'Sales', 'Detroit', 83000),
(115, 'William', 32, 'M', '2004-08-09', 'IT', 'Chicago', 87000),
(116, 'John', 25, 'M', '2014-08-09', 'Marketing', 'Tech', 72000),
(117, 'Bella', 23, 'F', '2018-10-15', 'Tech', 'Houston', 84000),
(118, 'Maya', 25, 'F', '2019-05-28', 'Product', 'Seattle', 76000),
(119, 'Alice', 37, 'F', '2016-11-23', 'Sales', 'Chicago', 115000),
(120, 'Joseph', 45, 'M', '2016-11-23', 'Sales', 'Chicago', 115000);



select *from employees_b;

update employees
set Salary=Salary*0.35
where Age in (select Age from employees_b where age>=27);

select *from employees;

# Delete subquerry

select *from employees;

delete from employees
where Age in (select Age from employees_b where Age<32);

select *from employees;