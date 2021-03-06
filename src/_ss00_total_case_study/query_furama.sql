-- TASK 2 AND TASK 3
use furama_resort;
	
-- TASK 2
# 2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống 
# có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select *
from nhan_vien
where (ho_ten like 'h%' or ho_ten like 'k%'
        or ho_ten like 't%')
        and char_length(ho_ten) <= 15;
	        -- sửa lại hàm char_length
	
select * from nhan_vien where ho_ten like concat(convert("H%",binary),"%");
    
-- TASK 3
# 3.	Hiển thị thông tin của tất cả khách hàng 
# có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
	select * from khach_hang
	where (timestampdiff(year, ngay_sinh, current_date()) between 18 and 50)
	and (dia_chi = 'Đà Nẵng' or dia_chi = 'Quảng Trị');
    
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

select kh.ma_khach_hang, kh.ho_ten, lk.ten_loai_khach, hd.ma_hop_dong, dv.ten_dich_vu, 
hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, (dv.chi_phi_thue + hdct.so_luong * dvdk.gia) as tong_tien 
from khach_hang kh 
left join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
left join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem 
group by kh.ma_khach_hang;

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

create table thang (
thang int);

insert into thang values(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);
SELECT month(ngay_lam_hop_dong) as thang, count(month(ngay_lam_hop_dong)) as so_luong_khach_hang, th.thang
from thang th
left join hop_dong hd on 
where year (ngay_lam_hop_dong) =2021 group by thang order by month(ngay_lam_hop_dong);

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
# chuyển khóa ngoại ma_nhan_vien bên hợp đồng thành có thể null vì trước đó quy định not null
alter table hop_dong modify ma_nhan_vien int;
# khóa liên kết thông qua khóa ngoại
alter table hop_dong drop foreign key hop_dong_ibfk_1;
# Tạo lại khóa ngoại với thêm điều kiện delete thì set về null
alter table hop_dong add foreign key (ma_nhan_vien) references nhan_vien (ma_nhan_vien) on delete set null;

# Tiến hành xóa nhân viên mà không sợ ảnh hưởng đến hợp đồng
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
(dv.chi_phi_thue + coalesce ((hdct.so_luong*dvdk.gia),0)) as tong_tien_thanh_toan
from loai_khach lk
join khach_hang kh on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where year(hd.ngay_lam_hop_dong)=2021 and lk.ten_loai_khach ="Diamond"
having tong_tien_thanh_toan >500;

-- drop view w_khach_hang_can_cap_nhat ;

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

-- TASK 21
# 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
# và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.

update nhan_vien set dia_chi="Hải Châu" where ma_nhan_vien =5;
update nhan_vien set dia_chi="Hải Châu" where ma_nhan_vien =6;
update nhan_vien set dia_chi="Hải Châu" where ma_nhan_vien =7;

update hop_dong set ngay_lam_hop_dong = "2019-12-12 12:12:00" where ma_hop_dong =31;
update hop_dong set ngay_lam_hop_dong = "2019-12-12 12:12:00" where ma_hop_dong =32;

create view w_nhan_vien as 
select nv.ma_nhan_vien, nv.ho_ten, nv.ngay_sinh, nv.so_cmnd, nv.luong, nv.so_dien_thoai,
nv.em_mail, nv.dia_chi, hd.ngay_lam_hop_dong
from nhan_vien nv
join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where nv.dia_chi ="Hải Châu"
and (year(hd.ngay_lam_hop_dong) = 2019 and month(hd.ngay_lam_hop_dong)=12 and day(hd.ngay_lam_hop_dong)=12)
group by nv.ma_nhan_vien;


-- TASK 22
# 22. Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

update nhan_vien nv set dia_chi="Liên Chiểu" 
where nv.ma_nhan_vien in (select ma_nhan_vien from w_nhan_vien);
-- TASK 23
# 23. Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang (in id int)
begin
declare error_ms varchar(250);
delete from khach_hang where ma_khach_hang = id;
end //
delimiter ;
call sp_xoa_khach_hang(1);

# 24. Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
# với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
# với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.


delimiter //
create procedure sp_them_moi_hop_dong (
in nl_hop_dong datetime,
n_ket_thuc datetime,
t_dat_coc double,
ma_nv int,
ma_kh int,
ma_dv int
)
begin
if(ma_nv in (select ma_nhan_vien from nhan_vien)
and ma_kh in (select ma_khach_hang from khach_hang)
and ma_dv in (select ma_dich_vu from dich_vu))
then insert into hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) 
values (nl_hop_dong, n_ket_thuc, t_dat_coc, ma_nv, ma_kh, ma_dv);
else SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Thông tin nhập vào không tồn tại ở một trường nào đó, vui lòng kiểm tra lại!' ;
end if;
end //
delimiter ;

-- drop procedure sp_them_moi_hop_dong;


# gọi sp sp_them_moi_hop_dong, vì không có khách hàng id=99, nên sẽ ném ra MESSAGE TEXT=Thông tin nhập vào...
call sp_them_moi_hop_dong("2022-06-12 13:14:00",'2022-06-22 12:00:00',100,2,99,1);
# thêm mới thành công hợp đồng khi thỏa mãn điều kiện
call sp_them_moi_hop_dong("2022-02-12 13:14:00",'2022-02-22 12:00:00',100,2,9,1);

