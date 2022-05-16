CREATE DATABASE sales_management;
use sales_management;

create table customer(
id int PRIMARY key AUTO_INCREMENT,
name VARCHAR (50) not null,
age int
);

create table `order`(
id int PRIMARY key AUTO_INCREMENT,
customer_id int not null,
date DATE,
total_price DOUBLE,
FOREIGN KEY (customer_id) REFERENCES customer (id)
);

create table `product`(
id int PRIMARY key AUTO_INCREMENT,
name VARCHAR (50) not null,
total_price DOUBLE not null
);

create table `order_detail`(
order_id int not null,
product_id int not null,
order_quantity int,
FOREIGN KEY (order_id) REFERENCES `order` (id),
FOREIGN KEY (product_id) REFERENCES product (id),
PRIMARY KEY (order_id, product_id)
);


