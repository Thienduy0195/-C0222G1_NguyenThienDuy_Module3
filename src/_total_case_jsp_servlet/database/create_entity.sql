-- drop database furama_resort_case_study;
create database furama_resort_case_study;
use furama_resort_case_study;

create table `position`(
	position_id int auto_increment primary key,
    position_name varchar(55)
    );
    
    create table `education_degree`(
	education_degree_id int auto_increment primary key,
    education_degree_name varchar(55)
    );
    
        create table `division`(
	division_id int auto_increment primary key,
    division_name varchar(55)
    );
    
            create table `role`(
	role_id int auto_increment primary key,
    role_name varchar(255)
    );
    
                create table `user`(
	user_name varchar(255) primary key,
    `password` varchar(255)
    );
    
                    create table `user_role`(
                    	role_id int,
                        user_name varchar(255),
    foreign key (role_id) references `role`(role_id),
    foreign key (user_name) references `user`(user_name)
    );
    
    
            create table `employee`(
	employee_id int auto_increment primary key,
    employee_name varchar(45) not null,
    employee_birthday date not null,
    employee_id_card varchar(45) not null,
    employee_salary double not null,
    employee_phone varchar(45) not null,
    employee_email varchar(45),
    employee_address varchar(155),
    position_id int,
	education_degree_id int,
	division_id int,
	user_name varchar(255),
    foreign key (position_id) references `position`(position_id) on delete set null,
    foreign key (education_degree_id) references `education_degree`(education_degree_id) on delete set null,
    foreign key (division_id) references `division`(division_id) on delete set null,
    foreign key (user_name) references `user`(user_name) on delete set null
    );
    
    create table customer_type(
    customer_type_id int auto_increment primary key,
    customer_type_name varchar(45)
    );
    
                create table `customer`(
	customer_id varchar(45) primary key,
    customer_type_id int,
    customer_name varchar(45) not null,
    customer_birthday date not null,
    customer_gender bit(1) not null,
    customer_id_card varchar(45) not null,
    customer_phone varchar(45) not null,
    customer_email varchar(45),
    customer_address varchar(155),
    foreign key (customer_type_id) references `customer_type`(customer_type_id) on delete set null
    );
    
	create table service_type(
    service_type_id int auto_increment primary key,
    service_type_name varchar(45)
    );
    
    	create table rent_type(
    rent_type_id int auto_increment primary key,
    rent_type_name varchar(45),
    rent_type_cost double
    );


	create table service(
	service_id varchar(45) primary key,
	service_name varchar(45) not null,
    service_area int,
    service_cost double not null,
    service_max_people int,
    rent_type_id int,
    service_type_id int,
    room_standard varchar(45),
    other_convenience_description varchar(45),
    pool_area double,
    number_of_floor int,
	foreign key (rent_type_id) references `rent_type`(rent_type_id) on delete set null,
	foreign key (service_type_id) references `service_type`(service_type_id) on delete set null
    );

                    create table `attach_service`(
	attach_service_id int auto_increment primary key,
    attach_service_name varchar(45) not null,
    attach_service_cost double not null,
    attach_service_unit int not null,
    attach_service_status varchar(45)
    );
    
                create table `contract`(
	contract_id int auto_increment primary key,
    contract_start_date datetime not null,
    contract_end_date datetime not null,
    contract_deposit double not null,
    contract_total_money double not null,
    employee_id int,
    customer_id varchar(45),
    service_id varchar(45),
    foreign key (employee_id) references `employee`(employee_id) on delete set null,
    foreign key (customer_id) references `customer`(customer_id) on delete set null,
    foreign key (service_id) references `service`(service_id) on delete set null
    );
    
    create table contract_detail(
    contract_detail_id int auto_increment primary key,
    contract_id int,
    attach_service_id int,
	quantity int not null,
	foreign key (contract_id) references `contract`(contract_id) on delete set null,
	foreign key (attach_service_id) references `attach_service`(attach_service_id) on delete set null
    );
    
    
    
    