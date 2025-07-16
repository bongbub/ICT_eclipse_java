 -- 2025.6.20
 -- 
 
 -- ========================
 -- scott_05 계정에서 작업할 것.
 -- ========================
 
 
 
 /*
-- DDL(Data Definition Language : 데이터 정의어) : CREATE, ALTER, DROP, TRUNCATE
                  => AUTO COMMIT
-- DML(Data Manipulation Language : 데이터 조작어) : INSERT, UPDATE, DELETE
                  => COMMIT, ROLLBACK
-- DQL(Data Query Language : 데이터 질의어) : SELECT
-- DCL(Data Control Language : 데이터 제어) : GRANT, REVOKE
-- TCL(Transaction Control Language : 트랜잭션 콘트롤 제어) : COMMIT, ROLLBACK
*/
 
 
 -- 테이블 목록 조회
 -- SELECT * FROM tab;				-- => DBeaver에선 지원 안하는 명령어

  -- 데이터 확인
 -- desc member_tbl   -- 테이블 구조 확인 => DBeaver에선 지원 안하는 명령어
 
 
 
 
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
 
 
 /* 
 * 테이블에 데이터 추가하기 - 컬럼갯수, 컬럼순서, 자료형이 일치해야 한다.
 * 
 * INSERT INTO table명(컬럼1, 컬럼2, ..컬럼n)
 *  VALUES(값1, 값2, ..값n);
 * 
 * - 컬럼명 생략시 테이블생성시의 모든 컬럼순서대로 모든 값을 insert해야 한다. 갯수, 자료형 모두 일치해야 하며, 데이터 생략 불가.
 */
 
 
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (101, '김태희', 30, 'kth@naver.com', '서울시 서초구');
 /*
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (101, '박나래', 30, 'park@naver.com', '서울시 서초구');
*/ -- pk위반.(not null, unique)
 
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (102, '아이유', 20, 'iu@naver.com', '서울시 마포구');

 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (103, '닝닝', 24, 'ning@naver.com', '서울시 강남구');
 
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (104, '윈터', 24, 'winter@naver.com', '서울시 강남구');
 
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (105, '카리나', 26, 'karina@naver.com', '서울시 강남구');
 
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (106, '지젤', 26, 'giselle@naver.com', '서울시 강남구');
 
 
 COMMIT;	-- 영구저장
 ROLLBACK;  -- 취소 : COMMIT 후에는 rollback이 안됨
 
 SELECT * FROM member_tbl;
 
 -------------------------------
 /*
 * 데이터 수정 
 * UPDATE 테이블명
 *  SET 변경컬럼명1=수정데이터1, 변경컬럼명2=수정데이터2,..
 *  WHERE 조건절
 */
 
 -- 김태희가 '서울시 서초구'에서 '맨하튼'으로 이민을 갔고,
 -- 'kth@naver.com'에서 'kth@gmail.com'으로 바꿈
 UPDATE member_tbl
    SET mem_address = '맨하튼',
        mem_email = 'kth@gmail.com'
  WHERE mem_id = 101;
 
 -- 나이 수정 -> 101 : 25세, 102:30  103:35 104:40  105:45  106:50
 UPDATE member_tbl
    SET mem_age = 25
  WHERE mem_id=101;
 
 UPDATE member_tbl
    SET mem_age = 30
  WHERE mem_id=102;
 
 UPDATE member_tbl
    SET mem_age = 35
  WHERE mem_id=103;

 UPDATE member_tbl
    SET mem_age = 40
  WHERE mem_id=104;
 
 UPDATE member_tbl
    SET mem_age = 45
  WHERE mem_id=105;

 UPDATE member_tbl
    SET mem_age = 45
  WHERE mem_id=106;
 
 
 
 ---------------------------------
 -- DELETE 문
 
 /*
 * 데이터 삭제
 * DELETE [FROM] 테이블명
 *  WHERE 조건절
 * from생략가능
 */
 
 SELECT * FROM member_tbl;
 ROLLBACK;
 
-- 106 삭제
DELETE member_tbl
 WHERE mem_id = 106;
 
 ------------------------------------------------------------------
-- 제약조건
  /* 1. 제약조건(테이블 생성시) => 매우 중요 
 * -- 제약조건이란 테이블에 유효하지 않은(부적절한) 데이터가 입력되는 것을 방지하기 위해서
 *    테이블 생성시 각 컬럼에 대해 정의하는 규칙이다.
 * 
 * -- 데이터 무결성 : 데이터베이스에 저장되는 데이터의 정확성과 일관성을 보장한다는 의미이다.
 *             제약조건은 데이터 무결성을 지키기 위한 안전장치로서 중요한 역할을 한다.
 *             INSERT, UPDATE, DELETE 등 모든 과정에서 제약조건을 지켜야 한다.
 * 
 * -- Oracle의 제약조건 종류
 *    구분           설명    
 * - NOT NULL : 컬럼에 NULL 값을 허용하지 않는다. 중복은 허용함
 * - UNIQUE : 지정한 컬럼이 유일한 값을 가져야 한다. 단 null은 값의 중복에서 제외
 * - PRIMARY KEY : 식별자로서 지정한 컬럼이 유일한 값이면서 NULL을 허용하지 않는다. 테이블에 하나만 지정가능하다.
 * - FOREIGN KEY : 부모테이블에 존재하는 PK의 값만 입력가능하다. NULL을 허용한다. 
 * - CHECK : 설정한 조건식을 만족하는 데이터만 입력가능하다.
 * 
 * -- 테이블 생성은 부모테이블부터 하고, 테이블 삭제는 자식테이블부터 한다.
 * -- ON DELETE CASCADE : 자식테이블에 설정하면, 부모테이블 데이터 삭제시, 자식테이블 데이터도 함께 삭제
 */ 
 
 
