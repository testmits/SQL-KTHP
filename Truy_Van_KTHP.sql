select * from Bang_lai
select * from Tuyen_duong
select * from Tai_xe
select * from Hanh_trinh
select * from Nhan_vien
select * from Ve_xe
select * from Thong_tin_xe

--5. Truy vấn trên 1 bảng sử dụng biểu thức logic, so sánh với like, between...and...
--1. Hiển thị nhân viên có từ Anh trong Họ tên
select * from Nhan_vien
where Ho_ten like N'%Anh%'

--2. Hiển thị nhân viên có giới tính là nam
select * from Nhan_vien
where Gioi_tinh = N'Nam'

--3. Hiển thị giá vé từ 100000 VND đến 700000 VND
select * from Ve_xe
where So_tien between 100000 and 700000

--4. Hiển thị nhân viên có tên trong bảng Hành trình
select * from Nhan_vien
where Ma_nhan_vien = any (select Ma_nhan_vien from Hanh_trinh)

--5. Hiển thị tên nhà xe có chữ cái đầu từ A đến H
select * from Thong_tin_xe
where Ten_xe like '[A-H]%'

--6. Hiển thị tên tài xé không có ký đầu từ N - Z
select * from Tai_xe
where Ho_ten like '[^N-Z]%'

--7. Hiển thị xe không có màu trắng
select * from Thong_tin_xe
where Mau not like N'%Trắng%'

--8. Hiển thị nhân viên có lương từ dưới 15000000 VND và từ trên 50000000 VND
select * from Nhan_vien
where Luong <= 15000000 or Luong >= 50000000

--9. Hiển thị nhân viên không có địa chỉ ở Hà Nội
select * from Nhan_vien
where not (Dia_chi = N'Hà Nội')

--10. Hiển thị giá vé trung bình, cao nhất và thấp nhất
select
	avg(So_tien) as N'Giá trung bình', 
	max(So_tien) as N'Giá cao nhất',
	min(So_tien) as N'Giá thấp nhất'
from Ve_xe

--6. Truy vấn trên nhiều bảng sử dụng group by, having, order by, sử dụng hàm thống kê, sử dụng truy vấn lồng nhau.
--1. Hiển thị giá vé trên 200000, sắp xếp theo thứ tự giảm dần
select * from Ve_xe
where So_tien > 200000
order by So_tien desc

--2. Hiển thị tuyến đường và giá vé với điều kiện giá vé phải lớn hơn 300000 VND theo thứ tự tăng dần
select B.Ten_tuyen as [Tên tuyến], A.So_tien as [Số tiền]
from Ve_xe A, Tuyen_duong B
where A.Ma_tuyen = B.Ma_tuyen and A.So_tien > 300000
order by A.So_tien asc

--3. Hiển thị các tuyến có số lần là 2 trong bảng Hành trình
select B.Ten_tuyen as N'Tên tuyến', count(*) as N'Số tuyến'
from Hanh_trinh A join Tuyen_duong B on A.Ma_tuyen = B.Ma_tuyen
group by B.Ten_tuyen
having count(*) = 2

--4. Hiển thị họ tên tài xế, tên tuyến họ lái và loại bằng của họ.
select C.Ho_ten as [Họ và tên], B.Ten_tuyen as [Tên tuyến], D.Hang as [Hạng] 
from Hanh_trinh A, Tuyen_duong B, Tai_xe C, Bang_lai D
where A.Ma_tuyen = B.Ma_tuyen and A.Ma_tai_xe = C.Ma_tai_xe and C.Ma_bang_lai = D.Ma_bang_lai

--5. Hiển thị họ tên và tuổi của tài xế trên 40 theo tứ tự tăng dần
select Ho_ten as N'Họ tên', (YEAR(GETDATE()) - YEAR(Ngay_Sinh)) as N'Tuổi' from Tai_xe
where (YEAR(GETDATE()) - YEAR(Ngay_Sinh)) > 40 
order by (YEAR(GETDATE()) - YEAR(Ngay_Sinh)) asc

--6. Đếm số loại lương theo thứ tự giảm dần
select Luong as N'Tiền lương', count(*) as N'Số người được hưởng' from Tai_xe
group by Luong
order by Luong desc

--7. In ra nhân viên có chức vụ giám sát và giám sát bao nhiêu xe theo thứ tự giảm dần
select B.Ho_ten as N'Họ tên', count(A.Ma_xe) as N'Số xe giám sát' 
from Hanh_trinh A right join Nhan_vien B on A.Ma_nhan_vien = B.Ma_nhan_vien
where B.Chuc_vu = N'Giám sát'
group by B.Ho_ten
order by count(A.Ma_xe) desc

--8. Hiển ra người có lương thấp nhất và cao nhất
 select * from Tai_xe
 where Luong in (select top(1) Luong from Tai_xe group by Luong  order by Luong asc) 
 union 
 select * from Tai_xe
 where Luong in (select top (1) Luong from Tai_xe group by Luong order by Luong desc)

--9. Hiển thị tên tuyến, chiều dài, giá vé theo thứ tự tăng dần
select B.Ten_tuyen as N'Tên Tuyến', B.Chieu_dai as N'Chiều dài', A.So_tien as N'Giá vé' 
from Ve_xe A, Tuyen_duong B
where A.Ma_tuyen = B.Ma_tuyen
order by b.Chieu_dai asc

