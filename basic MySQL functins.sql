show databases;
use mysql;
show tables;
select *from func;
describe func;
create database sql_intro;
show databases;
create table employee(
Name varchar(15),age int,gender char(1),salary float,city varchar(15));
describe employee;
insert into employee
values('Gatil',21,'M',23456.8,'Lucknow'),
('Varun',23,'M',22222,'Kerela'),
('Mahi',20,'F',3456.654,'Delhi'),
('Chitra',20,'F',3466.654,'Lucknow');
select *from employee;
select distinct city from employee;
select count(Name) as Number_of_names from employee;
select avg(salary) as average from employee;
select Name,age from employee;
select * from employee
where age<23;
select name from employee
where gender='F';
select *from employee
where age>=23;
select *from employee
where city='Lucknow'or city='Kerela';
select *from employee
where city in ('Lucknow','Kerela');
select *from employee
where gender='F' and city='Delhi';
select gender,sum(salary) as total_sal from employee
group by gender;
select *from employee 
order by salary;          #ascending by default
select *from employee 
order by salary desc;
select (100+20) as addition;
select (100-20) as substraction;
select length('India') as len;
select length('Uttar Pradesh') as len;
select repeat('%',12);
select upper('Lucknow');
select lower('HINDUSTAN');          # both are fuctions does same work
select lcase('HINDUSTAN');
select curdate();
select day(curdate());
select now();          # Returns current date and time

# String functions
select length('INDIA') as total_len;
select Name,length(Name) as name_len
from employee;
select concat('India', ' is',' Great') as merged;       # Joints two or more strings
select Name,concat(gender,' ',city) as gen_cit
from employee;
select reverse('Lucknow');
select reverse(Name) from employee;
select reverse(age) from employee;
select replace('Orange is a vegetable','vegetable','fruit');
select length('         fruit          ');
select ltrim('         fruit          ');
select length(ltrim('         fruit          '));
select rtrim('         fruit          ');
select length(rtrim('         fruit          '));
select trim('         fruit          ');
select length(trim('         fruit          '));     # trim = ltrim unoin rtrim
select position('Great' in 'India is Great');
select ascii('a');        # Returns the ascii values
select ascii('6');