-- sccot_05 계정에서 작업

-- 생성은 부모부터
-- 부서테이블(부모테이블)
DROP TABLE dept_tbl;  -- 테이블을 생성할 땐 드롭부터 한 번해주는게 좋다
CREATE TABLE dept_tbl(
  --deptno		number(3)			PRIMARY key,   -- 컬럼레벨 제약조건
	deptno		number(3),		
	deptname	varchar2(50)		NOT NULL,
	loc			varchar2(50),
	CONSTRAINT dept_tbl_deptno_pk PRIMARY key(deptno)  -- 테이블레벨 제약조건
--    제약조건		     제약조건명         제약         컬럼명	
);

SELECT * from dept_tbl;



-- 사원테이블 생성(자식테이블)
DROP TABLE temp_tbl;
CREATE TABLE temp_tbl(
	empno		number(3), 		-- PK(테이블레벨에서 제약할당)
	ename		varchar2(50)		NOT NULL,
	hire_date	DATE 				DEFAULT sysdate,
	salary		number(9)			CONSTRAINT emp_tbl_salary_min CHECK (salary>0),
	deptno 		number(3),    	-- FK
    email		varchar2(100),	-- UNIQUE
    CONSTRAINT emp_tbl_empno_pk PRIMARY key(empno),		-- 제약조건 + 테이블명_컬럼명_제약약자 + 제약조건(컬럼명)
    CONSTRAINT emp_tbl_deptno_fk FOREIGN key(deptno) REFERENCES tdept_tbl(deptno),
    CONSTRAINT emp_tbl_email_uk UNIQUE(email)
);
SELECT * from emp_tbl;

DROP TABLE emp_tbl;

CREATE TABLE emp_tbl(
	empno		number(3), 		-- PK(테이블레벨에서 제약할당)
	ename		varchar2(50)		NOT NULL,
	hire_date	DATE 				DEFAULT sysdate,
	salary		number(9)			CONSTRAINT emp_tbl_salary_min CHECK (salary>0),
	deptno 		number(3),    	--	CONSTRAINT emp_tbl_deptno_fk REFERENCES dept_tbl(deptno) ON DELETE casdate 
    email		varchar2(100),	-- UNIQUE
    CONSTRAINT emp_tbl_empno_pk PRIMARY key(empno),		-- 제약조건 + 테이블명_컬럼명_제약약자 + 제약조건(컬럼명)
    CONSTRAINT emp_tbl_deptno_fk FOREIGN key(deptno) REFERENCES dept_tbl(deptno) ON DELETE CASCADE,		-- 부모테이블 삭제시 자식도 같이 삭제해라
    CONSTRAINT emp_tbl_email_uk UNIQUE(email)
);

SELECT * from emp_tbl;

---------------------------------------

-- [DEPT_TBL]  부서번호 10~50 -------
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES (10,'IT', '뉴욕');
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES (20,'마케팅', '캐나다');
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES (30,'회계', '파리');
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES (40,'인사과', '맨하튼');
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES (50,'경리과', '서울');

COMMIT;
SELECT * FROM dept_tbl;

-- [EMP_TBL] 사원번호 101~105 --------
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (101, '아이유', '2025/1/20', 10000, 10, 'iu@gmail.com');
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (102, '배수지', '2025/2/10', 70000, 20, 'suzi@gmail.com');
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (103, '소지섭', '2025/3/20', 80000, 30, 'sjs@gmail.com');
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (104, '박나래', '2025/4/20', 90000, 40, 'park@gmail.com');
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (105, '유느님', '2025/5/20', 50000, 50, 'you@gmail.com');
COMMIT;
SELECT * FROM emp_tbl;


-- 부서코드60 => 오류
/*
INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (106, '유느님', '2025/5/20', 50000, 60, 'you1@gmail.com');
-- SQL Error [2291] [23000]: ORA-02291: integrity constraint (SCOTT_05.EMP_TBL_DEPTNO_FK) violated - parent key not found
-- 부모키에 없는 데이터를 insert햇다
*/

-- insert는 부모부터!
INSERT INTO dept_tbl(deptno, deptname, loc)
 VALUES (60, '메타버스과','실리콘밸리');

INSERT INTO emp_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (106, '테스트', '2025/5/20', 60000, 60, 'test@gmail.com');

COMMIT;
 
SELECT * FROM dept_tbl;
SELECT * FROM emp_tbl;

-- dept_tbl, emp_tbl 60번 부서 동시 삭제 가능 (ON DELETE CASCADE) 
--				만약 이 제약조건이 없다면 부모 삭제시 오류 발생
DELETE FROM dept_tbl
WHERE deptno = 60;		-- ON DELETE CASCADE 때문에 같이지워짐


 
-- SQL Error [2292] [23000]: ORA-02292: integrity constraint (SCOTT_05.EMP_TBL_DEPTNO_FK) violated - child record found
-- 자식테이블이 발견됐다 ==> ON DELETE CASCADE 를 안 한 상태에서 delete를 했기 때문에 생기는 오류


 
 -- ****************************************
-- 제약 조건명 검색 - DBeaver에서 지원안됨
-- 제약조건명은 계정이 동일한 모든 테이블에서 중복되면 안된다.
-- SQL Developer에서 실행
-- ****************************************
SELECT constraint_name
     , constraint_type
     , table_name
  FROM user_constraints    -- 데이터 사전
WHERE table_name IN('DEPT_TBL', 'EMP_TBL');  -- 테이블명은 반드시 대문자
 






 
 
 
 