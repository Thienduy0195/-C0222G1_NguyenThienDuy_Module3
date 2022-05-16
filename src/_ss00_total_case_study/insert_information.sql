-- TASK 1

use furama_resort;

-- 1.chèn trình độ vào bảng
	 insert into trinh_do (ten_trinh_do)
	 values ('Trung cấp'),       
			('Cao đẳng'),      
			('Đại học'),       
			('Sau đại học');
            
-- 2.chèn vị trí vào bảng
            insert into vi_tri (ten_vi_tri)
	values  ('Lễ tân'),
			('Phục vụ'),
			('Chuyên viên'),
			('Giám sát'),
	        ('Quản lý'),
	        ('Giám đốc');
            
-- 3.chèn bộ phận vào bảng
	insert into bo_phan (ten_bo_phan)
	values  ('Sale-marketing'),        
			('Hành chính'),        
			('Phục vụ'),        
			('Quản lý');
	        
            
-- 4.chèn loại khách vào bảng
	insert into loai_khach (ten_loai_khach)
	values  ('Diamond'),        
			('Platinium'),   
			('Gold'),   
			('Silver'),   
			('Member');   
	        
-- 5.chèn kiểu thuê vào bảng
	insert into kieu_thue (ten_kieu_thue)
	values  ('Theo giờ'),
			('Theo ngày'),       
			('Theo tháng'),       
			('Theo năm');   

-- 6.chèn loại dịch vụ vào bảng
	insert into loai_dich_vu (ten_loai_dich_vu)
	values  ('Villa'),        
			('House'),        
			('Room');
            
-- 7.chèn nhân viên vào bảng
	insert into nhan_vien 
	values  (1,1,2,2,'Nguyễn Vĩnh Hiếu','1999-02-02','205826566','5000000','0905555666','vinhhieu@gmail.com','Đà Nẵng'),        
	(2,1,1,2,'Nguyễn Văn Tỉnh','1995-03-03','208826546','10000000','0917546466','vantinh@gmail.com','Quảng Nam'),
        (3,2,3,3,'Đỗ Hồng Nhung','1995-03-15','203232658','7000000','0965656548','hongnhung12@thaco.com','Quảng Trị'),
        (4,2,3,3,'Đỗ Như Thủy','2000-06-15','205689465','8000000','0909235668','nhuthuy@thaco.com','Quảng Bình');
	        
-- 8.chèn dịch vụ đi kèm
	insert into dich_vu_di_kem
	values  (1,'xem đua ngựa',25,'USD','open'),       
			(2,'bữa sáng',10,'usd','open'),       
			(3,'xông hơi',20,'usd','open'),
			(4,'hồ bơi',5,'usd','open');
            

-- 9.chèn dịch vụ
	insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
	values  ('Villa1', 100, 500, 6, 1, 2,'V.I.P', null,40,3), 
    ('Villa2', 150, 650, 10, 1, 2,'V.I.P', 'Phòng thiền',50,4),
			('House1', 70, 200, 10, 2, 2,'standard',null,40,6),       
			('Room1', 40, 50, 2, 2, 3,'Luxury','Giường đôi',null,null);    
	        
-- 10.chèn khách hàng
	insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
	values  (2,'Nguyễn Đăng Quang','1980-05-14', 1,'205898987','0905656989','quangnguyen@gmail.com','Đà Nẵng'),         
			(1,'Đặng Lê Nguyên Vũ','1995-02-15', 1,'253869854','0989456325','vudang@gmail.com','Quảng Nam'),
            (3,'Nguyễn Thị Phương Thảo','1978-08-24', 0,'248798649','0965656565','thaonguyen@gmail.com','Quảng Trị'),
	        (3,'Phạm Nhật Vượng','1970-02-25', 1,'234602136','0909345678','vuongpham@gmail.com','Quảng Trị');   
	        
