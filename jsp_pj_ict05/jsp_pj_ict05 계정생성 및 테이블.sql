/*6. 계정생성(System 계정에서) 1. ~ 2.*/

/* DBeaver에서는 Oracle 하위에 있는 Schemas를 새로고침하면 
자동으로 생성된 계정이 보인다. */

-- 오라클 설치(SYSTEM/ORACLE) 
-- SYSTEM계정에서 계정 생성
-- hr : sql developer-system_01계정에서 계정생성안해도 되고, 3.락해제 5.비밀번호변경만 한다.

-- 1. 계정생성 : jsp_pj_ict05 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
create user  jsp_pj_ict05 identified by tiger default tablespace users;

-- 2. 사용자 권한 부여
-- grant [시스템 권한] to [계정];
grant connect, resource, create view to jsp_pj_ict05;


-- 3. 락 해제
-- alter user <계정이름> account unlock;
alter user jsp_pj_ict05 account unlock;

-- 4. 계정 잘못만든 경우 계정, 객체 삭제하기 
-- drop user <계정이름> cascade;
-- drop user jsp_pj_ict05 cascade; 

-- 5. 패스워드 변경
-- alter user <계정이름> identified by <패스워드>;
-- alter user jsp_pj_ict05 identified by tiger; 

------------------------------------------------------------------------------------------------------

/*7. 테이블 생성*/
-- jsp_pj_ict05 계정에서 작업
-- 회원정보 테이블
DROP TABLE mvc_customer_tbl  CASCADE CONSTRAINTS;
CREATE TABLE mvc_customer_tbl(
    user_id         VARCHAR2(20)    PRIMARY KEY,    	-- ID
	user_password   VARCHAR2(20)    NOT NULL,          	-- 수정, 삭제용 비밀번호
	user_name   	VARCHAR2(50)    NOT NULL,          	-- 이름
	user_birthday   DATE            NOT NULL,          	-- 생년월일    
	user_address    VARCHAR2(50)    NOT NULL,          	-- 주소
	user_hp         VARCHAR2(13),                      	-- 핸드폰      
	user_email      VARCHAR2(50)    NOT NULL,          	-- 이메일
	user_regdate    TIMESTAMP       DEFAULT sysdate    	-- 가입일
); 
-- 테이블 생성했다면, 꼭 해당 스키마를 새로고침을 해야 하위의 테이블 목록에 생성된 것이 보임

SELECT * FROM MVC_CUSTOMER_TBL;

-------------------------

-- jsp_pj_ict05 계정에서 작업
-- 게시판 테이블
DROP TABLE mvc_board_tbl CASCADE CONSTRAINT;
CREATE TABLE mvc_board_tbl (
	b_num		number(7)		PRIMARY KEY,		-- 글번호
	b_title 	varchar2(100)	NOT NULL,			-- 글제목
	b_content 	clob 			NOT NULL,			-- 글내용
	b_writer	varchar2(30)	NOT NULL,			-- 작성자
	b_password	varchar2(30)	NOT NULL,			-- 수정, 삭제용 비밀번호
	b_readCnt	NUMBER(6)		DEFAULT 0,			-- 조회수
	b_regDate 	DATE			DEFAULT sysdate,	-- 작성일
	b_comment_count number(6)	DEFAULT 0			-- 댓글 개수
);

SELECT * FROM mvc_board_tbl ORDER BY b_num desc;
SELECT count(*) FROM mvc_board_tbl;

-- 게시글 입력(다건) -> 목록 확인용   ==> 실행엔 declare부터 end까지 다 잡아서 실행
DECLARE -- 선언문(프로시저)
	i 	NUMBER := 1; 	-- 변수 i에 1을 대입
BEGIN
	WHILE i <= 991 LOOP
		INSERT INTO mvc_board_tbl(b_num, b_title, b_content, b_writer, b_password, b_readCnt, b_regDate, b_comment_count)
			VALUES (i,'글제목'||i, '글내용'||i, '작성자'||i, 1234, 0, sysdate, 0 );
		i := i+1;
	END LOOP;
END;

COMMIT;

-- 게시글 목록

SELECT * 
  FROM 
  	(SELECT A.*							-- A 테이블에서 모든 것을 가져와
		, rownum AS rn
		FROM 
		  	(SELECT * FROM mvc_board_tbl
				ORDER BY b_num DESC)  A		-- 내림차순
	)
 WHERE rn BETWEEN 11 AND  20;				-- 1페이지 : rn 1~10, /2페이지 : rn 11~20 /3페이지 : rn : 21~30


-- 게시글 상세 페이지
SELECT * FROM mvc_board_tbl
 WHERE b_num = 991;
 
-- 조회수
UPDATE MVC_BOARD_TBL
	SET b_readCnt = b_readCnt + 1
WHERE b_num = 199;	-- 현재번호에 맞을 때만 조회수 + 1
COMMIT;


-- 게시글 수정 삭제 버튼 클릭시 -> 비밀번호 인증처리
SELECT count(*) AS cnt FROM MVC_BOARD_TBL
 WHERE b_num = 1
   AND b_password = 1234;


