-- 2025.6.24
-- 복습


--scott_05에서 작업
DROP TABLE member_tbl_re;
 CREATE TABLE member_tbl_re(   					-- MEMBER_TBL 이라는 테이블 생성
	mem_id     	number(3) 		PRIMARY KEY,  	-- mem_id 라는 이름의 컬럼, number(3)형식의 프라이머리키 (pk:UNIQUE, NOT NULL)
	mem_name  	varchar(50) 	NOT NULL,  		-- NOT NULL : 필수라는 뜻
	mem_age		number(3),
	mem_email	varchar(60)		NOT NULL UNIQUE,-- 필수, 중복허용x
	mem_address varchar(100) 
 );

SELECT FROM member_tbl_re;



-- 테이블 생성시 데이터+테이블 구조 복사 (Create+insert)
DROP TABLE member_tbl_re;
CREATE TABLE member_tbl_copy_re
 AS SELECT * FROM member_tbl_re;

SELECT * FROM member_tbl_copy_re;

-- 테이블 생성시 데이터를 제외한 테이블 구조 복사
-- ! 단 제약 조건은 복사되지 않는다
CREATE TABLE member_tbl_copy2_re
 AS SELECT * FROM member_tbl
 	WHERE 0=1;		--조건이 false이므로 데이터를 가져오지 못함.

SELECT * FROM member_tbl_copy2_re;


-- 테이블에 데이터 복사
INSERT INTO member_tbl_copy2_re
 SELECT * FROM member_tbl_re;


-- 테이블 구조 변경하는 ALTER 
-- 컬럼추가 : ADD 컬럼명 데이터타입

--1 컬럼추가 : ADD 컬럼명 데이터타입
ALTER TABLE member_tbl_copy_re
ADD mem_joindate DATE DEFAULT sysdate;

--2 열이름 변경 : RENAME COLUMN 예전컬럼 TO 뉴컬럼
ALTER TABLE member_tbl_copy_re
RENAME COLUMN mem_joindate TO mem_join_date;

--3 컬럼자료형 변경 : MODIFY 컬럼명 바꿀자료형
ALTER TABLE member_tbl_copy_re
MODIFY mem_eamil varchar(60);

-- 컬럼제거 : DROP column 컬럼명
ALTER TABLE member_tbl_copy_re
DROP COLUMN mem_join_date;

---------------------------------------
--테이블 이름 변경 : RENAME TO 새로운테이블명

ALTER TABLE member_tbl_copy_re
RENAME TO member_tbl_copy_ree;

-- 테이블 데이터 전체 삭제 : TRUNCATE TABLE 테이블명
-- => 데이터정의어이므로 자동커밋되기때문에 Rollback안됨
TRUNCATE TABLE member_tbl_copy_ree;


-- 테이블 자체 삭제 : DROP TABLE 테이블명
DROP TABLE member_tbl_copy2_re;