-- 11.chèn hợp đồng
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2022-05-12 12:12:00','2022-05-25 12:00:00',300,1,1,2),
			('2022-05-13 13:14:00','2022-05-30 12:00:00',100,2,2,3),
	        ('2022-05-14 15:16:00','2022-05-25 12:00:00',20,3,1,4);
	        
-- 12.chèn chi tiết hợp đồng
	insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (2,2,2),
			(2,3,6),
	        (3,2,10);
            
		insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (1,1,2),
			(4,2,2),
			(5,3,3),
			(6,4,1),
			(7,3,1),
			(8,2,2),
			(9,1,4),
			(10,2,6),
			(11,3,1),
	        (12,4,2);

-- 13.chèn thêm nhân viên cho task 2
	insert into nhan_vien (ma_vi_tri, ma_trinh_do, ma_bo_phan, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, em_mail, dia_chi) 
	values  (1,2,2,'Will Smith','1999-02-02','265826566','5000000','0905565666','smith@gmail.com','United State'),        
	(1,1,2,'Eric Catona','1995-03-03','208626546','10000000','0917546486','catona@gmail.com','England'),
        (2,3,3,'Phillip Lamp','1995-03-15','263232658','7000000','0965658548','lamp@thaco.com','Germany'),
        (2,3,3,'Tony Kroos','2000-06-15','205789465','8000000','0909235678','kroos@thaco.com','Germany');
        
        
-- 14.chèn thêm khách hàng
	insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
	values  (3,'Trần Đình Long','1970-05-14', 1,'205898987','0905656989','dinhlong@gmail.com','Đà Nẵng'),         
			(2,'Trần Bá Dương','1975-02-15', 1,'253869854','0989456325','duongtran@gmail.com','Quảng Nam'),
            (2,'Đoàn Nguyên Đức','1978-08-24', 0,'248798649','0965656565','ducdoan@gmail.com','Quảng Trị');
	
	insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
	values  (1,'Nguyễn Thiên Duy','1995-01-01', 1,'253689546','0917579123','thienduy@gmail.com','Đà Nẵng'),         
			(1,'Nguyễn Công Tranh','1962-10-04', 1,'205898965','0905666175','congtranh@gmail.com','Quảng Nam'),
			(1,'Nguyễn Thị Thùy Dương','1966-09-15', 0,'205898965','0906456789','thuyduong@gmail.com','Quảng Nam'),
            (1,'Nguyễn Thị Diệu Huyền','1996-06-17', 0,'206016576','0903112666','dieuhuyen@gmail.com','Quảng Bình');
            
-- 15.Chèn thêm hợp đồng

	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2022-06-12 12:12:00','2022-06-22 12:00:00',300,1,8,1),
			('2022-06-12 13:14:00','2022-06-22 12:00:00',100,2,9,1),
			('2022-06-12 13:14:00','2022-06-22 12:00:00',100,2,10,1),
	        ('2022-06-12 15:16:00','2022-06-22 12:00:00',20,3,11,1);
            
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2023-06-12 12:12:00','2023-06-22 12:00:00',200,1,8,1),
			('2023-06-12 13:14:00','2023-06-22 12:00:00',200,2,9,1),
			('2023-06-12 13:14:00','2023-06-22 12:00:00',200,2,8,1),
			('2023-06-12 13:14:00','2023-06-22 12:00:00',200,2,10,1),
	        ('2023-06-12 15:16:00','2023-06-22 12:00:00',200,3,11,1);
            
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2021-01-12 12:12:00','2021-04-22 12:00:00',100,1,8,1),
			('2021-02-12 13:14:00','2021-05-22 12:00:00',150,2,9,2),
			('2021-01-12 13:14:00','2021-06-22 12:00:00',200,2,10,2),
	        ('2021-03-12 15:16:00','2021-03-22 12:00:00',220,3,11,3);
            
-- insert thêm hợp đồng cho task 7
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2020-01-12 12:12:00','2020-04-22 12:00:00',100,1,8,4),
	        ('2020-03-12 15:16:00','2020-03-22 12:00:00',220,3,11,4);
