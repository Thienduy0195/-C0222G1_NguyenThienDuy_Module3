-- create DATABASE `quan_ly_vat_tu`;
-- use `quan_ly_vat_tu`;

CREATE TABLE `vat_tu` (
    `ma_vat_tu` INT PRIMARY KEY,
    `ten_vat_tu` VARCHAR(100)
);

CREATE TABLE `phieu_xuat` (
    `so_phieu_xuat` INT PRIMARY KEY,
    `ngay_xuat` DATE
);

CREATE TABLE `chi_tiet_phieu_xuat` (
    `so_phieu_xuat` INT NOT NULL,
    `ma_vat_tu` INT NOT NULL,
    `don_gia_xuat` DOUBLE,
    `so_luong_xuat` INT,
    PRIMARY KEY (`so_phieu_xuat` , `ma_vat_tu`),
    FOREIGN KEY (`so_phieu_xuat`)
        REFERENCES `phieu_xuat` (`so_phieu_xuat`),
    FOREIGN KEY (`ma_vat_tu`)
        REFERENCES `vat_tu` (`ma_vat_tu`)
);


CREATE TABLE `don_hang` (
    `so_don_hang` INT PRIMARY KEY,
    `ngay_don_hang` DATE
);

CREATE TABLE `chi_tiet_don_hang` (
    `so_don_hang` INT,
    `ma_vat_tu` INT,
    PRIMARY KEY (`so_don_hang` , `ma_vat_tu`),
    FOREIGN KEY (`so_don_hang`)
        REFERENCES `don_hang` (`so_don_hang`),
    FOREIGN KEY (`ma_vat_tu`)
        REFERENCES `vat_tu` (`ma_vat_tu`)
);

CREATE TABLE `nha_cung_cap` (
    `ma_nha_cung_cap` INT PRIMARY KEY,
    `ten_nha_cung_cap` VARCHAR(100) NOT NULL,
    `dia_chi` VARCHAR(255),
    `so_dien_thoai` VARCHAR(20) NOT NULL
);

CREATE TABLE `cung_cap` (
    `ma_nha_cung_cap` INT NOT NULL,
    `so_don_hang` INT NOT NULL,
    PRIMARY KEY (`ma_nha_cung_cap` , `so_don_hang`),
    FOREIGN KEY (`so_don_hang`)
        REFERENCES `don_hang` (`so_don_hang`),
    FOREIGN KEY (`ma_nha_cung_cap`)
        REFERENCES `nha_cung_cap` (`ma_nha_cung_cap`)
);

CREATE TABLE `phieu_nhap` (
    `so_phieu_nhap` INT PRIMARY KEY,
    `ngay_nhap` DATE
);


CREATE TABLE `chi_tiet_phieu_nhap` (
    `so_phieu_nhap` INT NOT NULL,
    `ma_vat_tu` INT NOT NULL,
    `don_gia_nhap` DOUBLE,
    `so_luong_nhap` INT,
        PRIMARY KEY (`so_phieu_nhap` , `ma_vat_tu`),
    FOREIGN KEY (`so_phieu_nhap`)
        REFERENCES `phieu_nhap` (`so_phieu_nhap`),
    FOREIGN KEY (`ma_vat_tu`)
        REFERENCES `vat_tu` (`ma_vat_tu`)
);