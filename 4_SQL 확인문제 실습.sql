#날짜 : 2022/06/14
#이름 : 김재원
#내용 : SQL 확인문제 실습

#실습하기 4-1
CREATE TABLE `tbl-member` (
	`memberID`VARCHAR(10)PRIMARY KEY,
	`memberName`VARCHAR(10)NOT null,
	`memberHp`CHAR(13)UNIQUE ,
	`memberAge`TINYINT ,
	`memberAddr`VARCHAR(20)
);
CREATE TABLE `tbl-product` (
	`productCode`INT AUTO_INCREMENT PRIMARY KEY,
	`productName` VARCHAR(10)NOT NULL,
	`price` INT NOT NULL,
	`amount` INT DEFAULT 0,
	`company` VARCHAR(10),
	`makeDate` DATE 
);

#실습하기 4-2

INSERT INTO `tbl-member` VALUES ('P101','김유신','010-1234-1001','25','신라');
INSERT INTO `tbl-member` VALUES ('P102','김춘추','010-1234-1002','23','신라');
INSERT INTO `tbl-member` (`memberId`,`memberName`,`memberAge`,`memberAddr`)VALUES ('P103','장보고','31','통일신라');
INSERT INTO `tbl-member` (`memberId`,`memberName`,`memberAddr`)VALUES ('P104','강감찬','고려');
INSERT INTO `tbl-member` (`memberId`,`memberName`,`memberHp`,`memberAge`) VALUES ('P105','이순신','010-1234-1005','25');

INSERT INTO `tbl-product` (`productName`,`price`,`amount`,`company`,`makeDate`) VALUES ('냉장고',800,10,'LG','2022-01-06');
INSERT INTO `tbl-product` (`productName`,`price`,`amount`,`company`,`makeDate`) VALUES ('노트북',1200,20,'삼성','2022-01-06');
INSERT INTO `tbl-product` (`productName`,`price`,`amount`,`company`,`makeDate`) VALUES ('TV',1400,6,'LG','2022-01-06');
INSERT INTO `tbl-product` (`productName`,`price`,`amount`,`company`,`makeDate`) VALUES ('세탁기',1000,8,'LG','2022-01-06');
INSERT INTO `tbl-product` (`productName`,`price`) VALUES ('컴퓨터',1100);
INSERT INTO `tbl-product` (`productName`,`price`,`amount`,`company`,`makeDate`) VALUES ('휴대폰',900,102,'삼성','2022-01-06');

#실습하기 4-3

SELECT `memberName` FROM `tbl-member`;
SELECT `memberName`, `memberHp` FROM `tbl-member`;
SELECT*FROM `tbl-member`WHERE`memberId`='p102';
SELECT*FROM `tbl-member`WHERE`memberId`='p104' OR `memberId`='p105'
SELECT*FROM `tbl-member`WHERE`memberAddr`='신라';
SELECT*FROM `tbl-member`WHERE`memberAge`>30;
SELECT*FROM `tbl-member`WHERE`memberHP` is NULL;
UPDATE `tbl-member` SET `memberAge`=42 WHERE `memberId`='p104';
UPDATE `tbl-member` SET `memberAddr`='조선' WHERE `memberID`='p105'
DELETE FROM `tbl-member` WHERE `memberID`='p103';
SELECT*FROM `tbl-member`;

SELECT `productName` FROM `tbl-product`;
SELECT `productName`,`price` FROM `tbl-product`;
SELECT*FROM `tbl-product` WHERE `company`='LG';
SELECT*FROM `tbl-product` WHERE `company`='삼성';
UPDATE `tbl-product` SET
	`company`='삼성',
	`makeDate`='2021-01-01'
	WHERE
	`productCode`=5;
	
	SELECT*FROM `tbl-product`;
	
	
# 실습하기 5-1	

CREATE TABLE `member` (
	`uid`VARCHAR(10)PRIMARY KEY,
	`name`VARCHAR(10) NOT NULL,
	`hp`CHAR(13) UNIQUE NOT null,
	`pos`VARCHAR(10) DEFAULT '사원',
	`dep`INT ,
	`rdate` DATETIME NOT null 
);
CREATE TABLE `department`(
	`depNo`INT PRIMARY KEY,
	`name`VARCHAR(10)NOT NULL, 
	`tel`TINYINT(12)
);
CREATE TABLE `sales` (
	`seq` INT PRIMARY KEY AUTO_INCREMENT,
	`uid`VARCHAR(10)NOT NULL,
	`year`YEAR NOT NULL,
	`month`TINYINT NOT NULL,
	`sale`INT NOT null
);

INSERT INTO `member` VALUES  ('a101','박혁거세','010-1234-1001','부장',101,1);