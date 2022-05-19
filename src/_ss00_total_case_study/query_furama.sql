-- TASK 2 AND TASK 3
use furama_resort;
	
-- TASK 2
# 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
# có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where (ho_ten like 'h%' or ho_ten like 'k%'
        or ho_ten like 't%')
        and length(ho_ten) <= 15;
	
-- TASK 3
# 3.	Hiển thị thông tin của tất cả khách hàng 
# có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
	select * from khach_hang
	where ngay_sinh having (timestampdiff(year, ngay_sinh, current_date()) between 18 and 50)
	and dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị';
    
-- TASK 4
#4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
# Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
# Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

select k.ho_ten,ten_loai_khach, count(k.ma_khach_hang) as so_luong from khach_hang k 
join hop_dong h on k.ma_khach_hang=h.ma_khach_hang
join loai_khach l on k.ma_loai_khach = l.ma_loai_khach 
where ten_loai_khach ="Diamond" group by k.ma_khach_hang order by so_luong;

-- TASK 5
# 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, 
# ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: 
# Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
# cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).

select k.ma_khach_hang, k.ho_ten, l.ten_loai_khach, h.ma_hop_dong, d.ten_dich_vu, 
h.ngay_lam_hop_dong, h.ngay_ket_thuc, (d.chi_phi_thue + hd.so_luong * dv.gia) as tong_tien 
from khach_hang k 
left join loai_khach l on l.ma_loai_khach = k.ma_loai_khach
left join hop_dong h on h.ma_khach_hang = k.ma_khach_hang
left join dich_vu d on d.ma_dich_vu = h.ma_dich_vu
left join hop_dong_chi_tiet hd on h.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dv on hd.ma_dich_vu_di_kem = dv.ma_dich_vu_di_kem;

-- TASK 6
# 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu  
# của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc 
from loai_dich_vu ldv join dich_vu dv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
join hop_dong hd on hd.ma_dich_vu = dv.ma_dich_vu where not (year(ngay_lam_hop_dong) = 2021 and month(ngay_lam_hop_dong) in (1,2,3));

-- TASK 7
# 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
# ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
# nhưng chưa từng được khách hàng đặt phòng trong năm 2021.

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
# 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
-- XUẤT RA HỌ TÊN KHÔNG TRÙNG NHAU THEO 3 CÁCH

-- CÁCH 1 
select ho_ten from khach_hang group by ho_ten;
-- CÁCH 2
select distinct ho_ten from khach_hang;
-- CÁCH 3
select ho_ten from khach_hang union select ho_ten from khach_hang;

-- TASK 9
# 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 
# thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

SELECT month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as so_luong_khach_hang from hop_dong where year (ngay_lam_hop_dong) =2021 group by thang order by month(ngay_lam_hop_dong);

-- TASK 10
# 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. 
# Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, 
# so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, sum(hdct.so_luong) as so_luong_dich_vu_di_kem
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem group by hd.ma_hop_dong order by  hd.ma_hop_dong;

-- TASK 11
# 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là 
# “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai, lk.ten_loai_khach, kh.dia_chi
from loai_khach lk
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Vinh" or kh.dia_chi = "Quảng Ngãi");

-- TASK 12
# 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), 
# ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
# tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

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
# 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. 
# (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

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
# 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
# Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

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


-- TASK 15
# 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, 
# dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, 
nv.so_dien_thoai, nv.dia_chi, count(nv.ma_nhan_vien) as so_lan_lap_hop_dong
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do 
where year(hd.ngay_lam_hop_dong) in (2020,2021) 
group by nv.ma_nhan_vien
having so_lan_lap_hop_dong <=3;

-- TASK 16
# 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

delete from nhan_vien nv 
where nv.ma_nhan_vien not in (select hop_dong.ma_nhan_vien 
from hop_dong
where year(hop_dong.ngay_lam_hop_dong) between 2019 and 2021);

-- TASK 17
# 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
# chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.

-- drop view w_khach_hang_can_cap_nhat;
-- Tạo view để lấy ra mã loại khách thỏa điều kiện đề bài (mã loại khách Diamond 2)
create view w_khach_hang_can_cap_nhat 
as select lk.ma_loai_khach, lk.ten_loai_khach, kh.ho_ten, hd.ngay_lam_hop_dong,
(dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as tong_tien_thanh_toan
from loai_khach lk
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong)=2021 and lk.ten_loai_khach ="Diamond"
having tong_tien_thanh_toan >500;

-- Chỉnh sửa mã loại khách khách của những khách hàng có mã loại khách nằm trong view
update khach_hang kh set kh.ma_loai_khach =1
where kh.ma_loai_khach in (select ma_loai_khach from w_khach_hang_can_cap_nhat);

-- TASK 18
# 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

create view khach_hang_can_xoa as
select hd.ma_khach_hang, hd.ngay_lam_hop_dong
from hop_dong hd
where hd.ma_khach_hang in (select hd.ma_khach_hang from hop_dong hd having (year(ngay_lam_hop_dong) < 2021))
and hd.ma_khach_hang not in (select hd.ma_khach_hang from hop_dong hd having (year(ngay_lam_hop_dong) >= 2021)) group by hd.ma_khach_hang;
-- set điều kiện cho ma_khach_hang bên hợp đồng từ not nut thành cho phép null
alter table hop_dong modify ma_khach_hang int;
-- xóa foreign key cũ và tạo foreign key mới với điều kiện chuyển về null khi bị xóa
alter table hop_dong drop foreign key hop_dong_ibfk_4;
alter table hop_dong add foreign key (ma_khach_hang) references khach_hang (ma_khach_hang) on delete set null ;
-- chừ thì xóa được rồi, bên hợp đồng vẫn không mất dữ liệu hợp đồng
delete from khach_hang kh where kh.ma_khach_hang in (select ma_khach_hang from khach_hang_can_xoa);

-- TASK 19
# 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

create view dich_vu_can_tang_gia as
select dvdk.ma_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, sum(so_luong) as so_lan_su_dung
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(ngay_lam_hop_dong) = 2020
group by dvdk.ma_dich_vu_di_kem
having so_lan_su_dung >= 10;

update dich_vu_di_kem
set gia=gia * 2
where ma_dich_vu_di_kem in (select ma_dich_vu_di_kem from dich_vu_can_tang_gia);

-- TASK 20
# 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
# thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.ma_nhan_vien id, nv.ho_ten, nv.em_mail,
nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
union all select kh.ma_khach_hang id, kh.ho_ten, kh.email,
kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh;

