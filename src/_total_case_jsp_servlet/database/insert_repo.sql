use furama_resort_case_study;
-- select * from customer;
-- insert into customer (customer_type_id, customer_name, customer_birthday, customer_gender, customer_id_card, customer_phone, customer_email, customer_address)
-- values (1, 'Trần Văn Khánh', '1995-02-01', 0, '123111222', '0798584942', 'khanhtran@gmail.com', 'Quảng Bình');

-- select * from customer where customer_id='KH-0002';

-- update customer set customer_type_id = 2, customer_name = 'Nguyễn Thiên Duy', customer_birthday= '1995-01-01', customer_gender=1, customer_id_card=205839140, customer_phone ='0917579123', customer_email ='thienduy0195@gmail.com', customer_address='Quảng Nam' where customer_id = 'KH-0002';

-- select * from customer where `customer_name` like '%k%';

-- select * from employee;

-- insert into employee (employee_name, employee_birthday, employee_id_card, employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id, user_name)
-- values ('Nguyễn Quang Phúc','1998-06-29','111222333',500,'0123123123','quangphuc@gmail.com','Đà Nẵng',5,4,4,'quangphuc@gmail.com');

-- select * from employee where employee_id= 1;

-- update employee set employee_name = 'David Villa', employee_birthday = '1999-02-02', employee_id_card = '214562365', 
-- employee_salary = 5000, employee_phone = '0906569589', employee_email = 'villa@gmail.com', employee_address = 'Espanol', 
-- position_id = 2, education_degree_id = 2, division_id =2 where employee_id = 2;

-- select * from division;
-- select * from position;
-- select * from education_degree;

-- select * from customer_type;

select * from service;
-- insert into service values ('DV-0123', 'Room1', 50, 50, 5, 1, 2, 'Luxury', 'Hot rock Spa', 30, 5);
-- select * from service where service_id='DV-0123';
-- update service set service_name='House4', service_area=55, service_cost=65, service_max_people=6, rent_type_id=3, service_type_id=4, room_standard='Premium', other_convenience_description='Free Breakfast, Massage', pool_area =50, number_of_floor=6 where service_id='DV-0131';
--     delete from service where service_id = ?;
--     select * from service where `service_name` like ?;
select * from service_type;
select * from rent_type;

delete from service where service_id = 'DV-0123';