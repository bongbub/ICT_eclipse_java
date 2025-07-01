DROP TABLE board_tbl;
CREATE TABLE board_tbl(
	boardNum number(6) PRIMARY KEY NOT NULL,
	writer  varchar2(20) NOT NULL,
	title   varchar2(50) NOT NULL,
	registerDate DATE DEFAULT sysdate
);

SELECT * FROM board_tbl;

INSERT INTO board_tbl(boardNum, writer, title)
 values(001, '하이요', '제목입니다');
INSERT INTO board_tbl(boardNum, writer, title)
 values(002, '훠궈먹고싶다', '마라탕개꿀조합알려준다');
INSERT INTO board_tbl(boardNum, writer, title)
 values(003, '굽네치킨아님', '고추바사삭이 치킨근본 아님?');