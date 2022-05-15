-- TASK 2 AND TASK 3
    use furama_resort;
	
	-- TASK 2
	select *
	from nhan_vien
	where (ho_ten like 'h%' or ho_ten like 'k%' or ho_ten like 't%') and length(ho_ten) <= 15;
	
	-- TASK 3
	select *
	from khach_hang
	where ngay_sinh having (timestampdiff(year, ngay_sinh, current_date()) between 18 and 50)
	and dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị';
