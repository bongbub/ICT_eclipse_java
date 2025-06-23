

--    2025.6.23
-- [ JDBC 테이블 생성 ] --



-- 1) 도서정보 테이블
DROP TABLE mvc_book_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_book_tbl(
	bookid 		NUMBER(4)		PRIMARY KEY,	-- 도서번호
	title       VARCHAR2(50)	NOT NULL,		-- 도서명
	author		VARCHAR2(50)	NOT NULL,		-- 저자
	publisher	VARCHAR2(50)	NOT NULL, 		-- 출판사
	price		NUMBER(7)		NOT NULL,		-- 가격
	pubdate		DATE      		DEFAULT sysdate	-- 출판일
);

SELECT * FROM mvc_book_tbl ORDER BY BOOKID asc;
SELECT max(bookId) FROM MVC_BOOK_TBL mbt;
SELECT nvl(max(bookId) + 1, 0) FROM MVC_BOOK_TBL mbt;
-- nvl(x1, x2) x1이 null이면 x2
-- max 값을 읽어서 1을 더해줄건데(갯수가 늘어나니까)
-- 만약 null이거든, 0으로 대체하고 아니면 max(bookId)에 1을 더해라
DELETE FROM MVC_BOOK_TBL;
COMMIT;

--UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]