-- 게시글 수정
UPDATE mvc_board_tbl
   SET b_password = '1111'
   	 , b_title='제목입니당 ㅋ'
   	 , b_content='곰세마리가 한 집에 있어 아빠곰 엄마곰 애기곰 아빠곰은 뚱뚱해 엄마곰은 날씬해 애기곰은 너무 귀여워 으쓱 으쓱 잘 한다'
 WHERE b_num = 991;
COMMIT;


-- 게시글 삭제
DELETE FROM MVC_BOARD_TBL
 WHERE b_num = 991;


-- 게시글 추가
INSERT INTO mvc_board_tbl(b_num, B_TITLE, B_WRITER, B_CONTENT, B_PASSWORD, B_COMMENT_COUNT, B_READCNT, B_REGDATE)
	values(992, '제목', '작성자', '내용', '1234', 0, 0, sysdate);


-- 삭제 시, b_show 컬럼을 'N'으로 수정, 리스트에서 b_show 컬럼이 'Y'인 것만 조회
ALTER TABLE mvc_board_tbl
	ADD b_show varchar2(1) DEFAULT 'Y';


-- 댓글등록시 갯수 업데이트
UPDATE MVC_BOARD_TBL SET b_comment_count = b_comment_count+1
WHERE b_num = 995;



----------- [ 댓글 ] ------------------------------

-- 게시판 댓글테이블
DROP TABLE mvc_comment_tbl  CASCADE CONSTRAINTS;
CREATE TABLE mvc_comment_tbl(  
	c_comment_num     NUMBER(7)  	PRIMARY KEY,      -- PK, 댓글 일련번호
   	c_board_num       NUMBER(7)  	REFERENCES   mvc_board_tbl(b_num),   -- FK, 게시글 번호
    c_writer          VARCHAR2(30)  NOT NULL,       -- 작성자
    c_content         CLOB  		NOT NULL,              -- 글내용
   	c_regDate         Date  		DEFAULT sysdate       -- 등록일
);

SELECT * FROM mvc_comment_tbl;
 -- 댓글 작성페이지
INSERT INTO mvc_comment_tbl(c_comment_num, c_board_num, c_writer, c_content, c_regDate)
 VALUES((SELECT NVL(MAX(c_comment_num)+1, 1) FROM mvc_comment_tbl), 991, '작성자1', '글내용1', sysdate);
COMMIT;  


-- 댓글목록
SELECT *
   FROM
  	(SELECT A.*
  	, rownum AS rn
  		FROM 
  		(SELECT * FROM MVC_COMMENT_TBL c,
  						mvc_board_tbl b
  			WHERE b.b_num = c.c_board_num
  			  AND b_num = 991
  			ORDER BY c_comment_num DESC) A
  	)
  	ORDER BY rn desc;


----------------------------------------------------------------------------------------
----------- [ 상품정보 ] ------------------------------
1)  [ 상품정보 TABLE ]-----------
 DROP TABLE mvc_product_tbl CASCADE CONSTRAINTS;
 CREATE TABLE mvc_product_tbl(
    pdNo        NUMBER(7)  PRIMARY KEY,           	-- 상품번호
    pdName      VARCHAR2(100)  NOT NULL UNIQUE,    	-- 상품명
    pdBrand     VARCHAR2(50) NOT NULL,            	-- 상품브랜드
    pdImg       VARCHAR2(100) NOT NULL,            	-- 상품이미지
    pdCategory  VARCHAR2(50) NOT NULL,             	-- 상품카테고리
    pdContent   CLOB,                               -- 상품설명
    pdPrice     NUMBER(9) NOT NULL,                	-- 상품가격
    pdQuantity  NUMBER(9) NOT NULL,                	-- 상품등록 수량
    pdStatus    VARCHAR2(20) NOT NULL,             	-- 상품상태코드
    pdIndate    DATE  DEFAULT sysdate              	-- 상품등록일
 );

-- clob : 대용량 텍스트 자료형
-- blob : 대용량 바이너리 자료형

SELECT * FROM mvc_product_tbl;

ALTER TABLE mvc_product_tbl
  ADD show char(1) DEFAULT 'Y';

SELECT * FROM
	(SELECT A.*, 
		rownum AS rn
			FROM (SELECT * FROM mvc_product_tbl
					WHERE show='Y'
					ORDER BY pdNo DESC) A
	)
	WHERE rn BETWEEN 1 AND 10;

-- 상세페이지
SELECT * FROM mvc_product_tbl
WHERE pdNo = 1;

-- 상품 수정
UPDATE mvc_product_tbl
  SET pdName = '12345'
    , pdBrand='브랜드123'
    , pdImg = 'img'
    , pdCategory = ''
    , pdContent = ''
    , pdPrice = 194812
    , pdQuantity = 124
    , pdStatus = ''
 WHERE pdNo = 9;
COMMIT;


-- 내용삭제 --------------------------------
DELETE FROM MVC_CUSTOMER_TBL ;
DELETE FROM mvc_board_tbl;
DELETE FROM mvc_comment_tbl;


