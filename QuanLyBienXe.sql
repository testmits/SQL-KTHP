create database QuanLyBienXe
go
use QuanLyBienXe
go
---------------CREATE TABLE---------------
create table Tuyen_duong
(	Ma_tuyen varchar(50) not null,
	Ten_tuyen nvarchar(250) not null,
	Chieu_dai int not null,
	CONSTRAINT Tuyen_duong_pk PRIMARY KEY (Ma_tuyen)
);
go

create table Thong_tin_xe 
(	Ma_xe varchar(50) not null,
	Ten_xe nvarchar(250) not null,
	Ma_tuyen varchar(50) not null,
	Bien_so nvarchar(250) not null,
	Mau nvarchar(250),
	CONSTRAINT Thong_tin_xe_pk PRIMARY KEY (Ma_xe)
);
go

create table Ve_xe
(	Ma_ve varchar(50) not null,
	Ma_tuyen varchar(50) not null,
	Ma_xe varchar(50) not null,
	So_ghe int not null,
	So_tien int not null,
	CONSTRAINT Ve_xe_pk PRIMARY KEY (Ma_ve)
);
go

create table Hanh_trinh
(	Ma_hanh_trinh varchar(50) not null,
	Ma_tuyen varchar(50) not null,
	Ma_ve varchar(50) not null,
	Ma_xe varchar(50) not null,
	Ma_tai_xe varchar(50) not null,
	Ma_nhan_vien varchar(50) not null,
	Gio_di time (0) not null,
	Ngay_di date not null,
	Gio_den time (0) not null,
	Ngay_den date not null,
	CONSTRAINT Hanh_trinh_pk PRIMARY KEY (Ma_hanh_trinh)
);
go

create table Nhan_vien 
(	Ma_nhan_vien varchar(50) not null,
	Ho_ten nvarchar(250) not null,
	Ngay_sinh date,
	Gioi_tinh nvarchar(250),
	Dia_chi nvarchar(250),
	Chuc_vu nvarchar(250) not null,
	Luong int not null,
	CONSTRAINT Nhan_vien_pk PRIMARY KEY (Ma_nhan_vien)
);
go

create table Tai_xe
(	Ma_tai_xe varchar(50) not null,
	Ho_ten nvarchar(250) not null,
	Ngay_sinh date,
	Gioi_tinh nvarchar(250),
	Dia_chi nvarchar(250),
	Luong int not null,
	Ma_bang_lai varchar(50) not null,
	CONSTRAINT Tai_xe_pk PRIMARY KEY (Ma_tai_xe)
);
go

create table Bang_lai
(	Ma_bang_lai varchar(50) not null,
	Hang varchar(50) not null,
	Noi_cap nvarchar(250) not null,
	Ngay_cap date not null,
	Ngay_het_han date not null,
	CONSTRAINT Bang_lai_pk PRIMARY KEY (Ma_bang_lai)
);
go

---------------------------INSERT INTO-------------------------------------
insert into Tuyen_duong values
	('MT12749', N'Thái Bình', 130),
	('MT23402', N'Hải Phòng', 122),
	('MT38572', N'Thanh Hóa', 170),
	('MT30534', N'Quảng Ninh', 153),
	('MT39572', N'Lào Cai', 320),
	('MT40684', N'Hà Giang', 300),
	('MT59274', N'Nam Định', 120),
	('MT06839', N'Bắc Giang', 50),
	('MT05939', N'Huế', 680),
	('MT04829', N'Đà Nẵng', 788),
	('MT48294', N'Quy Nhơn', 1008),
	('MT94729', N'Gia Lai', 1100),
	('MT12595', N'TP.HCM', 1650),
	('MT20506', N'Đồng Nai', 1670),
	('MT10364', N'Bạc Liêu', 1990)
go

insert into Thong_tin_xe values
	('MX27942', N'Mạnh La', 'MT12749', '17A-8465', N'Trắng'),
	('MX48205', N'Thành Tín', 'MT23402', '29B-3452', N'Trắng vàng'),
	('MX49284', N'Hoàng Trung', 'MT94729', '30D1-12030', N'Xám'),
	('MX23994', N'Mạnh La', 'MT12749', '17B8-2411', N'Trắng xanh'),
	('MX39539', N'Thanh Tùng', 'MT59274', '18B-3840', N'Vàng cam'),
	('MX20484', N'Hưng Thành', 'MT05939', '30A-16930', N'Vàng'),
	('MX58654', N'Cúc Tùng', 'MT04829', '43C-2484', N'Đỏ'),
	('MX20482', N'Huệ Nghĩa', 'MT12595', '67B-0003.77', N'Đỏ đen'),
	('MX39840', N'Hoàng Long', 'MT12595', '30C-10343', N'Trắng'),
	('MX29420', N'Hoàng Vũ', 'MT20506', '60A-20291', N'Hồng'),
	('MX11927', N'Quỳnh Thanh', 'MT06839', '98A-28499', N'Đen'),
	('MX28029', N'Vân Tuyến', 'MT20506', '37B-02064', N'Đỏ'),
	('MX24292', N'Trung Nghĩa', 'MT10364', '94D-10206', 'Xanh dương'),
	('MX29484', N'Minh Quang', 'MT48294', '32D-193100', N'Tím'),
	('MX24034', N'Quang Tuyến', 'MT40684', '23B-001.52', N'Xanh')
