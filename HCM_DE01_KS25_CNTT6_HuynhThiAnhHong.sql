CREATE DATABASE IF NOT EXISTS SalesManagement;
USE SalesManagement;

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(255) NOT NULL,
    brand_name VARCHAR(100), 
    price DECIMAL(15, 0) DEFAULT 0,
    stock_quantity INT DEFAULT 0
);

CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(255)
);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(15, 0),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE Order_Detail (
    order_id INT,
    product_id INT,
    quantity INT,
    sell_price DECIMAL(15, 0),
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- CHỈNH SỬA CẤU TRÚC (ALTER)
ALTER TABLE `Order` ADD COLUMN note TEXT;
ALTER TABLE product CHANGE COLUMN brand_name Nha_San_Xuat VARCHAR(100);

-- NHẬP DỮ LIỆU (DML)
-- Nhập Khách hàng
INSERT INTO customer (fullname, email, phone, address) VALUES  
('Nguyen Minh Vuong', 'vuong@gmail.com', '091234567', 'Can Tho'),
=======
CREATE TABLE product(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
	product_name VARCHAR(250) NOT NULL,
	brand_name VARCHAR(100),
	price DECIMAL(15, 0) DEFAULT 0,
	stock_quantity INT DEFAULT 0
);

CREATE TABLE Customer(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
	fullname VARCHAR(150) NOT NULL,
	email VARCHAR(150) UNIQUE,
	phone VARCHAR(20),
	address VARCHAR(255)
);

CREATE TABLE `Order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
	customer_id INT,
	order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	total_amount DECIMAL(15, 0),
	FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE Order_Detail(
order_id INT,
product_id INT,
quantity INT,
sell_price DECIMAL(15, 0),
PRIMARY KEY (order_id, product_id),
FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
FOREIGN KEY (product_id) REFERENCES product(product_id)
);
-- Thêm cột Ghi chú (kiểu văn bản) vào bảng Order.
ALTER TABLE `Order` ADD COLUMN note TEXT;
--  Đổi tên cột Hãng sản xuất thành Nha San Xuat.
ALTER TABLE product CHANGE COLUMN brand_name Nha_San_Xuat VARCHAR(100);
-- Nhap 5 khach hang (co mot khach hang SDT la NULL de test lenh Delete
INSERT INTO customer (fullname,email, phone, address) VALUES
('Nguyen Minh Vuong', 'vuong@gmail.com' '091234567', 'Can Tho'),
>>>>>>> eff862d6c92b03e065e68e4606ebc3358afed934
('Doan Thanh Ha', 'ha@gmail.com', NULL, 'Vinh Long'),
('Bui Thanh Hai', 'hai@gmail.com', '0986359921', 'TPHCM'),
('Le Thi Mai Hoa', 'hoa@gmail.com', '0934455667', 'Da Nang'),
('Cao Ngoc Bich', 'bich@gmail.com', '0998888664', 'Nha Trang');

<<<<<<< HEAD
-- Nhập Sản phẩm
INSERT INTO product (product_name, Nha_San_Xuat, price, stock_quantity) VALUES  
('MacBook Air M2', 'Apple', 28000000, 10),
=======
-- Nhap 5 san pham ( co Apple va macbook Air M2)
INSERT INTO product (product_name, Nha_San_Xuat, price, stock_quantity) VALUES
('Macbook Air M2', 'Apple', 28000000, 10),
>>>>>>> eff862d6c92b03e065e68e4606ebc3358afed934
('iPhone 15 Pro', 'Apple', 25000000, 15),
('Mouse Logitech', 'Logitech', 500000, 50),
('Keyboard Razer', 'Razer', 2000000, 20),
('Monitor Dell', 'Dell', 15000000, 8);
<<<<<<< HEAD

-- Nhập Đơn hàng (Cần chạy cái này trước)
INSERT INTO `Order` (customer_id, total_amount) VALUES (1, 28000000); 

-- Nhập Chi tiết đơn hàng (Đã sửa sell_orice thành sell_price và khớp 4 cột)
INSERT INTO Order_Detail (order_id, product_id, quantity, sell_price) 
VALUES (1, 1, 1, 28000000);

-- THAO TÁC CẬP NHẬT & XÓA
SET SQL_SAFE_UPDATES = 0; 
UPDATE product SET price = price * 1.1 WHERE Nha_San_Xuat = 'Apple';
DELETE FROM customer WHERE phone IS NULL;

-- TRUY VẤN (SELECT)
-- Tìm sản phẩm giá từ 10tr đến 20tr
SELECT * FROM product WHERE price BETWEEN 10000000 AND 20000000;

-- Sản phẩm bán trong đơn hàng 'DH001' (ID=1)
SELECT p.product_name  
FROM product p
JOIN Order_Detail od ON p.product_id = od.product_id
WHERE od.order_id = 1;

-- Khách mua MacBook Air M2
SELECT DISTINCT c.fullname, c.email
FROM customer c
JOIN `Order` o ON c.customer_id = o.customer_id
JOIN Order_Detail od ON o.order_id = od.order_id
JOIN product p ON od.product_id = p.product_id
WHERE p.product_name = 'MacBook Air M2';
=======
-- Nhap don hang va chi tiet don hang
INSERT INTO `Order` (customer_id, total_amount) VALUES(1, 28000000); -- Don DH001
INSERT INTO Order_Detail (order_id, product_id, quantity, sell_orice) 
VALUES (1, 1, 1, 28000000);
-- thao tac Update & Delete
-- Tăng giá bán thêm 10% cho tất cả sản phẩm của hãng 'Apple'
SET SQL_SAFE_UPDATES = 0; -- Tắt safe mode đẻe update theo hãng
UPDATE products SET price = price * 1.1 WHERE Nha_San_Xuat = 'Apple';
-- Xóa khách hàng chưa để lại SDT
DELETE FROM customer WHERE phone IS NULL;
--

>>>>>>> eff862d6c92b03e065e68e4606ebc3358afed934
