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
select ho_ten from khach_hang union select ho_ten from khach_hang;

-- TASK 9

SELECT month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as so_luong_khach_hang from hop_dong where year (ngay_lam_hop_dong) =2021 group by thang;

-- TASK 10

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem group by hd.ma_hop_dong order by  hd.ma_hop_dong;

-- TASK 11

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, lk.ten_loai_khach, kh.dia_chi
from loai_khach lk
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Vinh" or kh.dia_chi = "Quảng Ngãi");

-- TASK 12


select hd.ma_hop_dong, hd.ngay_lam_hop_dong, nv.ho_ten ten_nhan_vien, kh.ho_ten ten_khach_hang, 
kh.so_dien_thoai so_dien_thoai_khach_hang, dv.ten_dich_vu, 
hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from dich_vu dv
join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
join nhan_vien nv on nv.ma_nhan_vien = hd.ma_nhan_vien
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
where (select quarter(ngay_lam_hop_dong) having year(ngay_lam_hop_dong)=2020)=4
and quarter(ngay_lam_hop_dong) not in (select quarter(ngay_lam_hop_dong) having year(ngay_lam_hop_dong)=2021 in (1,2))
group by dv.ma_dich_vu;

-- TASK 13
create view dich_vu_di_kem_view as
select sum(hdct.so_luong) so_lan_su_dung, dvdk.ten_dich_vu_di_kem, 
 dvdk.gia, dvdk.don_vi, dvdk.trang_thai
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem ;

select ten_dich_vu_di_kem,so_lan_su_dung, 
 gia, don_vi, trang_thai from dich_vu_di_kem_view
 where so_lan_su_dung in (select max(so_lan_su_dung) from dich_vu_di_kem_view);

-- TASK 14

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dvdk.ten_dich_vu_di_kem, 
count(dvdk.ma_dich_vu_di_kem) so_lan_su_dung
from hop_dong hd
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung = 4;

-- hiện tại chưa chèn dịch vụ đi kèm có số lần sử dụng là 1
