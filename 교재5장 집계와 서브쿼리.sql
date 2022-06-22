#날짜 : 0000/00/00
#이름 : 김철학
#내용 : 교재 5장 집계와 서브쿼리

###############################
#20강 행 개수 구하기
###############################
#테이블 생성/데이터 저장
create TABLE `sample51` (
	`no`INT,
	`name`VARCHAR(10),
	`quantity`INT
);
INSERT INTO `sample51` VALUES (1,'A',1);
INSERT INTO `sample51` VALUES (2,'A',2);
INSERT INTO `sample51` VALUES (3,'B',10);
INSERT INTO `sample51` VALUES (4,'C',3);
INSERT INTO `sample51` VALUES (5,null,null);
#p183
SELECT * FROM sample51;
SELECT COUNT(*) from sample51;
#p185
SELECT * FROM sample51 WHERE NAME ='A';
SELECT COUNT(*) FROM sample51 WHERE NAME = 'A';
#p186
SELECT * FROM sample51;
SELECT COUNT(NO), COUNT(NAME) FROM sample51;
#p187
SELECT * FROM sample51;
#p188
SELECT ALL NAME FROM sample51;
SELECT DISTINCT NAME FROM sample51;
#p189
SELECT COUNT(ALL NAME),COUNT(DISTINCT NAME) FROM sample51;


###############################
#21강 COUNT 이외의 집계함수
###############################
#p191
SELECT SUM(quantity)FROM sample51;
#p192
SELECT * FROM sample51;
SELECT AVG(quantity),SUM(quantity)/COUNT(quantity)FROM sample51;
SELECT AVG(case when quantity IS NULL then 0 ELSE quantity END) AS avgnull0 FROM sample51;
#p193
SELECT * FROM sample51;
SELECT MIN(quantity),MAX(quantity),MIN(NAME),MAX(NAME) FROM sample51;

###############################
#22강 그룹화-GROUP BY
###############################
#p195
SELECT * FROM sample51;
SELECT NAME FROM sample51 GROUP BY NAME;
#p197
SELECT NAME, COUNT(NAME), SUM(quantity) FROM sample51 GROUP BY name;
#p199
SELECT NAME, COUNT(NAME) FROM sample51 GROUP BY NAME;
select NAME, COUNT(NAME) FROM sample51 GROUP BY NAME HAVING COUNT(NAME) =1;
#p202
SELECT NO, quantity FROM sample51 GROUP BY NO, quantity;

###############################
#23강 서브쿼리
###############################
#테이블 생성/데이터 저장
create TABLE `sample54` (
	`no`TINYINT,
	`a`INT
);
INSERT INTO sample54 VALUES(1,100);
INSERT INTO sample54 VALUES(2,900);
INSERT INTO sample54 VALUES(3,20);
INSERT INTO sample54 VALUES(4,80);
#p205
SELECT * FROM sample54;
SELECT MIN(a) FROM sample54;
#p206
DELETE FROM sample54 WHERE a=(SELECT MIN(a) FROM sample54);
SELECT * FROM sample54;
#p207
SELECT MIN(a) FROM sample54;
SELECT NO FROM sample54;
SELECT MIN(a),MAX(NO) FROM sample54;
#p208
SELECT NO, a FROM sample54;
#p210
SELECT 
	(select COUNT(*)FROM sample51) AS sq1,
	(SELECT COUNT(*)FROM sample54) AS sq2; 
SELECT 
	(select COUNT(*)FROM sample51) AS sq1,
	(SELECT COUNT(*)FROM sample54) AS sq2 FROM DUAL;
#p211
UPDATE sample54 SET a = (SELECT MAX(a) FROM sample54);
#p212
SELECT * FROM (SELECT*FROM SAMPLE54)sq;
SELECT * FROM (SELECT*FROM SAMPLE54) AS sq;
#p213
SELECT * FROM (SELECT*FROM(SELECT*FROM sample54)sq1)sq2;

#테이블 생성/데이터 저장
create TABLE `sample541` (
	`a`INT,
	`b`INT
);
#p214
INSERT INTO sample541 VALUES (
(SELECT COUNT(*) FROM sample51),
(SELECT COUNT(*) FROM sample54));
SELECT * FROM sample541;
INSERT INTO sample541 SELECT 1,2;
SELECT * FROM sample541;
#p215
INSERT INTO sample542 select * FROM sample543;


###############################
#24강 상관 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample551` (
	`no`INT,
	`a`VARCHAR(10)
);
INSERT INTO sample551 VALUES (1,NULL);
INSERT INTO sample551 VALUES (2,NULL);
INSERT INTO sample551 VALUES (3,NULL);
INSERT INTO sample551 VALUES (4,NULL);
INSERT INTO sample551 VALUES (5,NULL);

CREATE TABLE `sample552` (
	`no2`INT
);
INSERT INTO sample552 VALUES (3);
INSERT INTO sample552 VALUES (5);
#p217
SELECT * FROM sample551;

SELECT * FROM sample552;
#p218
UPDATE sample551 SET a = '있음' WHERE EXISTS(SELECT*FROM sample552 WHERE NO2=`NO`);

SELECT * FROM sample551;
#p219
UPDATE sample551 SET a = '없음' WHERE NOT EXISTS(SELECT*FROM sample552 WHERE NO2=`no`);

SELECT * FROM sample551;
#p221
UPDATE sample551 SET a = '있음'WHERE 
EXISTS(SELECT* FROM sample552 WHERE sample552.no2=sample551.`no`);
#p222 
SELECT * FROM sample551
WHERE NO IN(3,5);

SELECT * FROM sample551 WHERE NO IN(SELECT NO2 FROM sample552);