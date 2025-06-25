-- 2025.6.25

/* 1.트랜잭션 / 2.데이터사전 / 3.인덱스 / 4.시퀀스
 [ 1. 트랜잭션 ]
- 트랜잭션은 데이터 처리에서 논리적인 하나의 작업 단위를 의미한다.
- ALL or Nothing : 여러개의 명령어 집합이 정상적으로 처리되면 정상종료하고,
                            명령어들중 하나라도 잘못된다면 전체를 취소한다.
- DML 작업이 성공적으로 처리되었다면 COMMIT을, 
         취소해야 한다면 ROLLBACK 명령을 실행한다.
         ROLLBACK : COMMIT 후에 취소가 되지 않는다.
         
- DDL(테이블생성, 수정), DCL(권한)문이 실행되는 경우에는 자동으로 COMMIT 된다. COMMIT 할 필요 없다.
- COMMIT - 트랜잭션의 처리과정을 반영하여 변경된 내용을 영구저장한다. 모든 작업들의 정상처리확정 명령어다.
           INSERT, UPDATE, DELETE(즉 DML) 후 COMMIT을 해야 한다. 
           
- LOCK : 특정 세션에서 조작중인 데이터는 트랜잭션이 완료(COMMIT, ROLLBACK)되기 전까지 다른 계정에서 
         조작할 수 없도록 접근을 보류시키게 된다. 즉 데이터가 '잠금현상'이 일어난다.
         트랜잭션이 완료(COMMIT, ROLLBACK)가 되면 LOCK이 풀리게 된다.
         
         주의 : WHERE절을 지정하지 않은 UPDATE, DELETE문일 경우에는 테이블의 모든행이 LOCK 상태가 된다.
           
- DBeaver 툴에서는 savepoint가 작동안됨           
- SAVEPOINT - 현재의 트랜잭션을 작게 분할한다. 대소문자 구별함
   저장된 SAVEPOINT는 ROLLBACk TO SAVEPOINT 문을 사용하여 표시한 곳까지 롤백할 수 있다.
  1) SAVEPOINT S1;   -- S1 : SAVEPOINT명
     SAVEPOINT S2;   -- S2 : SAVEPOINT명
  2) ROLLBACk TO S1;   -- S1 : SAVEPOINT명
*/ 



-- scott_05에서 작업
-- 구조 + 데이터
CREATE TABLE member_tbl_tr
AS 
SELECT * FROM member_tbl;
/*
101	김태희	30	kth@naver.com	서울시 서초구
102	아이유	20	iu@naver.com	서울시 마포구
103	닝닝		24	ning@naver.com	서울시 강남구
104	윈터		24	winter@naver.com	서울시 강남구
105	카리나	26	karina@naver.com	서울시 강남구
106	지젤		26	giselle@naver.com	서울시 강남구
 */

SELECT * FROM member_tbl_tr;

------------------- sqldevelopter에서 진행
-- 1. 103번의 이메일 수정    -- S1

UPDATE MEMBER_TBL_TR
SET mem_email = 'parknarae@gmail.com'
WHERE mem_id = 103;

SAVEPOINT s1;


-- 2. 101번 삭제			-- S2

DELETE FROM member_tbl_tr
WHERE mem_id = 101;

SAVEPOINT s2;

-- 3. 102번 삭제			-- S3

DELETE FROM member_tbl_tr
WHERE mem_id = 102;

SAVEPOINT s3;

-- 4. 104번 삭제			-- S4

DELETE FROM member_tbl_tr
WHERE mem_id = 104;

SAVEPOINT s4;


SELECT * FROM member_tbl_tr;
commit;

-- 순서대로 실행
ROLLBACK TO s4;		-- 104번(현재)
ROLLBACK TO s3;		-- 102번부활
ROLLBACK TO s2;		-- 101번부활
ROLLBACK TO s1;		-- 이메일 변경 시점
ROLLBACK;			-- 업데이트 취소(커밋 이후 시점)

