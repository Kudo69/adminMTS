Create database MotoServ;
Use MotoServ;

CREATE TABLE booking (
   ID int NOT NULL auto_increment,
   UID int NOT NULL,
   TENKH varchar(50), 
   Email varchar(50), 
   SDT varchar(50),
   Diachi varchar(50),
   Dichvu varchar(50),
   Ngayhen date,
   Yeucau varchar(50),
   Primary key (ID)
);

CREATE TABLE cthddv (
   MAHD int NOT NULL,
   MADV int NOT NULL,
   TENDV varchar(50),
   Gia float,
   primary key (MAHD,MADV)
);

CREATE TABLE cthdsp (
   MAHD int NOT NULL,
   MASP int NOT NULL,
   TENSP varchar(50),
   SL int DEFAULT NULL,
   Gia float DEFAULT NULL,
   primary key (MAHD, MASP)
);

CREATE TABLE dichvu (
   MADV int NOT NULL auto_increment,
   UID int NOT NULL,
   TenDV varchar(50),
   Gia float DEFAULT NULL,
   primary key (MADV)
);

CREATE TABLE giohang (
   STT int NOT NULL auto_increment,
   Tennguoidung varchar(50),
   MASP int,
   TenSP varchar(50),
   SOLUONG int,
   GIA float,
   Hinh varchar(350),
   primary key (STT)
);

CREATE TABLE hoadon (
   MAHD int NOT NULL auto_increment,
   UID  int NOT NULL,
   Ngayxuat date,
   TENKH varchar(50) ,
   TENNV varchar(50),
   Tongtien float, 
   primary key (MAHD)
);

CREATE TABLE job (
   MACV int NOT NULL auto_increment,
   UID int NOT NULL,
   TenCV varchar(50),
   MOTA varchar(550),
   LUONG float,
   Hinh varchar(350), 
   primary key (MACV)
);

CREATE TABLE sanpham (
   MASP int NOT NULL auto_increment,
   UID int NOT NULL,
   TenSP varchar(50),
   SOLUONG int,
   GIA float ,
   LOAISP varchar(50) ,
   Thuonghieu varchar(50) ,
   Xuatxu varchar(50),
   Hinh varchar(350),
   primary key (MASP)
);

CREATE TABLE tuyendung (
   STT int NOT NULL auto_increment,
   UID int NOT NULL,
   Hoten varchar(50),
   Email varchar(50),
   Chucvu varchar(50),
   Diachi varchar(255),
   Ngaysinh date,
   SDT varchar(50),
   NgaynopCV date,
   primary key (STT)
);

CREATE TABLE users (
   UID int NOT NULL,
   Hoten varchar(50),
   Tennguoidung varchar(50) NOT NULL,
   Pass varchar(50) NOT NULL,
   SDT varchar(50),
   Ngaysinh date,
   Email varchar(50),
   Gioitinh int,
   Quyen int,
   Avatar text DEFAULT NULL,
   primary key (UID)
);

ALTER TABLE hoadon
  ADD CONSTRAINT LK1 FOREIGN KEY ( UID ) REFERENCES users (UID);
  
