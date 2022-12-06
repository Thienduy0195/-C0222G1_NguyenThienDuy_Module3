use furama_resort_case_study;

-- Thêm dữ liệu vào bảng position --
-- insert into `position` (position_name) values ('Receptionist');
-- insert into `position` (position_name) values ('Waitress');
-- insert into `position` (position_name) values ('Expert');
-- insert into `position` (position_name) values ('Supervisor');
-- insert into `position` (position_name) values ('Manager');
-- insert into `position` (position_name) values ('Director');



-- Thêm dữ liệu vào bảng education_degree --
-- insert into education_degree (education_degree_name) values ('Intermediate');
-- insert into education_degree (education_degree_name) values ('College');
-- insert into education_degree (education_degree_name) values ('University');
-- insert into education_degree (education_degree_name) values ('Postgraduate');

-- Thêm dữ liệu vào bảng division --
-- insert into division (division_name) values ('Sale-marketing');
-- insert into division (division_name) values ('Administration');
-- insert into division (division_name) values ('Service');
-- insert into division (division_name) values ('Management');
-- delete from division;

-- Thêm dữ liệu vào bảng user --
-- insert into `user` values ('quangphuc@gmail.com','123123');
-- insert into `user` values ('thienduy@gmail.com','123123');
-- insert into `user` values ('duytrung@gmail.com','123123');
-- insert into `user` values ('nhathoang@gmail.com','123123');
-- insert into `user` values ('admin@gmail.com','123123');

-- Thêm dữ liệu vào bảng employee --
-- insert into employee (employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, user_name)
-- values ('Nguyễn Quang Phúc','1998-06-29','111222333',500,'0123123123','quangphuc@gmail.com','Đà Nẵng',5,4,4,'quangphuc@gmail.com'),
-- 	   ('Nguyễn Thiên Duy','1995-04-13','222333444',400,'0123412445','thienduy@gmail.com','Quảng Nam',6,4,4,'thienduy@gmail.com'),
--        ('Huỳnh Nhật Hoàng','1996-05-16','333444555',450,'064577887','nhathoang@gmail.com','Đà Nẵng',1,3,3,'nhathoang@gmail.com'),
--        ('Nguyễn Duy Trung','2003-09-06','444555666',600,'8674646343','duytrung@gmail.com','Quảng Nam',2,2,2,'duytrung@gmail.com');
       
-- Thêm dữ liệu vào bảng customer_type -- 
-- insert into customer_type (customer_type_name) values ('Diamond');
-- insert into customer_type (customer_type_name) values ('Platinium');
-- insert into customer_type (customer_type_name) values ('Gold');
-- insert into customer_type (customer_type_name) values ('Silver');
-- insert into customer_type (customer_type_name) values ('Member');

-- Thêm dữ liệu vào bảng customer --
-- insert into customer values ('KH-0001',2, 'Trần Văn Khánh', '1995-02-01', 0, '123111222', '0798584942', 'khanhtran@gmail.com', 'Quảng Bình'),
-- 	   ('KH-0002',2, 'Nguyễn Hoàng Hảo', '2000-09-02', 0, '342325665','0949648638','hoanghao@gmail.com','Đà Nẵng'),
--        ('KH-0003',4, 'Trần Mạnh Cường', '1997-08-06', 0, '786744564','0346534633', 'manhcuong@gmail.com', 'Quảng Bình'),
--        ('KH-0004',1, 'Nguyễn Thảo Uyên', '2000-12-12',1,'2352352352','04564564456','thaouyen@gmail.com','Quảng Ngãi');

-- Thêm dữ liệu vào bảng service_type --
-- insert into service_type (service_type_name) values ('Standard');
-- insert into service_type (service_type_name) values ('Deluxe');
-- insert into service_type (service_type_name) values ('President');
-- insert into service_type (service_type_name) values ('VIP');

-- Thêm dữ liệu vào bảng rent_type --
-- insert into rent_type (rent_type_name, rent_type_cost) values ('Year', 100);
-- insert into rent_type (rent_type_name, rent_type_cost) values ('Month', 80);
-- insert into rent_type (rent_type_name, rent_type_cost) values ('Day', 50);
-- insert into rent_type (rent_type_name, rent_type_cost) values ('Hour', 30);

-- Thêm dữ liệu vào bảng service --

-- insert into service values ('DV-0123', 'Room1', 50, 50, 5, 1, 2, 'Luxury', 'Hot rock Spa', 30, 5),
-- 							('DV-0124', 'Room2', 70, 60, 6, 3, 4, 'Premium', 'Hot rock Spa', 40, 3),
--                             ('DV-0125', 'Room3', 30, 35, 3, 1, 1, 'Deluxe', 'Massage', 20, 5),
--                             ('DV-0126', 'Villa1', 80, 50, 5, 1, 2, 'Deluxe', 'Free Breakfast', 25, 5),
--                             ('DV-0127', 'Villa2', 50, 50, 5, 1, 2, 'Luxury', 'Hot rock Spa', 40, 8),
--                             ('DV-0128', 'Villa3', 50, 50, 5, 1, 2, 'Premium', 'Massage', 35, 5),
--                             ('DV-0129', 'House1', 50, 50, 5, 1, 2, 'Luxury', 'Free Breakfast', 30, 2),
--                             ('DV-1030', 'House2', 50, 50, 5, 1, 2, 'Premium', 'Hot rock Spa', 50, 4),
--                             ('DV-0131', 'House3', 50, 50, 5, 1, 2, 'Premium', 'Free Breakfast, Massage', 45, 6);