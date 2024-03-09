-- Drop the database if it already exists
DROP DATABASE IF EXISTS BmwShowRoom_Update;
-- Create database
CREATE DATABASE IF NOT EXISTS BmwShowRoom_Update;
USE BmwShowRoom_Update;

-- create table: Account
DROP TABLE IF EXISTS `Account`;
CREATE TABLE `Account`(
	id						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    username				VARCHAR(50) NOT NULL UNIQUE KEY,
	`password` 				VARCHAR(800) NOT NULL,
    first_name				NVARCHAR(50) NOT NULL,
    last_name				NVARCHAR(50) NOT NULL,
    `role` 					ENUM('ADMIN','USER') DEFAULT 'USER',
	create_at				DATETIME DEFAULT NOW()
);

-- Add data Account
-- Password: 123456
INSERT INTO `Account`(	username	,	`password`,	first_name	,	last_name	,	`role`	)
VALUES 		(	'username1'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyen',	'Hai Dang'	,'ADMIN'),								
			(	'username2'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Tran'	,	'Van Chien'	,	'ADMIN'),
			(	'username3'	,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyen',	'Van A'		,	'USER'),
			(	'username4'	,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyen',	'Van B'	,'USER'),
			(	'username5'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Phan',	'Huy Thang'	,'USER'	),
            
            (	'username6'		,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyen',	'Hai'	,'ADMIN'),								
			(	'username7'		,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Tran'	,	'Van'	,	'ADMIN'),
			(	'username8'	,	'$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyen',	'Van A'		,	'USER'),
			(	'username9'	,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Nguyen',	'Van B'	,'USER'),
			(	'username10'	,   '$2a$10$W2neF9.6Agi6kAKVq8q3fec5dHW8KUA.b0VSIGdIZyUravfLpyIFi',	'Phan',	'Huy Thang'	,'USER'	),
			(	'tienanh'	,   '123456',	'Nguyen',	'Tien Anh'	,'ADMIN');
                                
-- create table: CarCategory
DROP TABLE IF EXISTS CarCategory;
CREATE TABLE CarCategory(
	id						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`					VARCHAR(50) NOT NULL UNIQUE KEY
);

INSERT INTO CarCategory(`name`)
VALUES 		('Suv'), ('Sedan'),('Mui trần');


-- create table: Car
DROP TABLE IF EXISTS Car;
CREATE TABLE Car(
	id						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`					VARCHAR(50) NOT NULL UNIQUE KEY,
    image 					VARCHAR(50) NOT NULL,
	price 					VARCHAR(50) NOT NULL,
    information				NVARCHAR(500) NOT NULL,
    detail_information		NVARCHAR(500) NOT NULL,
    yearOfManufacturer 		INT UNSIGNED NOT NULL,
    seating_capacity 		INT UNSIGNED NOT NULL,
    car_fuel				VARCHAR(50) NOT NULL,
    placeOfManufacture		VARCHAR(50) NOT NULL,
    transmission			VARCHAR(50) NOT NULL,
    `status`				VARCHAR(50) NOT NULL,
    create_at				DATETIME DEFAULT NOW(),
    category_id				INT UNSIGNED NOT NULL,
    FOREIGN KEY (category_id) REFERENCES CarCategory(id)  ON DELETE CASCADE
);

INSERT INTO Car (`name`, image, price, information, detail_information, yearOfManufacturer, seating_capacity, car_fuel, placeOfManufacture, transmission, `status`, create_at, category_id)
VALUES
		('BMW X3'	, 'car2.jpg', '1,699,000,000'	, 'Thiết kế thể thao mạnh mẽ, Khả năng vận hành ưu việt cao, tính đa dụng, phù hợp với gia đình.'	, 'Màu xanh deep blue, nội thất nâu da bò, màn hình Navi, Loa bose'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW X4'	, 'car3.jpg', '3,649,000,000'	, 'Động cơ: I4 Turbo (B48) 1998 cc,Công suất cực đại: 184 hp @ 5000 – 6500 rpm, Hộp số: Tự động 8 cấp Steptronic'	, 'Tăng tốc 0 – 100 km/h: 8,3 s, Tốc độ tối đa: 215 km/h, Tiêu thụ nhiên liệu trung bình: 6,7 – 7,3L/100km.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW X5'	, 'car4.jpg', '3,019,000000'	, 'Hệ thống chống bó cứng phanh ABS, Hệ thống phân phối lực phanh điện tử EBD, Hệ thống hỗ trợ xuống đèo/dốc HDC'	, 'Xe được trang bị kính cách âm 2 lớp vừa đảm bảo hiệu quả cách âm tốt hơn, đồng thời còn giúp cách nhiệt và phản xạ ánh sáng tuyệt vời.'	, 2023	, '7'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW 730li'	, 'se4.jpg', '4,599,00000'	, 'Một mẫu xe hạng sang, thể thao cỡ lớn, mang cảm giác lái xuất sắc tuy nhiên vẫn giữ được sự sang trọng, rộng rãi và đầy quyền lực'	, 'Động cơ B48, 4 xy-lanh, 2.0 lít trang bị trên BMW 730Li M Sport và 730Li Pure Excellence sản sinh công suất cực đại 265 mã lực tại dải vòng tua 5.000 – 6.500 vòng/phút.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW Z4 All New'	, 'se5.jpg', '3,499,000,000'	, 'BMW Z4 2021 được trang bị loại động cơ xăng tăng áp có dung tích 2.0 lít có khả năng hoạt động với công suất cực đại 255 mã lực.'	, 'BMW Z4 thế hệ mới có thiết kế đậm chất thể thao.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW X3 test'	, 'BMW3-Series.jpg', '1,399,000,000'	, 'BMW Z4 2021 được trang bị loại động cơ xăng tăng áp có dung tích 2.0 lít có khả năng hoạt động với công suất cực đại 255 mã lực.'	, 'Tăng tốc 0 – 100 km/h: 8,3 s, Tốc độ tối đa: 215 km/h, Tiêu thụ nhiên liệu trung bình: 6,7 – 7,3L/100km.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW 430i Convertible'	, 'BMWZ4AllNew.jpg', '3,019,000000'	, 'BMW 430i Convertible 2022-2023 sở hữu phong cách đầy thể thao, cuốn hút với thiết kế mui mềm mới, động cơ vận hành mạnh mẽ.'	, 'Động cơ xăng 4 xi-lanh với công nghệ TwinPower Turbo nổi tiếng của BMW 4, sản sinh công suất 258 mã lực và mô men xoắn 400 Nm.'	, 2023	, '7'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW 5-Series'	, 'se3.jpg', '2,139,000,000'	, 'khối động cơ xăng tăng áp kép 2.0L I4. Cỗ máy này sản sinh công suất đạt 184 mã lực tại 5200-6500 vòng/phút, mô men xoắn cực đại 350 Nm tại 1450-4800 vòng/phút.', 'hộp số tự động 8 cấp Steptronic.', 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW 520i Msport 2022'	, 'BMW735iMSport2023.jpg', '2,501,000,000'	, 'Động cơ Xăng tăng áp kép I4 2.0L sản sinh công suất tối đa 184 mã lực tại 5000-6500 vòng/phút, mô men xoắn cực đại 290 Nm tại 1350-4250 vòng/phút.'	, 'Động cơ xăng 4 xi-lanh với công nghệ TwinPower Turbo nổi tiếng của BMW 4, sản sinh công suất 258 mã lực và mô men xoắn 400 Nm.'	, 2023	, '7'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        
        ('BMW-i X3'	, 'se3.jpg', '1,699,000,000'	, 'Thiết kế thể thao mạnh mẽ, Khả năng vận hành ưu việt cao, tính đa dụng, phù hợp với gia đình.'	, 'Màu xanh deep blue, nội thất nâu da bò, màn hình Navi, Loa bose'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i X4'	, 'BMW735iMSport2023.jpg', '3,649,000,000'	, 'Động cơ: I4 Turbo (B48) 1998 cc,Công suất cực đại: 184 hp @ 5000 – 6500 rpm, Hộp số: Tự động 8 cấp Steptronic'	, 'Tăng tốc 0 – 100 km/h: 8,3 s, Tốc độ tối đa: 215 km/h, Tiêu thụ nhiên liệu trung bình: 6,7 – 7,3L/100km.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i X5'	, 'BMWZ4AllNew.jpg', '3,019,000000'	, 'Hệ thống chống bó cứng phanh ABS, Hệ thống phân phối lực phanh điện tử EBD, Hệ thống hỗ trợ xuống đèo/dốc HDC'	, 'Xe được trang bị kính cách âm 2 lớp vừa đảm bảo hiệu quả cách âm tốt hơn, đồng thời còn giúp cách nhiệt và phản xạ ánh sáng tuyệt vời.'	, 2023	, '7'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i 730li'	, 'BMW3-Series.jpg', '4,599,00000'	, 'Một mẫu xe hạng sang, thể thao cỡ lớn, mang cảm giác lái xuất sắc tuy nhiên vẫn giữ được sự sang trọng, rộng rãi và đầy quyền lực'	, 'Động cơ B48, 4 xy-lanh, 2.0 lít trang bị trên BMW 730Li M Sport và 730Li Pure Excellence sản sinh công suất cực đại 265 mã lực tại dải vòng tua 5.000 – 6.500 vòng/phút.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i Z4 All New'	, 'se5.jpg', '3,499,000,000'	, 'BMW Z4 2021 được trang bị loại động cơ xăng tăng áp có dung tích 2.0 lít có khả năng hoạt động với công suất cực đại 255 mã lực.'	, 'BMW Z4 thế hệ mới có thiết kế đậm chất thể thao.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i X3 test'	, 'se4.jpg', '1,399,000,000'	, 'BMW Z4 2021 được trang bị loại động cơ xăng tăng áp có dung tích 2.0 lít có khả năng hoạt động với công suất cực đại 255 mã lực.'	, 'Tăng tốc 0 – 100 km/h: 8,3 s, Tốc độ tối đa: 215 km/h, Tiêu thụ nhiên liệu trung bình: 6,7 – 7,3L/100km.'	, 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i 430i Convertible'	, 'car4.jpg', '3,019,000000'	, 'BMW 430i Convertible 2022-2023 sở hữu phong cách đầy thể thao, cuốn hút với thiết kế mui mềm mới, động cơ vận hành mạnh mẽ.'	, 'Động cơ xăng 4 xi-lanh với công nghệ TwinPower Turbo nổi tiếng của BMW 4, sản sinh công suất 258 mã lực và mô men xoắn 400 Nm.'	, 2023	, '7'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i 5-Series'	, 'car2.jpg', '2,139,000,000'	, 'khối động cơ xăng tăng áp kép 2.0L I4. Cỗ máy này sản sinh công suất đạt 184 mã lực tại 5200-6500 vòng/phút, mô men xoắn cực đại 350 Nm tại 1450-4800 vòng/phút.', 'hộp số tự động 8 cấp Steptronic.', 2023	, '5'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	),
        ('BMW-i 520i Msport 2022'	, 'car3.jpg', '2,501,000,000'	, 'Động cơ Xăng tăng áp kép I4 2.0L sản sinh công suất tối đa 184 mã lực tại 5000-6500 vòng/phút, mô men xoắn cực đại 290 Nm tại 1350-4250 vòng/phút.'	, 'Động cơ xăng 4 xi-lanh với công nghệ TwinPower Turbo nổi tiếng của BMW 4, sản sinh công suất 258 mã lực và mô men xoắn 400 Nm.'	, 2023	, '7'	, 'Xăng', 'Germany'	, 'Tự Động'	, 'Còn Hàng', STR_TO_DATE('2024-01-01', '%Y-%m-%d')	, 2	);
        -- sss

-- create table: CustomerTestDriving
DROP TABLE IF EXISTS CustomerTestDriving;
CREATE TABLE CustomerTestDriving(
	id						INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fullName				VARCHAR(50) NOT NULL,
	phoneNumber 			VARCHAR(50) NOT NULL,
    dateTestDriving 		DATETIME,
    car_id					INT UNSIGNED NOT NULL,
    FOREIGN KEY (car_id) REFERENCES Car(id)
);

INSERT INTO CustomerTestDriving(fullName, phoneNumber, dateTestDriving, car_id)
VALUES 		('FullName 1', '0978563214', '2023-12-12', 1),
			('FullName 2', '0978563214', '2023-12-14', 2),
            ('FullName 3', '0979397654', '2023-12-16', 3),
            ('FullName 4', '0978563299', '2023-12-21', 1),
			('FullName 5', '0978563218', '2023-12-14', 2),
            ('FullName 6', '0979397633', '2023-12-16', 3),
            ('FullName 7', '0978563214', '2023-12-12', 1),
			('FullName 8', '0978563214', '2023-12-14', 2),
            ('FullName 9', '0979397654', '2023-12-16', 3),
            ('FullName 10', '0978563299', '2023-12-21', 1),
			('FullName 11', '0978563218', '2023-12-14', 2),
            ('FullName 12', '0979397633', '2023-12-16', 3) ;
            

-- create table: CustomerReceiveAlertPrice
-- create table CustomerReceiveAlertPrice
DROP TABLE IF EXISTS CustomerReceiveAlertPrice;
CREATE TABLE CustomerReceiveAlertPrice(
	id	INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fullName				VARCHAR(50) NOT NULL,
	phoneNumber 			VARCHAR(11) NOT NULL,
    car_id					INT UNSIGNED NOT NULL,
    paymentMethod			NVARCHAR(50) NOT NULL,
	FOREIGN KEY(car_id) REFERENCES Car(id)
);

INSERT INTO CustomerReceiveAlertPrice(fullName, phoneNumber, car_id, paymentMethod)
VALUES 		('Nguyễn Nguyễn', '0978563214', 3, 'Trả thẳng'),
			('Nguyễn Nam', '0978563214', 2, 'Trả thẳng'),
            ('FullName 3', '0978563214', 3, 'Trả thẳng'),
			('FullName 4', '0978563214', 2, 'Trả thẳng'),
            ('FullName 5', '0978563214', 3, 'Trả thẳng'),
			('FullName 6', '0978563214', 2, 'Trả thẳng'),
            ('FullName 7', '0978563214', 3, 'Trả thẳng'),
			('FullName 8', '0978563214', 2, 'Trả thẳng'),
            ('FullName 9', '0979397654', 1, 'Trả góp');

            
-- create table: Feedback
CREATE TABLE Feedback(
	id				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    fullName		VARCHAR(50) NOT NULL,
    messagesContent	VARCHAR(500) NOT NULL,
    sendDate		DATETIME DEFAULT NOW()
);

INSERT INTO Feedback(fullName		,	messagesContent		,	sendDate)
VALUE				('Nguyễn Văn A'	, 	'messagesContent 1', 	now()	),
					('Nguyễn Văn B'	, 	'messagesContent 2', 	now()	),
                    ('Nguyễn Văn C', 	'messagesContent 3', 	now()	),
                    ('Nguyễn Văn D', 	'messagesContent 4', 	now());   
                    
-- create table: Reply
-- CREATE TABLE Reply
-- (
-- 	id				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
--     content			VARCHAR(500) NOT NULL,
-- 	dateReply		DATETIME DEFAULT NOW(),
--     account_id		INT UNSIGNED NOT NULL,
--     FOREIGN KEY(account_id) REFERENCES `Account`(id)
-- );
-- INSERT INTO Reply(content		,dateReply	,account_id)
-- VALUE 			('content 1' 	, now()		, 	1		),
-- 				('content 2' 	, now()		, 	2		),
-- 				('content 3' 	, now()		, 	3		),
-- 				('content 4' 	, now()		,	1		);
--                 
-- create table: News
CREATE TABLE News(
	id				INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    title			VARCHAR(100) NOT NULL,
    `description`	VARCHAR(200) NOT NULL,
     image 					VARCHAR(50) NOT NULL,
    dateNews		DATETIME DEFAULT NOW()
);

INSERT INTO News(	title	,	`description`	, image, 	dateNews	)
VALUE 			('BMW 7-SERIES 2023 RA MẮT VỚI MÀN HÌNH SIÊU RỘNG 31 INCH DÀNH CHO HÀNG GHẾ SAU'	, 	'BMW đã chính thức ra mắt thế hệ thứ 7 hoàn toàn mới của mẫu'	, 'news1.jpg' ,	 now()		),
				('BMW X3 lắp ráp tại Việt Nam có gì cạnh tranh với Mercedes GLC?'	, 	'Chuyển sang lắp ráp trong nước, BMW X3 gây chú ý với giá bán thấp'	, 'news2.jpg'	, now()		),
                ('Vượt Mercedes, BMW trở thành thương hiệu ô tô hạng sang bán chạy nhất năm 2022'	, 	'BMW đã chính thức ra mắt thế hệ thứ 7 hoàn toàn mới của mẫu'	, 'news3.jpeg'	, now()		),
                ('Ra mắt dòng xe thuần điện E-BMW 2024'	, 	'BMW đã chính thức ra mắt thế hệ thứ 1 hoàn toàn mới của mẫu E-BMW'	, 'news1.jpg'	, now()		);
                			
                                    
            
            
            
            
            





