use new_student_management;
INSERT INTO Class (class_name, start_date, `status`)
VALUES ('C0222G1', '2022-05-20', 1),
('C0222G2', '2022-05-15', 1),
('C0222G3', '2022-06-15', 1);

INSERT INTO Student (student_name, address, phone, `status`, class_id)
VALUES ('Nguyen Van Hung', 'Ha Noi', '0912113113', 1, 1),
('Pham Thi Hoa', 'Hai phong',0916568697, 1, 1),
('Nguyen Duc Manh', 'Thai Nguyen', '0905656924', 0, 3),
('Huynh Kim Hieu', 'Quang Nam', '0935689898', 1, 3),
('Nguyen Dinh Luan', 'Quy Nhon', '0965636365', 1, 2),
('Tran Ho Quoc Trung', 'Da Nang', '0906214547', 0, 2),
('Nguyen Duong Trung Kien', 'Quang Nam', '0965659845', 0, 2),
('Le Huy Hoang', 'Quang Ngai', '0979548548', 0, 2),
('Tran Xuan Truong', 'Da Nang', '0989548569', 1, 3),
('Tran Van Khanh', 'Quang Binh', '0978564658', 1, 1),
('Nguyen Hoang Hao', 'Da Nang', '0965695632', 0, 2);

INSERT INTO Subject
VALUES (1, 'MATH', 5, 1),
       (2, 'CHEMICTRY', 6, 1),
       (3, 'TECHNOLOGY', 5, 1),
       (4, 'PHYSICALY', 10, 1);
       
INSERT INTO Mark (sub_id, student_id, mark, exam_times)
VALUES (1, 1, 8, 1),
       (2, 2, 9, 2),
       (3, 2, 10, 2),
       (4, 4, 10, 2);