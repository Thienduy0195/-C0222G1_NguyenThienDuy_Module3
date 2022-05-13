CREATE DATABASE `quan_ly_diem_thi`;
USE `quan_ly_diem_thi`;
CREATE TABLE `hoc_sinh` (
    `ma_hoc_sinh` VARCHAR(20) PRIMARY KEY,
    `ten_hoc_sinh` VARCHAR(50),
    `ngay_sinh` DATE,
    `lop_hoc` VARCHAR(45),
    `gioi_tinh` VARCHAR(20)
);

CREATE TABLE `mon_hoc` (
    `ma_mon_hoc` VARCHAR(20) PRIMARY KEY,
    `ten_mon_hoc` VARCHAR(50)
);

CREATE TABLE `bang_diem` (
    `ma_hoc_sinh` VARCHAR(20),
    `ma_mon_hoc` VARCHAR(20),
    `diem_thi` INT(20),
    `ngay_kiem_tra` DATE,
    PRIMARY KEY (`ma_hoc_sinh` , `ma_mon_hoc`),
    FOREIGN KEY (`ma_hoc_sinh`)
        REFERENCES `hoc_sinh` (`ma_hoc_sinh`),
    FOREIGN KEY (`ma_mon_hoc`)
        REFERENCES `mon_hoc` (`ma_mon_hoc`)
);

CREATE TABLE `giao_vien` (
    `ma_giao_vien` VARCHAR(20) PRIMARY KEY,
    `ten_giao_vien` VARCHAR(50),
    `so_dien_thoai` VARCHAR(10)
);

ALTER TABLE `mon_hoc` ADD `ma_gv` VARCHAR (20);
ALTER TABLE `mon_hoc` ADD CONSTRAINT  `fk_ma_gv` FOREIGN KEY (`ma_giao_vien`) REFERENCES `giao_vien`(`ma_giao_vien`);

