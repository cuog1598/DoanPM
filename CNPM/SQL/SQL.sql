USE MASTER
GO
IF EXISTS (SELECT NAME FROM SYSDATABASES WHERE NAME='CNPM')
    DROP DATABASE CNPM
GO
CREATE DATABASE CNPM
ON(NAME='CNPM_DATA',FILENAME='E:\CNPM\SQL\CNPM.MDF')
LOG ON(NAME='CNPM_LOG',FILENAME='E:\CNPM\SQL\CNPM.LDF')
GO
USE CNPM



GO
create table loaiphong (
	maloai nvarchar(50) NOT NULL primary key,
	tenloai nvarchar(50) NULL,
	[day] nvarchar(50) NULL,
	
)
go

create table giaphong
(
	MaGia nvarchar(50) NOT NULL primary key,
	maloai nvarchar(50) NULL,
	GiaTien numeric(18, 0) NULL,
	constraint FK_gia FOREIGN KEY(maloai)references loaiphong(maloai),
)

go

create table phongtro
(
	mapt nvarchar(50) NOT NULL primary key,
	maloai nvarchar(50) NULL,
	mabanggia nvarchar(50) NULL,
	tenphong nvarchar(50) NULL,
	sltoida int NULL,
	tt bit NULL,
	trangthaithue bit NULL,
	songuoio int NULL,
	CONSTRAINT FK_loaip FOREIGN KEY(maloai)references loaiphong(maloai)
	)

create table dichvu
(
	madv int primary key,
	tendv nvarchar(200),
	gia int ,
	donvitinh varchar(11) default 'VND'
)

go
create table khachtro(
	makt nvarchar(50) NOT NULL primary key,
	mapt nvarchar(50) NULL,
	hoten nvarchar(50) NULL,
	cmnd nvarchar(50) NULL,
	gioitinh nvarchar(10) NULL,
	nghenghiep nvarchar(50) NULL,
	sdt nvarchar(50) NULL,
	TrangthaiTro bit NULL,
	chunha bit NULL,	
	CONSTRAINT FK_pt FOREIGN KEY(mapt)references phongtro(mapt)
)

go
create table traphong 
(
	matp int identity primary key,
	makt nvarchar(50) NOT NULL,
	hoten nvarchar(50) NULL,
	ngaytra smalldatetime ,
	CONSTRAINT FK_traphong FOREIGN KEY(makt)references khachtro(makt)
)


go

create table quanlythuephong 
(
	mathue int IDENTITY(1,1) NOT NULL primary key,
	makt nvarchar(50) NULL,
	ngaythu datetime NULL,
	tt bit NULL,
	tiencoc numeric(18, 0) NULL,
	CONSTRAINT thue FOREIGN KEY(makt)references khachtro(makt)
)

go

CREATE TABLE QLTHUTIEN(
	mathu int IDENTITY(1,1) NOT NULL,
	madv int NULL,
	mapt nvarchar(50) NULL,
	makt nvarchar(50) NULL,
	soluong int NULL,
	ngaythu datetime NULL,
	CONSTRAINT FK_kt FOREIGN KEY(makt)references khachtro(makt),
	CONSTRAINT FK_dv FOREIGN KEY(madv)references dichvu(madv),
	)








