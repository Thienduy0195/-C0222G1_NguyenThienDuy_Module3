-- TASK 2 AND TASK 3
    use furama_resort;
	
-- TASK 2
	SELECT * FROM nhan_vien
    WHERE (ho_ten LIKE 'h%' OR ho_ten LIKE 'k%'
        OR ho_ten LIKE 't%')
        AND LENGTH(ho_ten) <= 15;
	
-- TASK 3
	select * from khach_hang
	where ngay_sinh having (timestampdiff(year, ngay_sinh, current_date()) between 18 and 50)
	and dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị';
    
-- TASK 4

select k.ho_ten,ten_loai_khach, count(k.ma_khach_hang) as so_luong from khach_hang k 
join hop_dong h on k.ma_khach_hang=h.ma_khach_hang
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
where ten_loai_khach ="Diamond" group by k.ma_khach_hang order by so_luong;

