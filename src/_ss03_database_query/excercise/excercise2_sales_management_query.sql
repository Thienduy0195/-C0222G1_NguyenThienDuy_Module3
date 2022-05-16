use sales_management;

-- THÊM DỮ LIỆU
insert into customer (name, age) values ("Minh Quan", 10), ("Ngoc Oanh", 20), ("Hong Ha", 50);

insert into `order` (customer_id, `date`, total_price) 
value (1, "2006-03-21",100), 
		(2,"2006-03-23",200),
		(1,"2006-03-16",300);
        
update `order` set total_price = null;
        
insert into product (`name`, total_price) 
values ("May Giat", 3), 
		("Tu Lanh", 5), 
		("Dieu Hoa", 7), 
		("Quat", 1),
		("Bep Dien", 2);
        
insert into order_detail values (1,1,3), (1,3,7), 
(1,4,2), (2,1,1), 
(3,1,8), (2,5,4), (2,3,3);

-- TRUY VẤN
-- YC_1.Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order

select id, `date`, total_price from `order`;

-- YC_2.Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách

select c.`name`, p.`name`, p.total_price from order_detail od 
join `order` o on od.order_id = o.id
join customer c on o.customer_id = c.id
join product p on p.id = od.product_id;

-- YC_3. Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào

select * from customer 
where id not in (select customer_id from `order`);

-- YC_4. Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn).

select o.id, o.date, o.total_price, sum(od.order_quantity * p.total_price) as order_price from order_detail od 
join `order` o on od.order_id = o.id
join product p on p.id = od.product_id group by o.id;
