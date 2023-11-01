CREATE DATABASE QuanLyBanHang;
USE QuanLyBanHang;

CREATE TABLE orders (
    oID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    oName VARCHAR(30) NOT NULL,
    oDate DATETIME,
    oTotalPrice INT
);

CREATE TABLE customers (
    cID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cName VARCHAR(30) NOT NULL,
    cAge INT,
    oID INT,
    FOREIGN KEY (oID) REFERENCES orders(oID)
);

CREATE TABLE products (
    pID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    pName VARCHAR(30) NOT NULL,
    pPrice INT
);

CREATE TABLE orderDetail (
    oID INT,
    pID INT,
    odQTY INT,
    PRIMARY KEY (oID, pID),
    FOREIGN KEY (oID) REFERENCES orders(oID),
    FOREIGN KEY (pID) REFERENCES products(pID)
);

INSERT INTO orders (oName, oDate, oTotalPrice)
VALUES ('Order1', '2023-11-01 10:00:00', null),
       ('Order2', '2023-11-02 15:30:00', null),
       ('Order3', '2023-11-02 15:50:00', null);
       
INSERT INTO customers (cName, cAge, oID)
VALUES ('Customer1', 25, 1),
       ('Customer2', 30, 2),
       ('Customer3', 30, 3);
       
INSERT INTO products (pName, pPrice)
VALUES ('Product1', 100),
       ('Product2', 200);
       
INSERT INTO orderDetail (oID, pID, odQTY)
VALUES (1, 1, 2),
       (1, 2, 3),
       (2, 1, 1);

SELECT oID, oDate, oTotalPrice
FROM orders;

SELECT customers.cName AS 'Tên khách hàng', products.pName AS 'Tên sản phẩm đã mua'
FROM customers
LEFT JOIN orderDetail ON customers.cID = orderDetail.oID
LEFT JOIN products ON orderDetail.pID = products.pID;

SELECT customers.cID, customers.cName AS 'Tên khách hàng'
FROM customers
LEFT JOIN orderDetail ON customers.cID = orderDetail.oID
WHERE orderDetail.oID IS NULL;


SELECT orders.oID AS 'Mã hóa đơn',
       orders.oDate AS 'Ngày bán',
       SUM(orderDetail.odQTY * products.pPrice) AS 'Giá tiền'
FROM orders 
JOIN orderDetail ON orders.oID = orderDetail.oID
JOIN products ON orderDetail.pID = products.pID
GROUP BY orders.oID, orders.oDate;

