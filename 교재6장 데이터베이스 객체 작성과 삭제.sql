#날짜 : 0000/00/00
#이름 : 김재원
#내용 : 교재 6장 데이터베이스 객체 작성과 삭제

###############################
#26강 테이블 작성,삭제,변경
###############################
#p234
CREATE TABLE sample62(
NO INTEGER NOT NULL,
a VARCHAR(30),
b DATE);

DESC sample62;
#p237
ALTER TABLE sample62 ADD newcol INTEGER;

DESC sample62;
#p238
ALTER TABLE sample62 MODIFY newcol VARCHAR(20);

DESC sample62;
#p239
ALTER TABLE sample62 CHANGE newcol c VARCHAR(20);

DESC sample62;

ALTER TABLE sample62 DROP c;

DESC sample62;

###############################
#27강 제약
###############################
#p243
CREATE TABLE sample631(
a integer NOT NULL,
b integer NOT NULL UNIQUE,
c VARCHAR(30)
);

drop TABLE sample632(
`NO` INTEGER NOT NULL,
sub_no integer NOT NULL,
`NAME` VARCHAR(30),
PRIMARY KEY(NO, sub_no)
);
#p244
CREATE TABLE sample632(
 no INTEGER NOT NULL,
sub_no INTEGER NOT NULL,
NAME VARCHAR(30),
CONSTRAINT pkey_sample PRIMARY KEY(no,sub_no)
);
#p245
ALTER TABLE sample631 MODIFY c VARCHAR(30);
ALTER TABLE sample631 DROP CONSTRAINT pkey_sample631;
ALTER TABLE sample631 DROP PRIMARY KEY;
#p246
CREATE TABLE sample634(
	p INTEGER NOT NULL,
	a VARCHAR(30),
	CONSTRAINT pkey_sample634 PRIMARY KEY(p)
	);
#p247
INSERT INTO sample634 VALUES (1,'첫째줄');
INSERT INTO sample634 VALUES (2,'둘째줄');
INSERT INTO sample634 VALUES (3,'셋째줄');

INSERT INTO sample634 VALUES (2,'넷째줄');

UPDATE sample634 SET p2 WHERE p=3;

#p248
SELECT a,b FROM sample635;
###############################
#29강 인덱스 작성과 삭제
###############################
#p258
CREATE INDEX isample65 ON sample62(`no`);
#p259
DROP INDEX isample65 ON sample62;
#p260
EXPLAIN SELECT*FROM sample62 WHERE a='a';
#p261
EXPLAIN SELECT*FROM sample62 WHERE NO>10;


###############################
#30강 뷰 작성과 삭제
###############################
#p266
CREATE VIEW sample_view_67 AS SELECT*FROM sample54;

SELECT * FROM sample_view_67;
#p267
DROP VIEW sample_view_67;