--------------------------------------------------------------------------
/* SQL DEVELOPER에서 실행
 * [ 2. 데이터 사전 ]
 * - 데이터 사전 : 사용자와 데이터베이스 자원의 효율적 관리를 위한 다양한 정보를 저장하는 시스템 테이블의 집합이다.
 * - 사용자가 테이블을 생성하거나, 사용자를 변경하는 등의 작업을 할 때 데이터베이스 서버에 의해
 *   자동으로 갱신되는 테이블이다.
 
 * - [접두어]
 * USER_XXXX : 자신의 계정이 소유한 객체 등에 관한 정보조회
 * ALL_XXXX : 사용허가를 받은 모든 객체 정보 조회
 * DBA_XXXX : 데이터베이스 관리자(SYSTEM, SYS)만 접근가능한 정보(DataBaseAdimstor..)
 * 
 * - 데이터 사전 - USER_데이터사전
 *   . USER_SEQUENCES : 사용자가 소유한 시퀀스의 정보
 *   . USER_INDEXES : 사용자가 소유한 인덱스의 정보
 *   . USER_VIEWS : 사용자가 소유한 뷰의 정보
 *   . USER_TABLES : 사용자가 소유한 테이블의 정보
 */
 
 
 
-- SCOTT_05 계정에서 실행
-- user_tables : USER_데이터 사전 => 자신의 계정에서 개인이 만든 테이블 목록 조회
-- 테이블목록
SELECT table_name
  FROM user_tables;
  
-- 뷰목록
SELECT view_name
  FROM user_views;

-- all 접두어를 가진 데이터 사전
SELECT owner, table_name
  FROM all_tables;


-- system 계정에서 실행
SELECT * 
  FROM dba_users
WHERE username = 'SCOTT_05';   -- 대문자로 입력해야함


-----------------------------------------------------------------------------------
/* [ 3. 인덱스 ] 
   사용목적 :  조회시 성능 향상 즉, 검색 속도 향상을 위한 인덱스
   기본키나 유일키는 인덱스가 자동으로 생성된다. 
   
   인덱스의 종류
 - 1)비고유 인덱스 : 중복된 데이터를 갖는 컬럼에 대해서 생성하는 인덱스이며, UNIQUE를 붙이면 에러 발생
 - 2)고유 인덱스 : 기본키나 유일키처럼 유일한 값을 갖는 컬럼에 대해서 생성하는 인덱스이며, UNIQUE INDEX로 사용한다.
 - 3)결합 인덱스 : 두개 이상의 컬럼으로 인덱스를 구성
 - 4)함수기반 인덱스 : 수식이나 함수를 적용하여 만든 인덱스
*/ 


-- 구조, 데이터까지 복사(단 제약조건은 복사안됨)
-- SCOTT_05 계정에서 실행
CREATE TABLE emp_idx_tbl
as 
SELECT * FROM emp_tbl;

CREATE TABLE dept_idx_tbl
as 
SELECT * FROM dept_tbl;


SELECT * FROM emp_idx_tbl;      -- 7건
SELECT * FROM dept_idx_tbl;     -- 5건


-- 1) 인덱스 : 비고유
-- 중복된 데이터를 갖는 컬럼에 대해서 생성하는 인덱스이며, UNIQUE를 붙이면 에러 발생
-- (단 서브쿼리로 테이블생성시 제약조건이 복사안되므로 에러가 안남)
DROP INDEX idx_emp_ename;       -- 혹시 있으면 삭제하고 하기 위해
CREATE INDEX idx_emp_ename
    ON emp_idx_tbl(ename);      -- ON 테이블명(컬럼명)
	-- Index IDX_EMP_ENAME이(가) 생성되었습니다.
    
-- 1-2) 인덱스 생성 확인
  SELECT index_name
       , table_name
       , column_name
    FROM USER_IND_COLUMNS					-- 데이터사전에서 인덱스 조회
   WHERE table_name IN('EMP_IDX_TBL');		-- 테이블명은 반드시 대문자
-- INDEX_NAME       TABLE_NAME          COLUMN_NAME
-- INDEX_EMP_ENAME  EMP_IDX_TBL         ENAME



