

--    2025.6.23
-- [ JDBC 테이블 생성 ] --



-- 1) 도서정보 테이블
DROP TABLE mvc_book_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_book_tbl(
	bookId 		NUMBER(4)		PRIMARY KEY,	-- 도서번호
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

---------------------------------------------------------------------

--2) 게시판 테이블 (scott_05 계정에서 생성)

DROP TABLE mvc_board_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_board_tbl(
	boardNo			number(7) 		PRIMARY KEY,   	-- 글번호
	boardTitle 		varchar2(50)	NOT NULL,      	-- 글 제목
	boardContent	CLOB			NOT NULL,		-- 글내용
	boardId			varchar2(50) 	NOT NULL,		-- 작성자
	boardRegDate	DATE DEFAULT sysdate				-- 작성일
);

SELECT * FROM mvc_board_tbl;

------------------------------------------------------------------------

DROP TABLE mvc_lol_tbl CASCADE CONSTRAINTS;
CREATE TABLE mvc_lol_tbl(
	champId		NUMBER(7)			PRIMARY KEY,
	champName	varchar2(50)		NOT NULL,	--챔피언명
	qSkill		varchar2(50)		NOT NULL,
	wSkill		varchar2(50)		NOT NULL,
	eSkill		varchar2(50)		NOT NULL,
	rSkill		varchar2(50)		NOT NULL,
	mainLine	varchar2(10)		NOT NULL,
	subLine		varchar2(10)		NOT NULL,
	winPc		number(5,2)			
);

SELECT * FROM mvc_lol_tbl;

INSERT INTO mvc_lol_tbl (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '룰루', '반짝반짝 창', '변덕쟁이', '도와줘, 픽스!', '급성장', '서폿', '탑', 50.53);

INSERT INTO mvc_lol_tbl (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '시비르', '부메랑 검', '튕기는 부메랑', '주문 방어막', '사냥 개시', '원딜', '미드', 52.24);
INSERT INTO mvc_lol_tbl (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '브라움', '동상', '내가 지킨다', '불굴', '빙하 균열', '서폿', '서폿', 52.29);
INSERT INTO mvc_lol_tbl (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '리신', '음파 / 공명의 일격', '방호 / 강철의 의지', '폭풍 / 무력화', '용의 분노', '정글', '탑', 51.34);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '루시안', '꿰뚫는 빛', '타는 불길', '끈질긴 추격', '빛의 심판', '원딜', '미드', 51.36);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '판테온', '혜성의 창', '방호의 도약', '방패 돌격', '거대 유성', '정글', '서폿', 50.58);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '조이', '통통별', '주문도둑', '헤롱헤롱쿨쿨방울', '차원넘기', '미드', '서폿', 52.00);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '트위스티드 페이트', '와일드 카드', '카드 뽑기', '속임수 덱', '운명', '미드', '탑', 51.76);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '갱플랭크', '혀어어어업상', '괴혈병치료', '화약통', '포탄 셰레', '탑', '미드', 50.75);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '이렐리아', '칼날 쇄도', '저항의 춤', '쌍검협무', '선봉진격검', '탑', '미드', 51.16);
INSERT INTO MVC_LOL_TBL (CHAMPID, CHAMPNAME, QSKILL, WSKILL, ESKILL, RSKILL, MAINLINE, SUBLINE, WINPC)
 VALUES ((SELECT nvl(max(champId)+1,1) FROM MVC_LOL_TBL), '르블랑', '악의의 인장', '왜곡', '환영사슬', '모방', '미드', '서폿', 50.99);