ALTER TABLE sanpham
  ADD CONSTRAINT LK2 FOREIGN KEY (UID) REFERENCES users (UID);
  
  ALTER TABLE dichvu
  ADD CONSTRAINT LK3 FOREIGN KEY (UID) REFERENCES users (UID);
  
  ALTER TABLE tuyendung
  ADD CONSTRAINT LK4 FOREIGN KEY (UID) REFERENCES users (UID);
  
  ALTER TABLE booking
  ADD CONSTRAINT LK5 FOREIGN KEY (UID) REFERENCES users (UID);
  
  ALTER TABLE cthddv
  ADD CONSTRAINT LK6 FOREIGN KEY (MADV) REFERENCES dichvu (MADV);
  
  ALTER TABLE cthddv
  ADD CONSTRAINT LK7 FOREIGN KEY (MAHD) REFERENCES hoadon (MAHD);
  
  ALTER TABLE cthdsp
  ADD CONSTRAINT LK8 FOREIGN KEY (MAHD) REFERENCES hoadon (MAHD);
  
  ALTER TABLE cthdsp
  ADD CONSTRAINT LK9 FOREIGN KEY (MASP) REFERENCES sanpham (MASP);
  
  ALTER TABLE job
  ADD CONSTRAINT LK10 FOREIGN KEY (UID) REFERENCES users (UID);
 
 INSERT INTO users VALUES
	(1, 'Nguyen Van A', 'VANA', '123456', '0987654321', '1990-01-01', 'nguyenvana@gmail.com', 1, 1, 'uploads/1624240500_avatar.png'),
	(2, 'Tran Thi B', 'THIB', 'abcdef', '0123456789', '1995-05-05', 'tranthib@gmail.com', 2, 2, 'uploads/1624240500_avatar.png'),
	(3, 'Le Van C', 'LEC', 'xyz123', '0909090909', '1985-10-10', 'levanc@gmail.com', 1, 2, 'uploads/1624240500_avatar.png'),
	(4, 'Pham Thi D', 'PTHID', 'qweasd', '0777777777', '2000-02-02', 'phamthid@gmail.com', 3, 1, 'uploads/1624240500_avatar.png'),
	(5, 'Hoang Van E', 'HVanE', 'vandeptrai', '0333333333', '1998-08-08', 'hoangvane@gmail.com', 2, 3, 'uploads/1624240500_avatar.png'),
	(6, 'Phuc', 'Paul2002', '12345', '0998476424', '2002-02-03', 'thienphuc158@gmail.com', 1, 3, 'uploads/1624240500_avatar.png');
 
  INSERT INTO booking VALUES
	(1, 1, 'Nguyen Van A', 'nguyenvana@gmail.com', '0987654321', '123 ABC Street, HCM', 'Xúc bình xăng con', '2022-05-01', 'Làm càng sớm càng tốt'),
	(2, 1, 'Tran Thi B', 'tranthib@gmail.com', '0123456789', '456 XYZ Street, HCM', 'Rửa xe bọt tuyết', '2022-04-25', 'Rửa kĩ để đi ăn cưới'),
	(3, 1, 'Le Van C', 'levanc@gmail.com', '0909090909', '789 PQR Street, HCM', 'Sơn dàn áo xe', '2022-05-05', 'Sơn màu gradient'),
	(4, 1, 'Pham Thi D', 'phamthid@gmail.com', '0777777777', '1011 LMN Street, HCM', 'Lắp ốc kiểu', '2022-05-10', 'Ốc kiểu Titan'),
	(5, 1, 'Hoang Van E', 'hoangvane@gmail.com', '0333333333', '1213 EFG Street, HCM', 'Dán tem xe máy', '2022-05-08', 'Tem Racing Boy'),
	(14, 1, 'Thiên Phúc Nguyễn', 'thienphucb7@gmail.com', '09484641', '66 Tôn Thất Tùng, phường Phạm Ngũ Lão, quận 1, TPH', 'Bảo trì', '2023-04-30', ''),
	(15, 1, 'Nguyễn Đức Anh', 'kudo2002@gmail.com', '09827311', '12 Lâm Hoành, Phường An Lạc, Quận Bình Tân, TPHCM ', 'Sửa chữa', '2023-05-01', ''),
	(16, 1, 'Đặng Chí Bảo', 'chibao@gmail.com', '08475651', '12 Nguyễn Kim, Phường 5, Quận 5, TPHCM', 'Kiểm tra', '2023-05-05', '');
    
    
INSERT INTO hoadon VALUES
	(1, 2, '2022-03-10', 'Nguyen Van A', 'Le Thi B', 3500000),
	(2, 2, '2022-04-01', 'Tran Thi C', 'Nguyen Van D', 15500000),
	(3, 2, '2022-05-05', 'Hoang Van E', 'Tran Thi F', 1000000),
	(4, 2, '2022-06-20', 'Pham Van G', 'Hoang Van H', 5000000),
	(5, 2, '2022-08-12', 'Nguyen Thi I', 'Pham Van J', 2000000);  
    
    
