-- 2025.6.24

-- scott_05 에서 작업
-- 신규 테이블 생성 (CREATE + INSERT 별개였음)


-- 회원정보 테이블 삭제
DROP TABLE member_tbl;


-- 회원정보 테이블 생성
 CREATE TABLE member_tbl(   					-- MEMBER_TBL 이라는 테이블 생성
	mem_id     	number(3) 		PRIMARY KEY,  	-- mem_id 라는 이름의 컬럼, number(3)형식의 프라이머리키 (pk:UNIQUE, NOT NULL)
	mem_name  	varchar(50) 	NOT NULL,  		-- NOT NULL : 필수라는 뜻
	mem_age		number(3),
	mem_email	varchar(60)		NOT NULL UNIQUE,-- 필수, 중복허용x
	mem_address varchar(100) 
 );

SELECT * FROM member_tbl;


-- 방법1)  테이블 생성시 데이터, 테이블 구조 복사 (CREATE + INSERT)
DROP TABLE MEMBER_TBL_COPY;
CREATE TABLE member_tbl_copy
	AS SELECT * FROM member_tbl;

SELECT * FROM MEMBER_TBL_copy;	--CREATE만 했을 뿐인데 데이터까지 들어가있는 것을 볼 수 있음
								-- 즉, 구조도 복사하고 데이터도 복사한것임


--------------------
-- 방법2-1)  테이블 생성시 데이터를 제외한, 테이블 구조 복사 (CREATE) => 단, 제약조건은 복사되지 않는다
CREATE TABLE member_tbl_copy2
	AS SELECT * FROM member_tbl
		WHERE 0=1;  -- 이 조건은 FALSE 이므로 데이터를 가져오지 못하게 되는것.
					  -- 정말 자주 사용되는 내용임
SELECT * FROM MEMBER_TBL_copy2;

-- 방법2-2)  테이블에 데이터 복사(중요!!!!!!!!!!!!!!!!!!!!!!!!!!)
INSERT INTO MEMBER_TBL_COPY2
	SELECT * FROM member_tbl;		-- select한걸 해당 테이블에 INSERT 해주겠다는 뜻
COMMIT;								-- insert문이니까 꼭 commit하기



/* 12-3. 테이블의 구조를 변경하는 ALTER TABLE문
 * 
 * 1) 컬럼추가 : ADD 컬럼명 데이터타입
 *    컬럼추가를 하면 테이블의 맨끝에 컬럼이 추가된다.
 * 
 * [ 형식 ]
 * ALTER TABLE 테이블명
 * ADD 컬럼명 데이터타입
 * 
 * 2) 열이름 변경 : RENAME COLUMN old_컬럼 TO new_컬럼
 */


-- 1) 컬럼추가 : ADD 컬럼명 데이터타입
ALTER TABLE MEMBER_TBL_COPY
ADD mem_joindate DATE DEFAULT sysdate;

SELECT * FROM member_tbl_copy;


-- 2) 열이름 변경 : RENAME COLUMN old_컬럼 TO new_컬럼
ALTER TABLE MEMBER_TBL_COPY
RENAME COLUMN mem_joindate TO mem_join_date;



-------------------
/*  
 * 3) 컬럼의 자료형 변경 : MODIFY 컬럼명 데이터타입
 * => 기존 데이터는 그대로 유지하면서 데이터타입, 크기, 기본값을 변경한다.
 * 
 * [ 형식 ]
 * ALTER TABLE 테이블명
 * MODIFY 컬럼명 데이터타입
 */

 
-- 3) 컬럼 자료형 변경 : MODIFY
ALTER TABLE member_tbl_copy
MODIFY mem_email varchar(100);



/*
 * 4) 컬럼제거 : DROP COLUMN 컬럼명
 * => 기존 데이터는 그대로 유지
 * 
 * [형식]
 * ALTER TABLE 테이블명
 * DROP COLUMN 컬럼명
 */ 


-- 4) 컬럼 삭제 : DROP COLUMN
ALTER TABLE MEMBER_TBL_COPY
DROP COLUMN mem_join_date;

SELECT * FROM member_tbl_copy;		-- 기존데이터는 그대로 유지


/*
 * 5) 테이블 이름 변경 RENAME TO
 * 
 * [형식]
 * ALTER TABLE [old 테이블명] 
 * RENAME TO [new 테이블명] 
 
 * 또는
 RENAME [old 테이블명]  TO [new 테이블명];
 */

ALTER TABLE MEMBER_TBL_COPY2
RENAME TO member_tbl_rename;

SELECT * FROM member_tbl_copy2;
SELECT * FROM member_tbl_rename;


/*
 * 12-4. 테이블의 데이터를 전체 삭제하는 TRUNCATE문
 *   => 데이터정의어이므로 자동커밋되기 때문에 롤백이 되지 않는다.(WHERE절이 없는 DELETE(롤백이 된다)와 동일)
 * [형식]
 * TRUNCATE TABLE 테이블명
 */
SELECT * FROM member_tbl_rename;		-- 데이터 5건 존재
TRUNCATE TABLE member_tbl_rename;   	--> 데이터가 전부 삭제되고 테이블 틀만 남음(테이블은 존재) 


/* 12-5. 테이블을 삭제하는 DROP문
 *   => 테이블 자체 삭제
 * 
 * [형식]
 * DROP TABLE 테이블명
 */
DROP TABLE MEMBER_TBL_RENAME;



