--10. Hiển thị số ngày sinh của tài xế và đếm số người
select day(Ngay_sinh) as [Ngày sinh], count(*) as [Số tài xế] from Tai_xe group by day(Ngay_sinh)

--7. View, procedure, trigger.
----View
--1. Tạo view có tên tuyến, chiều dài và giá vé
create view v1
as
	select A.Ten_tuyen as N'Tên tuyến', A.Chieu_dai as N'Chiều dài', B.So_tien as N'Giá vé' 
	from Tuyen_duong A, Ve_xe B
	where A.Ma_tuyen = B.Ma_tuyen

select * from v1

--2. Tạo view có tên xe, biến số, màu xe và tên tuyến xe đó đi
create view Cac_tuyen
as
	select A.Ten_xe as N'Tên xe', A.Bien_so as N'Biến số', A.Mau as N'Màu', B.Ten_tuyen as N'Tên tuyến' 
	from Thong_tin_xe A, Tuyen_duong B
	where A.Ma_tuyen = B.Ma_tuyen

select * from Cac_tuyen

--3. Hiển thị các thông tin cần thiết lịch trình trong ngày 29/05/2022
create view Lich_trinh
as
	select B.Ten_xe as N'Tên xe', D.Ten_tuyen N'Tên tuyến', A.Gio_di as N'Giờ đi', A.Ngay_di as N'Ngày đi', 
		A.Gio_den as N'Giờ đến', A.Ngay_den as N'Ngày đến', C.So_tien as N'Giá vé'
	from Hanh_trinh A, Thong_tin_xe B, Ve_xe C, Tuyen_duong D	
	where A.Ma_xe = B.Ma_xe and A.Ma_ve = C.Ma_ve and A.Ma_tuyen = D.Ma_tuyen and Ngay_di = '20220529'

select * from Lich_trinh

----procedure
---k tham số
--1. In ra thông tin nhân viên có lương cao nhất
create procedure NV_top_1
as
begin
	select top 1 * from Nhan_vien order by Luong desc
end

execute NV_top_1

--2. Hiển thị ra tên tài xế và ngày còn hạn của bằng
create procedure Han_bang
as
begin
	select A.Ho_ten as N'Họ tên', 
	((day(B.Ngay_het_han) - day(getdate())) + (month(B.Ngay_het_han) - month(getdate()))*30  
	+ (year(B.Ngay_het_han) - year(getdate()))*365) as N'Số ngày còn hạn' 
	from Tai_xe A, Bang_lai B
	where A.Ma_bang_lai = B.Ma_bang_lai
end

execute Han_bang

---Có tham số
--1. In ra tài xế với tham số truyền vào là mã nhân viên
create procedure MTX
@mtx nvarchar(250)
as
begin
	select * from Tai_xe 
	where Ma_tai_xe = @mtx
end

exec MTX MTX2494

/*
	2.	Hiển thị tên xe, biển số, số ghế; với số ghế là tham số đầu vào 
		Kết quả đếm xe là đầu ra của biến countXe
*/
create procedure sp_So_ghe
@soGhe int,
@countXe int output
as
begin
	select  A.Ten_xe as N'Tên xe', A.Bien_so as N'Biển số', B.So_ghe as N'Số ghế'
	from Thong_tin_xe A inner join Ve_xe B on A.Ma_xe = B.Ma_xe
	where B.So_ghe > @soGhe
	select @countXe = @@ROWCOUNT
end

declare @count int
exec sp_So_ghe 40, @count output
select @count as N'Tổng số xe'

----trigger.
--Tạo 1 insert trigger nhắm đảm bảo giá trị cột So_tien ở bảng Ve_xe khi chèn vào luôn lớn hơn 40000 VND
create trigger CheckGiaVeOnInsert
on Ve_xe 
for Insert 
as 
	begin 
		if exists(select * from inserted where So_tien < 40000 )
		begin
			print N'Không thể nhỏ hơn 40000 VND!';
			rollback transaction;
		end
	end
go

insert into Ve_xe values ('MV31113', 'MT39849', 'MX45943', 16, 30000)

-- Tạo 1 trigger không được xóa nhân viên sách có lương dưới 15000000 VND
create trigger CheckLuongOnDelete
on Nhan_vien
for delete 
as
begin
	declare @luong int
	select @luong = Luong from Nhan_vien

	if (@luong < 15000000)
	begin
		print N'Không được xóa sách nhân viên có lương dưới 15 triệu VND!'
		rollback transaction
	end
end

delete Nhan_vien where Ma_nhan_vien = 'NV33182'

--Tạo 1 update trigger nhắm đảm bảo giá trị cột Luong ở bảng Tai_xe khi chèn vào luôn lớn hơn giá trị cũ
create trigger CheckLuongOnUpdate
on Tai_xe
for Update
as 
	begin 
		if exists(select * from inserted A inner join deleted B
		on A.Ma_tai_xe = B.Ma_tai_xe where B.Luong > A.Luong )
		begin
			print N'Lương mới phải hơn lương cũ!';
			rollback transaction;
		end
	end
go

update Tai_xe set Luong = 5000000 where Ho_ten like N'Lại Văn Nam'
drop table Tai_xe
select * from Thong_tin_xe
select * from Ve_xe
select * from Tuyen_duong
select * from Hanh_trinh
select * from Tai_xe
select * from Bang_lai
select * from Nhan_vien