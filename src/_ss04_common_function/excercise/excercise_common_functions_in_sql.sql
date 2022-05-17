use new_student_management;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.

select sub.sub_id, sub.sub_name, sub.credit, sub.`status` 
from `subject` sub
where sub.credit in (select max(credit) from subject) group by sub.sub_id;

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select sub.sub_id, sub.sub_name, sub.credit, sub.`status`, m.mark 
from `subject` sub
join mark m on sub.sub_id = m.sub_id
where m.mark in (select max(mark) from mark) group by sub.sub_id;

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.student_id, s.student_name, s.address, 
s.phone, s.status, s.class_id,
avg(m.mark) average_mark_of_student
from student s
join mark m on s.student_id = m.student_id group by s.student_id order by average_mark_of_student desc;