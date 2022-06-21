#날짜: 2022/06/20
#이름: 김재원
#내용: SQL 연습문제

#문제1
CREATE TABLE `Book` (
	`bookid` int NOT NULL AUTO_INCREMENT,
	`bookname`VARCHAR(20),
	`publisher`VARCHAR(20),
	`price`INT,
	PRIMARY KEY(`bookid`)
);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('축구의 역사','굿스포츠',7000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('축구아는 여자','나무수',13000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('축구의 이해','대한미디어',22000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('골프 바이블','대한미디어',35000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('피겨 교본','굿스포츠',8000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('역도 단계별기술','굿스포츠',6000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('야구의 추억','이상미디어',20000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('야구를 부탁해','이상미디어',13000);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('올림픽 이야기','삼성당',7500);
INSERT INTO `Book`(`bookname`,`publisher`,`price`) VALUES ('Olympic Champions','Pearson',13000);

#문제2

CREATE TABLE `Customer` (
	`custid` int NOT NULL AUTO_INCREMENT,
	`name`VARCHAR(20),
	`address`VARCHAR(20),
	`phone`VARCHAR(13) DEFAULT NULL ,
	PRIMARY KEY(`custid`)
);
INSERT INTO `customer` (`name`,`address`,`phone`) VALUES('박지성','영국 맨체스터','000-5000-0001');
INSERT INTO `customer` (`name`,`address`,`phone`) VALUES('김연아','대한민국 서울','000-6000-0001');
INSERT INTO `customer` (`name`,`address`,`phone`) VALUES('장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `customer` (`name`,`address`,`phone`) VALUES('추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `customer` (`name`,`address`,`phone`) VALUES('박세리','대한민국 대전',NULL);
#문제3
CREATE TABLE `Orders` (
	`orderid` int NOT NULL AUTO_INCREMENT,
	`custid`INT ,
	`bookid`INT ,
	`saleprice`INT ,
	`orderdate` DATE,
	PRIMARY KEY(`orderid`)
);
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(1,1,6000,'2014-07-01');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(1,3,21000,'2014-07-03');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(2,5,8000,'2014-07-03');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(3,6,6000,'2014-07-04');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(4,7,20000,'2014-07-05');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(1,2,12000,'2014-07-07');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(4,8,13000,'2014-07-07');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(3,10,12000,'2014-07-08');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(2,10,7000,'2014-07-09');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES(3,8,13000,'2014-07-10');

#문제4
SELECT `custid`,`name`,`address` FROM `customer`;

#문제5
SELECT `bookname`, `price` FROM `book` ;

#문제6
SELECT `price` ,`bookname`FROM `book` ;

#문제7
SELECT * FROM `book`;

#문제8
SELECT `publisher` FROM `book`;

#문제9
SELECT DISTINCT `publisher` FROM `book`;
#문제10
SELECT * FROM `book` WHERE `price`>=20000;

#문제11
SELECT * FROM `book` WHERE `price`<=20000;

#문제12
SELECT * FROM `book` WHERE `price`<=20000 AND `price`>=10000;
SELECT * FROM `book` WHERE `price` BETWEEN 10000 AND 20000;

#문제13
SELECT `bookid`,`bookname`,`price`FROM `book` WHERE `price`<=30000 AND `price`>=15000;

#문제14
SELECT * FROM `book` WHERE `bookid` = '2' OR `bookid` = '3' OR `bookid` = '5';

#문제15
SELECT * FROM `book` WHERE MOD(`bookid`,2)=0;
SELECT * FROM `book` WHERE `bookid`%2=0;

#문제16
SELECT * FROM `customer` WHERE `name` LIKE '박__';

#문제17
SELECT * FROM `customer` WHERE `address` LIKE '대한민국%';

#문제18
SELECT * FROM `customer` WHERE `phone` is NOT NULL;

#문제19
SELECT * FROM `book` WHERE `publisher` = '굿스포츠' OR `publisher` = '대한미디어';

#문제20
SELECT `publisher` FROM `book` WHERE `bookname` = '축구의 역사';

#문제21
SELECT `publisher` FROM `book` WHERE `bookname`LIKE '축구%';

#문제22
SELECT * FROM `book` WHERE `bookname` like '_구%';

#문제23
SELECT * FROM `book` WHERE `bookname`LIKE '%축구%' AND `price`>=20000;

#문제24
SELECT * FROM `book` ORDER BY  `bookname` asc;

#문제25
SELECT * FROM `book` ORDER BY `price` , `bookname`ASC ;

#문제26
SELECT * FROM `book` ORDER BY `price` DESC,`bookname` ASC ;

#문제27
SELECT * FROM `book` ORDER BY `price` DESC LIMIT 3;

#문제28
SELECT * FROM `book` ORDER BY `price` aSC LIMIT 3;

#문제29
SELECT SUM(saleprice) AS `총판매액` FROM `orders`;

#문제30
SELECT 
	SUM(`saleprice`) AS `총판매액`,
	AVG(`saleprice`) AS `평균값`,
	MIN(`saleprice`) AS `최저가`,
	MAX(`saleprice`) AS `최고가`
FROM
	`orders`;
	
#문제31
SELECT COUNT(*) AS `판매건수`FROM `orders`;

#문제32
SELECT`bookid`, REPLACE(`bookname`,'야구','농구') AS `bookname`,
`publisher`, `price` FROM `book`;

#문제33
SELECT `custid`,COUNT(`orderid`)AS `수량` FROM `orders` 
WHERE `saleprice` >= 8000
GROUP BY `custid`
HAVING `수량`>=2;

#문제34
SELECT * FROM `customer` AS a
JOIN `orders` AS b
ON a.custid = b.custid
ORDER BY a.`custid`;

SELECT * FROM `customer` AS a,`orders` AS b WHERE a.custid = b.custid;

#문제35
SELECT * FROM `customer` 
JOIN `orders`  
USING(`custid`);

#문제36
SELECT `name`, `saleprice` FROM `customer` AS a
JOIN `orders` AS b
ON a.custid = b.custid
ORDER BY a.`custid`;

#문제37
SELECT `name`, SUM(`saleprice`) FROM `orders` AS a 
JOIN `customer` AS b
ON a.custid = b.custid
GROUP BY a.custid
ORDER BY `name`;

#문제38
SELECT `name`, `bookname` FROM `customer` AS a 
JOIN `orders` AS b ON a.custid = b.custid
JOIN `book` AS c on b.bookid = c.bookid;

#문제39
SELECT `name`, `bookname` FROM `customer` AS a 
JOIN `orders` AS b ON a.custid = b.custid
JOIN `book` AS c on b.bookid = c.bookid
WHERE `saleprice`=20000;

#문제40
SELECT `name`,`saleprice` FROM `orders` AS a
right JOIN `customer` AS b
ON a.custid = b.custid;

#문제 41
SELECT `bookname` FROM `book`
WHERE `price`=(SELECT MAX(`price`) FROM `book`);

#문제42
SELECT `name` FROM `customer`
left JOIN`orders`
USING(`custid`)
WHERE `orderid` IS NULL ;

#문제43
SELECT SUM(`saleprice`)AS `총매출` FROM `customer` AS a
JOIN `orders`AS b
ON a.custid = b.custid
WHERE `name`='김연아';

#문제44
INSERT INTO `book`(bookname,publisher,price) VALUES('스포츠의학','한솔의학서적',NULL);

#문제45
UPDATE `customer` SET `address`='대한민국 부' where `custid`=5;

#문제46
DELETE FROM `customer` WHERE `custid`=5;