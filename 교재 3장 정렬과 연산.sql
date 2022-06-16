#날짜 : 2022/06/15
#이름 : 김철학
#내용 : 교재 3장 정렬과 연산

#테이블 생성/데이터 저장
CREATE TABLE `sample31` (
	`name`VARCHAR(10),
	`age`TINYINT,
	`address`VARCHAR(50)
);
INSERT INTO `sample31` VALUES ('A씨',36,'대구광역시 중구');
INSERT INTO `sample31` VALUES ('B씨',18,'부산광역시 연제구');
INSERT INTO `sample31` VALUES ('C씨',25,'서울특별시  중구');

#p95
SELECT * FROM sample31;
SELECT * FROM sample31 ORDER BY age;
#p96
SELECT * FROM sample31;
SELECT * FROM sample31 ORDER BY address;
#p98
SELECT * FROM sample31 ORDER BY age DESC;
SELECT * FROM sample31 ORDER BY age ASC;
#테이블 생성/데이터 저장
CREATE TABLE `sample311` (
	`a`VARCHAR(10),
	`b`TINYINT
);
INSERT INTO `sample311` VALUES ('1',1);
INSERT INTO `sample311` VALUES ('10',10);
INSERT INTO `sample311` VALUES ('11',11);
INSERT INTO `sample311` VALUES ('2',2);
#p100
SELECT * FROM sample311 ORDER BY a;
SELECT * FROM sample311 ORDER BY b;

#테이블 생성/데이터 저장
CREATE TABLE `sample32` (
	`a`INT,
	`b`INT 
);
INSERT INTO `sample32` VALUES (1,1);
INSERT INTO `sample32` VALUES (2,1);
INSERT INTO `sample32` VALUES (2,2);
INSERT INTO `sample32` VALUES (1,3);
INSERT INTO `sample32` VALUES (1,2);
#p103
SELECT * FROM sample32;
#p104
SELECT * FROM sample32 ORDER BY a;
#p105
SELECT * FROM sample32 ORDER BY a,b;
SELECT * FROM sample32 ORDER BY b,a;
#p106
SELECT * FROM sample32 ORDER BY a ASC, b DESC;

#테이블 생성/데이터 저장
CREATE TABLE `sample33` (
	`no`INT
);
INSERT INTO `sample33` VALUES (1);
INSERT INTO `sample33` VALUES (2);
INSERT INTO `sample33` VALUES (3);
INSERT INTO `sample33` VALUES (4);
INSERT INTO `sample33` VALUES (5);
INSERT INTO `sample33` VALUES (6);
INSERT INTO `sample33` VALUES (7);
#p109
SELECT * FROM sample33;
#p110
SELECT * FROM sample33 LIMIT 3;
#p111
SELECT * FROM sample33 ORDER BY NO DESC LIMIT 3;
#p113
SELECT * FROM sample33 LIMIT 3 OFFSET 0;
SELECT * FROM sample33 LIMIT 3 OFFSET 3;

#테이블 생성/데이터 저장
CREATE TABLE `sample34` (
	`no`INT PRIMARY KEY,
	`price`INT,
	`quantity`INT
);
INSERT INTO `sample34` VALUES (1,100,10);
INSERT INTO `sample34` VALUES (2,230,24);
INSERT INTO `sample34` VALUES (3,1980,1);
#p117
SELECT * FROM sample34;
#p118
SELECT *, price * quantity FROM sample34;
SELECT *, price*quantity AS amount FROM sample34;
#p121
SELECT *, price*quantity AS amount FROM sample34;
SELECT *, price*quantity AS amount FROM sample34
WHERE price * quantity >= 2000;
#p124
SELECT *, price*quantity AS amount FROM sample34;
SELECT *, price*quantity AS amount FROM sample34
ORDER BY price*quantity DESC;
#p125
SELECT *, price*quantity AS amount FROM sample34;
SELECT *, price*quantity AS amount FROM sample34
ORDER BY amount DESC;

#테이블 생성/데이터 저장
DROP TABLE `sample341`;

CREATE TABLE `sample341` (
	`amount`DECIMAL(6,2),
	`round(amount)`INT 
);
INSERT INTO `sample341` VALUES (5961.60,5962);
INSERT INTO `sample341` VALUES (2138.40,2138);
INSERT INTO `sample341` VALUES (1080.00,1080);
#p127
SELECT amount, ROUND(amount) FROM sample341;
#p128
SELECT amount, ROUND(amount,1) FROM sample341;
#p129
SELECT amount, ROUND(amount,-2)FROM sample341;

#테이블 생성/데이터 저장
CREATE TABLE `sample35` (
	`no`INT PRIMARY KEY,
	`price`INT,
	`quantity`INT,
	`unit`VARCHAR(10)
);

INSERT INTO `sample35` VALUES (1,100,10,'개');
INSERT INTO `sample35` VALUES (2,230,24,'캔');
INSERT INTO `sample35` VALUES (3,1980,1,'장');
#p132
SELECT CONCAT(quantity,unit)FROM sample35;
#p137
SELECT CURRENT_TIMESTAMP;
#p139
SELECT CURRENT_DATE+INTERVAL 1 DAY;

#테이블 생성/데이터 저장
CREATE TABLE `sample37` (
	`a`INT
);
INSERT INTO `sample37` VALUES (1);
INSERT INTO `sample37` VALUES (2);
INSERT INTO `sample37` VALUES (null);
#p142
SELECT a, case when a IS NULL then 0 ELSE a END "a(null=0)"FROM sample37;
#p144
SELECT a AS "코드",
case
 when a = 1 then '남자'
 when a = 2 then '여자'
 ELSE '미지정'
 END AS "성별"FROM sample37;
#p145
SELECT a AS "코드",
case a 
	when 1 then '남자'
	when 2 then '여자'
	ELSE '미지정'
	END AS "성별"FROM sample37;
#p147

case 
	when a = 1 then '남자'
	when a = 2 then '여자'
	when a IS NULL then '데이터 없음'
	ELSE '미지정'
	end