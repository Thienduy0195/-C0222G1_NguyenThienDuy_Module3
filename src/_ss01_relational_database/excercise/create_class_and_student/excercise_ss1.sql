CREATE DATABASE `student_management`;
use `student_management`;
create table class(
id int (5) not null,
`name` varchar(55) null, 
primary key (id)
);

-- drop table class;

create table teacher(
id int (5) not null,
`name` varchar(55) null,
age int(5) null,
country varchar(100) null,
primary key (id)
);
