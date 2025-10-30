create database sql_jo;
show databases;
use sql_jo;

# Inner join

create table cricket(
cricket_id int primary key,
name varchar(15));
create table football(
football_id int primary key,
name varchar(15));
insert into cricket values
(1, 'Rohit'),
(2, 'Virat'),
(3, 'Dhoni'),
(4, 'Hardik'),
(5, 'Bumrah');
insert into football values
(1, 'Messi'),
(2, 'Ronaldo'),
(3, 'Neymar'),
(4, 'Mbappe'),
(5, 'Harry');

select *from cricket;
select *from football;

select cricket.cricket_id ,cricket.name,football.name
from cricket
inner join football
on cricket.cricket_id=football.football_id;

select c.cricket_id,c.name,f.name
from cricket as c
inner join football as f
on c.cricket_id=f.football_id;

# Left join

CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(20)
);

insert into students values
(1, 'Amit'),
(2, 'Riya'),
(3, 'Karan'),
(4, 'Neha'),
(5, 'Tina');
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    student_id INT,
    course_name VARCHAR(20),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

INSERT INTO courses VALUES
(101, 1, 'SQL'),
(102, 2, 'Python'),
(103, 3, 'Java');

select s.student_id,s.student_name,c.course_name
from students as s
left join courses as c
on s.student_id=c.student_id;

# Right join 

select s.student_id,s.student_name,c.course_name
from students as s
right join courses as c
on s.student_id=c.student_id;

# Full join - Union of left join and right join

select s.student_id,s.student_name,c.course_name
from students as s
left join courses as c
on s.student_id=c.student_id
union
select s.student_id,s.student_name,c.course_name
from students as s
right join courses as c
on s.student_id=c.student_id;