/*
-- ****************************************
-- 제약 조건명 검색 - DBeaver에서 지원안됨
-- 제약조건명은 계정이 동일한 모든 테이블에서 중복되면 안된다.
-- SQL Developer에서 실행
-- ****************************************
*/
SELECT constraint_name
     , constraint_type
     , table_name
  from user_constraints     -- 데이터사전에서 제약조건 조회
 WHERE table_name IN('DEPT_TBL', 'EMP_TBL', 'EMP_IDX_TBL');




-- 2)고유 인덱스 : 
-- 기본키나 유일키처럼 유일한 값을 갖는 컬럼에 대해서 생성하는 인덱스이며, 
-- UNIQUE INDEX로 사용한다
DROP INDEX idx_dept_deptno;
CREATE UNIQUE INDEX idx_dept_deptno
    ON dept_idx_tbl(deptno);        -- deptno : PK

-- 2-1) 인덱스 생성 확인
  SELECT index_name
       , table_name
       , column_name
    FROM USER_IND_COLUMNS					-- 데이터사전에서 인덱스 조회
   WHERE table_name IN('DEPT_IDX_TBL');		-- 테이블명은 반드시 대문자
-- INDEX_NAME       TABLE_NAME          COLUMN_NAME
-- IDX_DEPT_DEPTNO	 DEPT_IDX_TBL    	DEPTNO




-- 3)결합 인덱스 : 두개 이상의 컬럼으로 인덱스를 구성
DROP INDEX idx_dept_com;
CREATE INDEX idx_dept_com
    ON dept_idx_tbl(deptname, loc);     -- 컬럼을 여러개를 걸 수 있음
    
-- 인덱스생성 확인
  SELECT index_name
       , table_name
       , column_name
    FROM USER_IND_COLUMNS		
    WHERE table_name IN('DEPT_IDX_TBL');	-- 데이터사전에서 인덱스 조회
-- INDEX_NAME       TABLE_NAME          COLUMN_NAME
-- IDX_DEPT_DEPTNO	DEPT_IDX_TBL	    DEPTNO
-- IDX_DEPT_COM	  DEPT_IDX_TBL	        DEPTNAME
-- IDX_DEPT_COM	   DEPT_IDX_TBL	         LOC




-- 4)함수기반 인덱스 : 수식이나 함수를 적용하여 만든 인덱스
DROP INDEX idx_emp_salary;
CREATE INDEX idx_emp_salary
    ON emp_idx_tbl(salary * 12);
    
    
-- 인덱스 생성 확인
  SELECT index_name
       , table_name
       , column_name
    FROM USER_IND_columns					-- 데이터사전에서 인덱스 조회
   WHERE table_name IN('EMP_IDX_TBL');	






-----------------------------------------------------------------------------------


/*
   [ 4. 시퀀스 ]  => 중요!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    시퀀스는 테이블내의 유일한 숫자를 자동으로 생성해주며, 기본키로 사용된다.
   새로운 데이터가 추가될 때 기본키값을 자동으로 발생시키는 용도로 사용된다.
   마치 mysql의 auto_increment와 동일
   
   CURRVAL : 시퀀스에서 마지막으로 생성한 번호를 반환
             - 시퀀스를 생성하고 바로 사용하면 번호가 만들어진적이 없으므로 오류가 발생
             => 처음 시퀀스를 만든 경우 NEXTVAL을 먼저 조회해야 한다.)
   NEXTVAL : 다음 번호를 생성
      
   주된 사용 : 게시판의 게시글번호, 상품주문번호
   -- [형식]
   -- 시퀀스 생성
   CREATE SEQUENCE 시퀀스명
     START WITH n
     INCREMENT BY n
     MAXVALUE n | MINVALUE n
     CYCLE | NOCYCLE
     CACHE | NOCACHE
     
   -- 생성한 시퀀스 확인(데이터사전)
   SELECT *
     FROM USER_SEQUENCES;
     
   -- 시퀀스 삭제  
   DROP SEQUENCE 시퀀스명;  
*/

DROP SEQUENCE dept_seq;
CREATE SEQUENCE dept_seq
  START WITH 10
  INCREMENT BY 10
  MAXVALUE 90
  MINVALUE 0
  NOCYCLE;
-- Sequnce dept_seq가 생성되었습니다.