go

insert into Ve_xe values
	('MV30483', 'MT12749', 'MX27942', 29, 80000),
	('MV29840', 'MT40684', 'MX24034', 16, 250000),
	('MV28403', 'MT48294', 'MX29484', 50, 650000),
	('MV20485', 'MT10364', 'MX24292', 45, 1200000),
	('MV30485', 'MT20506', 'MX28029', 16, 900000),
	('MV03949', 'MT06839', 'MX11927', 16, 60000),
	('MV94395', 'MT20506', 'MX29420', 40, 750000),
	('MV29489', 'MT12595', 'MX39840', 30, 950000),
	('MV29484', 'MT12595', 'MX20482', 45, 890000),
	('MV30995', 'MT04829', 'MX58654', 50, 500000),
	('MV39449', 'MT05939', 'MX20484', 45, 440000),
	('MV39859', 'MT23402', 'MX48205', 29, 90000),
	('MV39455', 'MT94729', 'MX49284', 45, 800000),
	('MV39574', 'MT12749', 'MX23994', 29, 85000),
	('MV39585', 'MT59274', 'MX39539', 45, 75000)
go

insert into Hanh_trinh values
	('MHT8420', 'MT12749', 'MV30483', 'MX27942', 'MTX2494', 'NV00838', '09:30:00', '20220530', '11:30:00', '20220530'),
	('MHT1385', 'MT40684', 'MV29840', 'MX24034', 'MTX2494', 'NV83920', '06:00:00', '20220601', '11:30:00', '20220601'),
	('MHT1048', 'MT48294', 'MV28403', 'MX29484', 'MTX1939', 'NV49371', '23:00:00', '20220601', '06:00:00', '20220603'),
	('MHT3205', 'MT10364', 'MV20485', 'MX24292', 'MTX2949', 'NV30580', '22:00:00', '20220601', '22:00:00', '20220603'),
	('MHT4920', 'MT20506', 'MV30485', 'MX28029', 'MTX1024', 'NV19505', '18:00:00', '20220528', '06:00:00', '20220530'),
	('MHT7953', 'MT06839', 'MV03949', 'MX11927', 'MTX9401', 'NV30580', '13:00:00', '20220529', '14:00:00', '20220529'),
	('MHT8300', 'MT20506', 'MV94395', 'MX29420', 'MTX4204', 'NV83920', '10:00:00', '20220527', '04:00:00', '20220529'),
	('MHT1952', 'MT12595', 'MV29489', 'MX39840', 'MTX2952', 'NV49371', '11:00:00', '20220601', '06:00:00', '20220603'),
	('MHT8503', 'MT12595', 'MV29484', 'MX20482', 'MTX7268', 'NV00838', '22:00:00', '20220601', '11:00:00', '20220603'),
	('MHT7491', 'MT04829', 'MV30995', 'MX58654', 'MTX9375', 'NV19505', '18:30:00', '20220529', '18:30:00', '20220530'),
	('MHT2058', 'MT05939', 'MV39449', 'MX20484', 'MTX1206', 'NV83920', '00:00:00', '20220529', '08:30:00', '20220530'),
	('MHT9054', 'MT23402', 'MV39859', 'MX48205', 'MTX8013', 'NV19505', '14:45:00', '20220602', '16:45:00', '20220602'),
	('MHT2570', 'MT94729', 'MV39455', 'MX49284', 'MTX1099', 'NV00838', '18:00:00', '20220602', '23:45:00', '20220603'),
	('MHT6205', 'MT12749', 'MV39574', 'MX23994', 'MTX0527', 'NV83920', '19:00:00', '20220602', '20:45:00', '20220602'),
	('MHT5729', 'MT59274', 'MV39585', 'MX39539', 'MTX3195', 'NV49371', '16:00:00', '20220601', '17:45:00', '20220601')
go

