create database sql_iq;

                            # Stored procedures

use sql_iq;
show tables;

create table players(
player_id int primary key,
name varchar(20),
county varchar(13),
goals int);

INSERT INTO players VALUES
(1, 'Rohit Sharma', 'India', 45),
(2, 'Harry Kane', 'England', 102),
(3, 'Lionel Messi', 'Argentina', 120),
(4, 'Cristiano Ronaldo', 'Portugal', 128),
(5, 'Neymar Jr', 'Brazil', 95),
(6, 'Sunil Chhetri', 'India', 94),
(7, 'Kylian Mbappe', 'France', 88),
(8, 'Robert Lewandowski', 'Poland', 110);

delimiter //
create procedure top_players()
begin
select name,county,goals
from players
where goals>100;
end    //

call top_players();          # Call is used to display the stored procedure


# Stored procedure using IN parameter

create table emp_details(
Name varchar(20),
Age int,
sex char(1),
dob date,
city varchar(50),
salary float); 

INSERT INTO emp_details VALUES
('Amit Sharma', 29, 'M', '1996-04-15', 'Delhi', 55000),
('Neha Verma', 25, 'F', '1999-07-22', 'Mumbai', 62000),
('Ravi Kumar', 35, 'M', '1989-01-10', 'Bangalore', 75000),
('Priya Singh', 28, 'F', '1997-03-08', 'Kolkata', 58000),
('Arjun Mehta', 32, 'M', '1993-09-11', 'Chennai', 72000);

delimiter //
create procedure sal_sort(IN var int)
begin
select name,salary 
from emp_details
order by salary desc
limit var;
end //

call sal_sort(3);
call sal_sort(4);

delimiter //
create procedure sal_update(IN temp_name varchar(20),IN new_salary float)
begin
update emp_details
set salary = new_salary
where name=temp_name;
end // 

use sql_iq;
select *from emp_details;
call sal_update('Neha Verma',70000);

select *from emp_details;


# Stored procedure using OUT parameter

delimiter //
create procedure sal_count(OUT total_emps int)
begin
select count(name) into total_emps
from emp_details 
where sex='F';
end // 

call sal_count(@F_emps)
select @F_emps as Female_emps;

 
 # Views in an SQL
 
 select *from emp_details;
 
 create view employees as
 select name , age , dob
 from emp_details;
 select *from employees;
 
 create view employee_1 as 
 select Name , Age,dob 
 from emp_details
 where sex='M';
 
 select *from employee_1;
 
 CREATE TABLE student (
  student_id INT PRIMARY KEY,
  name VARCHAR(30),
  age INT,
  gender CHAR(1),
  course_id INT
);

INSERT INTO student VALUES
(1, 'Riya Sharma', 20, 'F', 101),
(2, 'Aman Verma', 21, 'M', 102),
(3, 'Neha Singh', 19, 'F', 103),
(4, 'Rohit Mehta', 22, 'M', 101),
(5, 'Pooja Das', 20, 'F', 104),
(6, 'Karan Patel', 21, 'M', 105),
(7, 'Anjali Roy', 23, 'F', 102);


CREATE TABLE courses (
  course_id INT PRIMARY KEY,
  course_name VARCHAR(30),
  duration VARCHAR(15),
  instructor VARCHAR(25),
  fees FLOAT
);

INSERT INTO courses VALUES
(101, 'Data Science', '6 months', 'Dr. Rao', 25000),
(102, 'Web Development', '4 months', 'Ms. Mehta', 18000),
(103, 'Database Systems', '5 months', 'Mr. Kumar', 20000),
(104, 'Cyber Security', '6 months', 'Ms. Singh', 23000),
(105, 'AI Fundamentals', '3 months', 'Dr. Nair', 27000),
(106, 'Cloud Computing', '4 months', 'Mr. Das', 22000),
(107, 'DevOps', '5 months', 'Ms. Patel', 26000);


create view stu_cour as 
select s.name,s.age,c.course_name
from Student as s
inner join courses as c 
on s.course_id=c.course_id;

select *from stu_cour;

# Rename discription

rename table stu_cour to stud_course;


# Delete the view

drop view employee_1;


# Windows Functions

use subqueries;
select *from employees;

select Emp_name,Age,Dept,sum(Salary) over (Partition by Dept) as total_salary
from employees;

# Row Number

select row_number() over (order by salary) as rows_num,Emp_name,salary
from employees
order by salary;

create table demo_1(
st_id int,
st_name varchar(20));

insert into demo_1 values
(101,'Renu'),
(102,'Imma'),
(103,'Ankit'),
(104,'Renu'),
(105,'Shraddha'),
(106,'Imma');



select *from demo_1;

select st_id,st_name,row_number()over(Partition by st_id,st_name order by st_id) as row_num
from demo_1;

# Rank Function

create table demo_2(var int);
insert into demo_2 values
(101),(102),(103),(103),(104),(101),(105),(102);

select var ,rank() over (order by var) as test_rank
from demo_2;

# First Value

select Emp_name,Age,Salary,first_value(Emp_name)
over(order by Salary desc) as Highest_salary
from employees;

select Emp_name,dept,Salary,first_value(Emp_name)
over (Partition by dept order by Salary desc) as Highest_salary
from employees;