--   CURRVAL : 시퀀스에서 마지막으로 생성한 번호를 반환
--             - 시퀀스를 생성하고 바로 사용하면 번호가 만들어진적이 없으므로 오류가 발생
--             => 처음 시퀀스를 만든 경우 NEXTVAL을 먼저 조회해야 한다.)
--   NEXTVAL : 다음 번호를 생성

-- 생성한 시퀀스 확인(데이터사전)
SELECT * 
  FROM user_sequences;


-- 1) 처음 시퀀스를 만든 경우 NEXTVAL(다음 생성번호)로 SQL을 만든다
select dept_seq.nextval
    from dual;
    --10

-- 2) 그 후 CURRVAL로 값을 조회한다
select dept_seq.currval
    from dual;
    
    
    
-- //////////////////////////////////////////////////////

DROP TABLE dept_seq_tbl;  -- 테이블을 생성할 땐 드롭부터 한 번해주는게 좋다
CREATE TABLE dept_seq_tbl(
  --deptno		number(3)			PRIMARY key,   -- 컬럼레벨 제약조건
	deptno		number(3),		
	deptname	varchar2(50)		NOT NULL,
	loc			varchar2(50),
	CONSTRAINT dept_seq_tbl_deptno_pk PRIMARY key(deptno)  -- 테이블레벨 제약조건
--    제약조건		     제약조건명         제약         컬럼명	
);

SELECT * from dept_seq_tbl;

DROP TABLE emp_seq_tbl;
CREATE TABLE emp_seq_tbl(
	empno		number(3), 		-- PK(테이블레벨에서 제약할당)
	ename		varchar2(50)		NOT NULL,
	hire_date	DATE 				DEFAULT sysdate,
	salary		number(9)			CONSTRAINT emp_seq_tbl_salary_min CHECK (salary>0),
	deptno 		number(3),    	-- FK
    email		varchar2(100),	-- UNIQUE
    CONSTRAINT emp_seq_tbl_empno_pk PRIMARY key(empno),		-- 제약조건 + 테이블명_컬럼명_제약약자 + 제약조건(컬럼명)
    CONSTRAINT emp_seq_tbl_deptno_fk FOREIGN key(deptno) REFERENCES dept_seq_tbl(deptno),
    CONSTRAINT emp_seq_tbl_email_uk UNIQUE(email)
);
SELECT * from emp_seq_tbl;

-- [ ex_dept_sequence 생성 => 부서테이블과 사원테이블의 부서번호 대체, 
-- [ ex_emp_sequence 생성 => 사원테이블의 사번 대체 ]

DROP SEQUENCE ex_dept_sequence;
CREATE SEQUENCE ex_dept_sequence
    START WITH 10
    INCREMENT BY 10
    MAXVALUE 50
    MINVALUE 0
    NOCYCLE;
-- Sequence EX_DEPT_SEQUENCE이(가) 생성되었습니다.

DROP SEQUENCE ex_emp_sequence;
CREATE SEQUENCE ex_emp_sequence
    START WITH 101
    INCREMENT BY 1
    MAXVALUE 105
    MINVALUE 0
    NOCYCLE;

INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_sequence.nextval, 'IT', '뉴욕');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_sequence.nextval,'마케팅', '캐나다');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_sequence.nextval,'회계', '파리');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_sequence.nextval,'인사과', '맨하튼');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_sequence.nextval,'경리과', '서울');
SELECT * FROM dept_seq_tbl; 


INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (ex_emp_sequence.nextval, '아이유', '2025/1/20', 10000, ex_dept_sequence.currval, 'iu@gmail.com');
INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (ex_emp_sequence.nextval, '배수지', '2025/2/10', 70000, ex_dept_sequence.currval, 'suzi@gmail.com');
INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (ex_emp_sequence.nextval, '소지섭', '2025/3/20', 80000, ex_dept_sequence.currval, 'sjs@gmail.com');
INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (ex_emp_sequence.nextval, '박나래', '2025/4/20', 90000, ex_dept_sequence.currval, 'park@gmail.com');
INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
  VALUES (ex_emp_sequence.nextval, '유느님', '2025/5/20', 50000, ex_dept_sequence.currval, 'you@gmail.com');
COMMIT;
SELECT * FROM emp_seq_tbl;