INSERT INTO sanpham VALUES
	(1, 2, 'Phuộc Ohlin', 20, 15000000, 'suspension', 'Ohlin', 'Sweden', 'https://shop2banh.vn/images/2015/07/20150701_9f1a5806445b42b905bdc759c63437a5_1435735203.jpg'),
	(2, 2, 'Pô Akrapovic', 30, 12000000, 'exhaust', 'Akrapovic', 'Slovenia', 'https://www.fc-moto.de/WebRoot/FCMotoDB/Shops/10207048/5FD1/DA5F/1933/91C1/9534/AC1E/140A/D829/s_s7so2_hrc_ml.jpg'),
	(3, 2, 'Phanh Brembo', 15, 8000000, 'brake', 'Brembo', 'Italia', 'https://global-fs.webike-cdn.net/catalogue/images/32033/20_5165_79s_TL.jpg'),
	(4, 2, 'Nhớt Xado', 10, 500000, 'oil', 'Xado', 'Ukraine', 'https://expresscenter.vn/wp-content/uploads/2019/07/XADO-LUXURY-MOTO-RACING-4T-MA2-10W40.png'),
	(5, 2, 'Đèn trợ sáng LED', 25, 800000, 'light', 'LedTun', 'China', 'https://dailydaunhot.com/wp-content/uploads/2019/05/%C4%90%C3%A8n-Tr%E1%BB%A3-S%C3%A1ng-L4x.jpg'),
	(6, 2, 'Bugi NGK Iridium', 25, 300000, 'bugi', 'NGK', 'Japan', 'https://ngkntk.com.vn/upload/images/Laser%201.jpg'),
	(8, 2, 'Akrapovic Racing Line yzf-r6', 15, 18000000, 'exhaust', 'Akrapovic', 'Slovenia', 'https://www.tenkateracingproducts.com/media/catalog/product/cache/68948404168c45fb1b9263ca2cc0e9b2/s/-/s-y6r9-apt-akrapovic-racing-line-stainless-steel-exhaust-system-yzf-r6-2017-1.jpg'),
	(9, 2, 'GoPro Hero 9 Black', 15, 8000000, 'Camera', 'GOPRO', 'China', 'https://cdn.vjshop.vn/camera-hanh-dong/gopro/gopro-hero-10/gopro-hero-10-1-1-1000x1000.png'),
	(10, 2, 'Royal Helmet Black', 25, 600000, 'Helmet', 'Royal', 'China', 'https://img.websosanh.vn/v10/users/review/images/8zyek58xzq7q2/mua-bao-hiem-royal-co-tot-khong.jpg?compress=85'),
	(11, 2, 'Royal Helmet M136', 35, 1200000, 'Helmet', 'Royal', 'China', 'https://alophuot.com/wp-content/uploads/2022/07/qtnmw5136v2_optimized.png'),
	(12, 2, 'Royal Helmet M08', 55, 1500000, 'Helmet', 'Royal', 'China', 'https://alophuot.com/wp-content/uploads/2022/07/2e3vnam08-vang_optimized.jpg'),
	(13, 2, 'Castrol Power 1', 15, 120000, 'oil', 'Castrol', 'UK', 'https://alobike.vn/uploads/dau-nhot/castrol-power1-cruise.jpg'),
	(14, 2, 'Motul 3100 GOLD', 15, 120000, 'oil', 'Motul', 'UK', 'https://d23zpyj32c5wn3.cloudfront.net/pim/packshots/pictures/266/main/open-uri20220323-20218-1qxpc4v?1648005350'),
	(15, 2, 'Caltex Havoline Super 4T', 25, 120000, 'oil', 'Caltex', 'US', 'https://www.caltex.com/content/dam/caltex/Vietnam/Motorists/GENY/GENY/Packshot/500727%20HAV%20S4T%2015W40%201LI%20VN%2019%20R0.png'),
	(16, 2, 'Đèn pha Philips 11342 6000K', 35, 150000, 'light', 'Philips', 'Netherland', 'https://media.loveitopcdn.com/1635/100416-bong-den-pha-led-xe-o-to-xe-hoi-philips-ultinon-11342ulx2-ims-vi-vn.png'),
	(17, 2, 'Đèn xi nhan Philips T10 11357', 64, 120000, 'light', 'Philips', 'China', 'https://tiger-korea.com/datafiles/setone/1587204443_T10.png'),
	(18, 2, 'Công tắc hazard', 25, 120000, 'light', 'Philips', 'Netherland', 'https://media3.scdn.vn/img3/2019/1_3/UePndR_simg_de2fe0_500x500_maxb.jpg'),
	(19, 2, 'Công tắc passing', 35, 120000, 'light', 'Philips', 'Netherland', 'https://down-vn.img.susercontent.com/file/e8fac97e9963389c96a2f91232a2ca06_tn'),
	(20, 2, 'Đèn định vị Philips T10 W3125', 32, 100000, 'light', 'Philips', 'Netherland', 'https://xeomshop.vn/wp-content/uploads/2022/08/DSC07625-450x410.jpg'),
	(22, 2, 'Mạch passing WinnerX-SH', 15, 180000, 'light', 'Honda', 'Japan', 'https://sudospaces.com/giadung/2022/08/mach-passing-1s-kiem-bat-tat-den-tro-sang-1.jpg'),
	(23, 2, 'Mạch Hazrad Honda', 35, 200000, 'light', 'Honda', 'Japan', 'https://cf.shopee.vn/file/f9d5e65fbeafe4dc4fc9e5b643e478c2'),
	(24, 2, 'Takegawa Tornado', 25, 6000000, 'exhaust', 'Takegawa', 'Japan', 'https://bizweb.dktcdn.net/100/425/757/products/09151733-6322e361da0ee.jpg?v=1667814604543'),
	(25, 2, 'Racing Boy 335mm', 55, 5000000, 'suspension', 'Racing Boy', 'Thailand', 'https://4.bp.blogspot.com/-_dN-sGhhu6o/VoYh0GhvGSI/AAAAAAAAKuI/Nnpk9FWdwPI/s1600/phuoc-nhun-doi-racing-boy-36_3_635411171289302881.jpg'),
	(26, 2, 'Michelin 90/90-21 M/C 54V Anakee Adventure', 55, 3500000, 'tire', 'Michellin', 'France', 'https://lopnhanh.net/wp-content/uploads/2020/07/adventure-front.jpg'),
	(27, 2, 'Michellin Pilot Street 2', 35, 4000000, 'tire', 'Michellin', 'France', 'https://cf.shopee.vn/file/d03b95921b61965a096c94e9a9e690cc'),
	(28, 2, 'IRC NR69', 35, 500000, 'tire', 'Inoue', 'Japan', 'https://cf.shopee.vn/file/62207876b105f5a3b99ad27ff1b5d274'),
	(29, 2, 'Dunlop DT3', 25, 3000000, 'tire', 'Dunlop', 'UK', 'https://img.websosanh.vn/v10/users/review/images/4iv58z41p4ekx/nguongocdunlopcuanuocnao.jpg?compress=85'),
	(30, 2, 'Dunlop K180', 55, 2500000, 'tire', 'Dunlop', 'UK', 'https://cf.shopee.vn/file/dd32e9f2f46e3ce333e0f5fc49264e01'),
	(31, 2, 'Yokohama S300', 64, 1500000, 'tire', 'Yokohama', 'Japan', 'https://www.yokohama.com.vn/images/truckbus/I274DBqUEzjgQUmBftSTDz98iqUxnY3teRCdFnoi.png'),
	(33, 2, 'Yokohama F300', 32, 800000, 'tire', 'Yokohama', 'Japan', 'https://cf.shopee.vn/file/1a8a7f8349c0277bd413f78966ab72ce');
    
