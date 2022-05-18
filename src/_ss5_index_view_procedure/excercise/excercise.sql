create database demo;
use demo;
create table products (
product_id int primary key auto_increment,
product_code varchar (20),
product_name varchar (50),
product_price double,
product_amount double,
product_description varchar (255),
product_status bit);


insert into products 
values (1,"SSGF","Sam Sung Galaxy Fold", 5000, 200, "Product of SamSung", 1),
(2,"SSN9","Sam Sung Note 9", 3000, 500, "Product of SamSung", 1),
(3,"API11","Apple Iphone 11", 5000, 350, "Product of Apple", 1),
(4,"RMN5","Redmi Note 5", 2500, 400, "Product of Xiao Mi", 1),
(5,"OPN5","Oppo Neo 5", 2000, 600, "Product of Oppo", 1),
(6,"SSN10","Sam Sung Note 10", 3500, 500, "Product of SamSung", 1),
(7,"SSS9","Sam Sung Galaxy S9", 3000, 500, "Product of SamSung", 1),
(8,"API12","Apple Iphone 12", 7500, 350, "Product of Apple", 1),
(9,"API14","Apple Iphone 14", 10000, 250, "Product of Apple", 1);

-- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)

create unique index product_index on products (product_code);

-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)

create index composite_index on products (product_name,product_price);

-- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào

explain select * from products where product_code="SSN9";

-- So sánh câu truy vấn trước và sau khi tạo index -- TỰ QUAN SÁT QUÁ TRÌNH CHẠY

-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view product_view 
as select product_code, product_name, product_price, product_status
from products;

-- Tiến hành sửa đổi view

update product_view set product_price = 4500 where product_code = "SSN9";
update product_view set product_status = 0 where product_code = "RMN5";

-- Tiến hành xoá view
-- Xóa 1 record và thông tin sẽ tự update bên bảng chính
delete from product_view where product_code = "OPN5";

-- Xóa cả bảng view
drop view product_view;

-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure sp_get_all_product ()
begin
select * from products;
end //
delimiter ;
call sp_get_all_product();

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure sp_add_new_product (in p_code varchar (20),
										p_name varchar (50),
										p_price double,
										p_amount double,
										p_description varchar (255),
										p_status bit)
begin
insert into products (product_code, product_name, product_price, product_amount, product_description, product_status) 
values (p_code,p_name, p_price, p_amount, p_description, p_status);
end //
delimiter ;

call sp_add_new_product("OPN5", "Oppo Neo 5", 3200, 260, "Product of Oppo", 1);


-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure sp_update_product_by_id (in p_id int,
										p_code varchar (20),
										p_name varchar (50),
										p_price double,
										p_amount double,
										p_description varchar (255),
										p_status bit)
begin
update products p set p.product_code = p_code,
					p.product_name = p_name,
                    p.product_price = p_price,
                    p.product_amount = p_amount,
                    p.product_description =p_description,
                    p.product_status =p_status
				where p.product_id = p_id;
end //
delimiter ;

call sp_update_product_by_id(4,"API7","Apple Iphone 7", 2400, 210, "Product of Apple", 1);

-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure sp_delete_product_by_id (in p_id int)
begin
delete from products p where p.product_id = p_id;
end //
delimiter ;

call sp_delete_product_by_id(3);
