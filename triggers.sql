create database triggers;
use triggers;
show tables;

# before insert trigger

create table customers(
cust_id int,
age int,
name varchar(20));

delimiter //                           # it is a marker for the end of each command
create trigger age_verify
before insert on customers
for each row
if new.age<0 then set new.age=0;
end if; //

insert into customers values
(101,27,'James'),
(102,-40,'Ammy'),
(103,32,'Ben'),
(104,-39,'Angela');

select *from customers;

# After insert trigger

create table customers11(
id int auto_increment primary key,
name varchar(30) not null,
email varchar(50),
birthdate date);

create table message1(
id int auto_increment,
messageId int,
message varchar(300) not null,
primary key(id,messageId));

delimiter //
create trigger check_null_dob11
after insert on customers11
for each row
begin
if new.birthdate is null then
insert into message1(messageId,message)
values (new.id,concat('Hi',new.name,'Please update your date of birth'));
end if;
end //

insert into customers11(name,email,birthdate) values
('Nancy','Nan@gmail.com',NULL),
('Ronald','ro11@gmail.com','1999-11-16'),
('Chris','ch3@gmail.com','1997-12-7'),
('Allice','all@gmail.com',NULL);

select *from message1;

# before update trigger

create table employee(
emp_id int primary key,
emp_name varchar(30),
age int , salary float);

INSERT INTO employee (emp_id, emp_name, age, salary) VALUES
(101, 'Riya Sharma', 25, 35000.50),
(102, 'Amit Verma', 28, 42000.00),
(103, 'Nancy Paul', 24, 31000.75),
(104, 'Rahul Singh', 30, 50000.00),
(105, 'Sneha Patel', 27, 38000.25),
(106, 'Karan Mehta', 26, 36000.00),
(107, 'Deepak Yadav', 32, 55000.00);

delimiter //
create trigger upd_trigger
before update
on employee
for each row
begin
if new.salary=55000 then set new.salary=76000;
elseif new.salary<55000 then set new.salary=40000;
end if;
end //

update employee
set salary=54000
where emp_id ='101';

select *from employee;

# before delete trigger

create table salary(
eid int primary key,
validfrom date not null,
amount float not null);

insert into salary values
(101,'2005-05-01',55000),
(102,'2007-08-01',68000),
(103,'2006-09-01',75000);

select *from salary;

create table salarydel(
id int auto_increment primary key,
eid int,validfrom date not null,
amount float not null,
deletedat timestamp default now());

delimiter //
create trigger sal_del
before delete
on salary
for each row
begin
insert into salarydel(eid,validfrom,amount)
values(old.eid,old.validfrom,old.amount);
end //

delete from salary 
where eid='103';

select *from salarydel;

create table students1(
st_roll int ,
age int,
Name varchar(20),
marks float);

delimiter //
create trigger marks_verify_st
before insert 
on students1
for each row
begin
if new.marks<0 then set new.marks=50;
end if;
end // 

INSERT INTO students1 VALUES
(101, 18, 'Riya Sharma', 85.5),
(102, 19, 'Aman Verma', -56),
(103, 18, 'Neha Singh', 92.0),
(104, 20, 'Raj Patel', -32),
(105, 19, 'Karan Mehta', 76.5),
(106, 18, 'Pooja Das', -89),
(107, 21, 'Anjali Roy', 88.0),
(108, 20, 'Vikram Rao', 95.2);

select *from students1;

drop trigger marks_verify_st;     # Drop used to delete the trigger