INSERT INTO dichvu VALUES
	(1, 1, 'Thay nhớt', 200000),
	(2, 1, 'Thay bình xăng', 500000),
	(3, 1, 'Vệ sinh bộ lọc gió', 100000),
	(4, 1, 'Kiểm tra động cơ', 1500000),
	(5, 1, 'Bảo dưỡng định kỳ', 3000000);
    
INSERT INTO cthddv VALUES
	(1, 1, 'Thay nhớt', 200000),
	(1, 2, 'Thay bình xăng', 500000),
	(2, 4, 'Kiểm tra động cơ', 1500000),
	(2, 5, 'Bảo dưỡng định kỳ', 3000000),
	(3, 3, 'Vệ sinh bộ lọc gió', 100000),
	(4, 2, 'Thay bình xăng', 500000),
	(4, 4, 'Kiểm tra động cơ', 1500000),
	(5, 1, 'Thay nhớt', 200000),
	(5, 3, 'Vệ sinh bộ lọc gió', 100000);

INSERT INTO cthdsp VALUES
	(1, 1, 'Phuộc Ohlin', 1, 15000000),
	(1, 2, 'Pô Akrapovic', 1, 12000000),
	(2, 4, 'Nhớt Xado', 1, 500000),
	(2, 5, 'Đèn trợ sáng LED', 2, 1600000),
	(3, 3, 'Phanh Brembo', 1, 8000000),
	(4, 4, 'Nhớt Xado', 2, 1000000),
	(5, 4, 'Nhớt Xado', 3, 1500000),
	(5, 5, 'Đèn trợ sáng LED', 1, 800000);
  
    
