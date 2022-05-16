-- TASK 2 AND TASK 3
    use furama_resort;
	
-- TASK 2
	SELECT 
    *
FROM
    nhan_vien
WHERE
    (ho_ten LIKE 'h%' OR ho_ten LIKE 'k%'
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

-- TASK 5

select k.ma_khach_hang, k.ho_ten, l.ten_loai_khach, h.ma_hop_dong, d.ten_dich_vu, 
h.ngay_lam_hop_dong, h.ngay_ket_thuc, (d.chi_phi_thue + hd.so_luong * dv.gia) as tong_tien 
from khach_hang k 
left join loai_khach l on l.ma_loai_khach = k.ma_loai_khach
left join hop_dong h on h.ma_khach_hang = k.ma_khach_hang
left join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem;

-- TASK 6

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc 
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu where not (year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) in (1,2,3));

-- TASK 7

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc 
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu 
where (dv.ma_dich_vu in (select hd.ma_dich_vu from hop_dong 
having (year(hd.ngay_lam_hop_dong) =2020)) 
and dv.ma_dich_vu 
not in (select hd.ma_dich_vu from hop_dong 
having (year(hd.ngay_lam_hop_dong) =2021))) 
group by dv.ten_dich_vu;

-- TASK 8
-- XUẤT RA HỌ TÊN KHÔNG TRÙNG NHAU THEO 3 CÁCH

-- CÁCH 1 
select ho_ten from khach_hang group by ho_ten;
-- CÁCH 2
select distinct ho_ten from khach_hang;
-- CÁCH 3

