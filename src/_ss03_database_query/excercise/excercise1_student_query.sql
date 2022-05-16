use new_student_management;

-- YC_1.hiển thị học sinh có tên bắt đầu bằng chữ "h"
select * from student where `student_name` like '% % H%' or `student_name` like '% % % H%';

-- YC_2.hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12
select * from class where month(start_date) =12;

-- YC_3.Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select * from `subject` where credit between 3 and 5;

-- YC_4.Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student set class_id=2 where student_name like "%hung";

-- YC_5.Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.
select s.student_name, sub.sub_name, m.mark from mark m join student s on s.student_id = m.student_id join subject sub on m.sub_id = sub.sub_id order by m.mark desc, s.student_name asc;