INSERT INTO giohang VALUES
	(1, 'Paul2002', 1, 'Phuộc Ohlin', 1, 15000000, 'https://shop2banh.vn/images/2015/07/20150701_9f1a5806445b42b905bdc759c63437a5_1435735203.jpg'),
	(2, 'Paul2002', 2, 'Pô Akrapovic', 1, 12000000, 'https://www.fc-moto.de/WebRoot/FCMotoDB/Shops/10207048/5FD1/DA5F/1933/91C1/9534/AC1E/140A/D829/s_s7so2_hrc_ml.jpg'),
	(3, 'Paul2002', 6, 'Bugi NGK Iridium', 1, 300000, 'https://ngkntk.com.vn/upload/images/Laser 1.jpg'),
	(4, 'Paul2002', 26, 'Michelin 90/90-21 M/C 54V Anakee Adventure', 1, 3500000, 'https://lopnhanh.net/wp-content/uploads/2020/07/adventure-front.jpg'),
	(5, 'Paul2002', 3, 'Phanh Brembo', 1, 8000000, 'https://global-fs.webike-cdn.net/catalogue/images/32033/20_5165_79s_TL.jpg'),
	(6, 'Paul2002', 4, 'Nhớt Xado', 1, 500000, 'https://expresscenter.vn/wp-content/uploads/2019/07/XADO-LUXURY-MOTO-RACING-4T-MA2-10W40.png'),
	(7, 'Paul2002', 24, 'Takegawa Tornado', 1, 6000000, 'https://bizweb.dktcdn.net/100/425/757/products/09151733-6322e361da0ee.jpg?v=1667814604543');



INSERT INTO job VALUES
	(1, 1, 'Kỹ sư cơ khí', 'Các kỹ sư tốt nghiệp đại học cơ khí và có kinh nghiệm ít nhất 1 năm. Được hưởng ưu đãi về bảo hiểm xã hội, lương tháng 13, được tận hưởng nhiều phúc lợi của công ty', 25000000, 'https://erdr.in/wp-content/uploads/2020/10/Engineering-EDIWeekly.jpg'),
	(2, 1, 'Kế Toán', 'Kế toán có kinh nghiệm 5-6 tháng. Được hưởng ưu đãi về bảo hiểm xã hội, lương tháng 13, được tận hưởng nhiều phúc lợi của công ty', 15000000, 'https://tencongty.com.vn/wp-content/uploads/2022/08/ru.jpg'),
	(3, 1, 'Marketing', 'Từng học ngành marketing, có kỹ năng thiết kế banner, giao tiếp quảng bá và ý tưởng đột phá. Được hưởng ưu đãi về bảo hiểm xã hội, lương tháng 13, được tận hưởng nhiều phúc lợi của công ty ngoài ra được thưởng hoa hồng', 12000000, 'https://swinburne-vn.edu.vn/wp-content/uploads/2022/10/marketing-la-gi.jpg'),
	(4, 1, 'Thực tập sinh kỹ thuật', 'Ưu tiên sinh viên học ngành kỹ thuật cơ khí, các trường nghề và thời gian thực tập 6 tháng. Phụ cấp tiền xăng - ăn uống trên 3.000.000đ', 3000000, 'https://vieclam123.vn/ckfinder/userfiles/images/internship-la-gi.jpg');
    

INSERT INTO tuyendung VALUES
	(1, 1, 'Nguyen Van A', 'nguyenvana@gmail.com', 'Kế toán', '123 ABC Street, HCM', '1990-01-01', '0987654321', '2022-03-01'),
	(2, 1, 'Tran Thi B', 'tranthib@gmail.com', 'Nhân viên kinh doanh', '456 XYZ Street, HCM', '1995-05-05', '0123456789', '2022-02-15'),
	(3, 1, 'Le Van C', 'levanc@gmail.com', 'Lập trình viên', '789 PQR Street, HCM', '1985-10-10', '0909090909', '2022-01-20'),
	(4, 1, 'Pham Thi D', 'phamthid@gmail.com', 'Giám đốc điều hành', '1011 LMN Street, HCM', '2000-02-02', '0777777777', '2022-03-20'),
	(5, 1, 'Hoang Van E', 'hoangvane@gmail.com', 'Nhân viên kỹ thuật', '1213 EFG Street, HCM', '1998-08-08', '0333333333', '2022-02-28');

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Simple Invoice System'),
(6, 'short_name', 'Invoice'),
(11, 'logo', 'uploads/1625795280_logo.jpg'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/1624240440_banner1.jpg'),
(15, 'tax_rate', '12');	
    