insert into Nhan_vien values
	('NV29484', N'Phạm Hoàng Nam', '19700515', N'Nam', N'Hà Nội', N'Giám đốc', 80000000),
	('NV29494', N'Đặng Kim Dung', '19740112', N'Nữ', N'Thái Nguyên', N'P.Giám đốc', 50000000),
	('NV39585', N'Phạm Hoàng Yến', '19900430', N'Nữ', N'Hà Giang', N'Thơ ký', 20000000),
	('NV39507', N'Phạm Hạnh Chi', '19820510', N'Nữ', N'Hà Nội', N'Quản lý', 40000000),
	('NV30580', N'Triệu Việt Hoàng', '19870923', N'Nam', N'Thái Nguyên', N'Giám sát', 17000000),
	('NV24948', N'Hoàng Văn Khang', '19860313', N'Nam', N'Lai Châu', N'Giám sát', 17500000),
	('NV83920', N'Nguyên Trung Long', '19770225', N'Nam', N'Yên Bái', N'Giám sát', 17000000),
	('NV19505', N'Đỗ Diệu Anh', '19880117', N'Nữ', N'Lào Cai', N'Giám sát', 16500000),
	('NV00838', N'Hoàng Thành Chung', '19860303', N'Nam', N'Cao Bằng', N'Giám sát', 18000000),
	('NV49371', N'Bùi Khánh Vân', '19900926', N'Nữ', N'Hà Nội', N'Giám sát', 17200000),
	('NV53685', N'Cao Thị Huệ', '19891012', N'Nữ', N'Nam Định', N'Thu ngân', 12000000),
	('NV92009', N'Đào Thị Phương', '19911101', N'Nữ', N'Quảng Ninh', N'Thu ngân', 12500000),
	('NV12584', N'Hoàng Ngọc Anh', '19930215', N'Nữ', N'Phú Thọ', N'Thu ngân', 12000000),
	('NV35802', N'Lại Minh Châu', '19780911', N'Nam', N'Hà Nội', N'Bảo vệ', 9000000),
	('NV33182', N'Nguyễn Anh Lam', '19770321', N'Nam', N'Thanh Hóa', N'Bảo vệ', 9000000)
go

insert into Tai_xe values
	('MTX2494', N'Triệu Việt Hoàng', '19860702', N'Nam', N'Ninh Bình', 7000000, 'MB1'),
	('MTX9394', N'Hoàng Thanh Tùng', '19801012', N'Nam', N'Bắc Kạn', 7000000, 'MB2'),
	('MTX1939', N'Nguyễn Văn Thanh', '19720111', N'Nam', N'Thái Nguyên', 12000000, 'MB3'),
	('MTX2949', N'Cao An Nam', '19770908', N'Nam', N'Quảng Ninh', 12000000, 'MB4'),
	('MTX1024', N'Lại Văn Nam', '19711201', N'Nam', N'Cao Bằng', 7500000, 'MB5'),
	('MTX9401', N'Đỗ Bình An', '19901019', N'Nam', N'Phú Thọ', 7800000, 'MB6'),
	('MTX4204', N'Vũ Trung Thành', '19760925', N'Nam', N'Hải Phòng', 13000000, 'MB7'),
	('MTX2952', N'Phan Văn Tài', '19741205', N'Nam', N'Hà Nội', 8000000, 'MB8'),
	('MTX7268', N'Phùng Kim Long', '19790822', N'Nam', N'Nam Định', 7100000, 'MB9'),
	('MTX9375', N'Bùi Văn Doanh', '19880630', N'Nam', N'Thái Bình', 13500000, 'MB10'),
	('MTX1206', N'Nguyễn Thanh Tiến', '19810528', N'Nam', N'Điện Biên', 12500000, 'MB11'),
	('MTX8013', N'Đỗ Hoàng Minh', '19850719', N'Nam', N'Lai Châu', 8100000, 'MB12'),
	('MTX1099', N'Nguyễn Xuân Trường', '19891201', N'Nam', N'Hà Nội', 12900000, 'MB13'),
	('MTX0527', N'Phạm Bảo An', '19780416', N'Nam', N'Bắc Giang', 7700000, 'MB14'),
	('MTX3195', N'Nguyễn Văn Công', '19731226', N'Nam', N'Lạng Sơn', 13000000, 'MB15')
go

insert into Bang_lai values
	('MB1', 'D', N'Hà Nội', '20180510', '20230510'),
	('MB2', 'D', N'Hải Phòng', '20191125', '20241125'),
	('MB3', 'E', N'Thái Bình', '20200812', '20250812'),
	('MB4', 'E', N'Hà Nội', '20171225', '20221225'),
	('MB5', 'D', N'Thái Nguyên', '20210105', '20260105'),
	('MB6', 'D', N'Quảng Ninh', '20191028', '20241028'),
	('MB7', 'E', N'Hà Nội', '20201129', '20251129'),
	('MB8', 'D', N'Yên Bái', '20220315', '20270315'),
	('MB9', 'E', N'Hà Nội', '20171230', '20221230'),
	('MB10', 'E', N'Hà Nội', '20211201', '20261201'),
	('MB11', 'E', N'Bắc Ninh', '20190228', '20240228'),
	('MB12', 'D', N'Thái Bình', '20211212', '20261212'),
	('MB13', 'E', N'Thái Nguyên', '20200718', '20250718'),
	('MB14', 'D', N'Nam Định', '20190329', '20240329'),
	('MB15', 'E', N'Hà Nội', '20211019', '20261019')
go