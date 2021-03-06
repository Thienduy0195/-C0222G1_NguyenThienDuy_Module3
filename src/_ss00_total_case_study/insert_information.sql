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
            
	insert into dich_vu (ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, ma_kieu_thue, ma_loai_dich_vu, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang)
	values  ('Villa3', 100, 500, 6, 1, 2,'Luxury', null,40,3), 
			('House2', 150, 650, 10, 1, 2,'V.I.P', 'Phòng thiền',50,4),     
			('Room2', 40, 50, 2, 2, 3,'Luxury','Giường đôi',null,null),
			('House3', 70, 200, 10, 2, 2,'standard',"xông hơi",40,6);    
	        
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
            
-- 16. Chèn thêm khách để trùng tên cho task 8

	insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
	values  (1,'Nguyễn Đăng Quang','1990-05-14', 1,'206024579','0904124569','dangquang@gmail.com','Bạc Liêu'),         
			(2,'Đặng Lê Nguyên Vũ','1999-02-15', 1,'206564789','0906235648','nguyenvu@gmail.com','Bắc Ninh'),
	        (3,'Phạm Nhật Vượng','1999-02-25', 1,'023154621','0905634586','nhatvuong@gmail.com','Cà Mau');  
            
-- chèn thêm khách cho task 11

	insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
	values  (1,'Nguyễn Tấn Dũng','1960-05-14', 1,'203021547','0905214545','tandung@gmail.com','Quảng Ngãi'),         
			(1,'Nguyễn Xuân Phúc','1958-05-06', 1,'205012457','0906555655','xuanphuc@gmail.com','Vinh'),
	        (1,'Phạm Minh Chính','1956-02-25', 1,'203021479','0915215236','minhchinh@gmail.com','Vinh'); 
            
-- Chèn thêm hợp đồng cho task 11
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2022-08-12 12:12:00','2022-08-22 12:00:00',200,5,15,1),
			('2022-08-12 13:14:00','2022-08-22 12:00:00',200,6,16,2),
			('2022-08-12 13:14:00','2022-08-22 12:00:00',200,7,17,3);
            
	insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (18,2,2),
			(19,3,3),
	        (20,2,4);
            
	insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (20,1,1),
			(21,1,1);
            
	-- Chèn thêm hợp đồng cho task 12
    
    	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2020-12-12 12:12:00','2020-12-22 12:00:00',100,5,15,1),
			('2020-10-12 13:14:00','2020-10-22 12:00:00',20,6,16,3),
			('2020-11-12 13:14:00','2020-11-22 12:00:00',220,6,16,1),
			('2021-03-12 13:14:00','2021-03-22 12:00:00',150,6,16,2),
			('2021-01-12 13:14:00','2021-01-22 12:00:00',20,6,16,2),
			('2021-05-12 13:14:00','2021-05-22 12:00:00',100,7,17,4);
            
	insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (13,1,1),
			(14,2,2),
			(15,2,2),
			(16,3,4),
			(17,1,2),
			(22,4,5),
			(23,2,6),
			(24,3,2),
			(25,2,2),
			(26,1,4),
			(27,4,3);
            
	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2021-12-12 12:12:00','2021-12-22 12:00:00',100,5,15,1);
    
	insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (28,1,2);
    
        	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2021-12-12 12:12:00','2021-12-22 12:00:00',100,5,15,5),
			('2021-10-12 13:14:00','2021-10-22 12:00:00',20,6,16,6);
            
                    	insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu)
	values  ('2020-12-12 12:12:00','2020-12-22 12:00:00',100,5,15,5),
			('2020-10-12 13:14:00','2020-10-22 12:00:00',20,6,16,6);
            
            	insert into hop_dong_chi_tiet (ma_hop_dong, ma_dich_vu_di_kem, so_luong)
	values  (31,1,4),
			(32,2,2);
            
-- CHÈN THÊM NHÂN VIÊN VÀ KHÁCH HÀNG CHO TASK 20
	insert into khach_hang (ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi)
	values  (2,'Nguyễn Thế Thanh','1967-05-14', 1,'206212589','0902123657','thethanh@gmail.com','Quảng Bình'),         
			(2,'Nguyễn Thị Liễu','1969-02-15', 0,'206425879','0931456325','thilieu@gmail.com','Quảng Bình'),
	        (2,'Trần Nhật Minh','1984-02-25', 1,'023588796','0979212357','nhatminh@gmail.com','Bình Dương'); 
            
	insert into nhan_vien (ma_vi_tri, ma_trinh_do, ma_bo_phan, ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, em_mail, dia_chi) 
	values  (2,2,2,'John Cena','1989-02-02','205265659','5000000','0903365698','cena@gmail.com','United State'),        
	(3,1,2,'The Rock','1985-03-03','203156469','10000000','0903256369','therock@gmail.com','United State');
            

