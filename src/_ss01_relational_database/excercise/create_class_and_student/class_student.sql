use `student-management`;
create table class(
id int (5),
`name` varchar(55), 
primary key (id)
);

-- drop table class;

create table teacher(
id int (5),
`name` varchar(55),
age int(5),
country varchar(100),
primary key (id)
);

