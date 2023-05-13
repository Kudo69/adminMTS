-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 09, 2021 at 10:55 AM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `motoserv`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1 = product, 2 = service',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `type`, `date_created`, `date_updated`) VALUES
(1, 'Product Category 101', '&lt;p&gt;Sample Only&lt;/p&gt;', 1, '2021-07-09 10:18:57', NULL),
(2, 'Product Category 102', '&lt;p&gt;Test 102&lt;/p&gt;', 1, '2021-07-09 10:32:40', '2021-07-09 10:33:01'),
(4, 'Service 101', '&lt;p&gt;Service 101 Sample Description&lt;/p&gt;', 2, '2021-07-09 10:36:05', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoices_items`
--

CREATE TABLE `invoices_items` (
  `id` int(30) NOT NULL,
  `invoice_id` int(30) NOT NULL,
  `form_id` int(30) NOT NULL,
  `unit` varchar(50) NOT NULL,
  `quantity` float NOT NULL,
  `price` float NOT NULL,
  `total` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoices_items`
--

INSERT INTO `invoices_items` (`id`, `invoice_id`, `form_id`, `unit`, `quantity`, `price`, `total`) VALUES
(2, 1, 2, 'boxes', 7, 799.99, 5599.93),
(3, 2, 1, 'session', 2, 2500, 5000),
(4, 1, 1, 'boxes', 3, 350.5, 1051.5);

-- --------------------------------------------------------

--
-- Table structure for table `invoice_list`
--

CREATE TABLE `invoice_list` (
  `id` int(30) NOT NULL,
  `invoice_code` varchar(100) NOT NULL,
  `customer_name` text NOT NULL,
  `type` tinyint(1) DEFAULT NULL,
  `sub_total` float NOT NULL,
  `tax_rate` float NOT NULL,
  `total_amount` float NOT NULL,
  `remarks` text NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `invoice_list`
--

INSERT INTO `invoice_list` (`id`, `invoice_code`, `customer_name`, `type`, `sub_total`, `tax_rate`, `total_amount`, `remarks`, `date_created`, `date_updated`) VALUES
(1, 'Product-2476709', 'John Smith', 1, 42354, 12, 42354, 'Sample Remarks', '2021-07-09 15:36:41', '2021-07-09 16:44:09'),
(2, 'Service-7629350', 'Claire Blake', 2, 10000, 12, 10000, 'Sample Only', '2021-07-09 16:14:55', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

CREATE TABLE `sanpham` (
  `MASP` int(11) NOT NULL,
  `UID` int(11) NOT NULL,
  `TenSP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `SOLUONG` int(11) DEFAULT NULL,
  `GIA` float DEFAULT NULL,
  `LOAISP` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Thuonghieu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Xuatxu` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hinh` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`MASP`, `UID`, `TenSP`, `SOLUONG`, `GIA`, `LOAISP`, `Thuonghieu`, `Xuatxu`, `Hinh`) VALUES
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

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `service` varchar(250) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `category_id`, `service`, `description`, `price`, `date_created`, `date_updated`) VALUES
(1, 4, 'Service 101', '&lt;p&gt;Sample Service only&lt;/p&gt;', 2500, '2021-07-09 11:20:28', '2021-07-09 11:21:40');

-- --------------------------------------------------------

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

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/1624240500_avatar.png', NULL, 1, '2021-01-20 14:02:37', '2021-06-21 09:55:07'),
(4, 'John', 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', NULL, NULL, 0, '2021-06-19 08:36:09', '2021-06-19 10:53:12'),
(5, 'Claire', 'Blake', 'cblake', '4744ddea876b11dcb1d169fadf494418', NULL, NULL, 0, '2021-06-19 10:01:51', '2021-06-19 12:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoices_items`
--
ALTER TABLE `invoices_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `invoice_list`
--
ALTER TABLE `invoice_list`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`MASP`),
  ADD KEY `LK2` (`UID`);

--
-- AUTO_INCREMENT cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  MODIFY `MASP` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;


--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoices_items`
--
ALTER TABLE `invoices_items`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice_list`
--
ALTER TABLE `invoice_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- -- AUTO_INCREMENT for table `product_list`
-- --
-- ALTER TABLE `product_list`
--   MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
