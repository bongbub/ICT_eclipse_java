-- 2025.6.25
-- 복습

-- scott_05 작업
CREATE TABLE member_tbl_tre
AS
SELECT * FROM member_tbl;


SELECT * FROM member_tbl_tre;

-- SQL Developer 에서 진행

-- 103번 이메일 수정
UPDATE MEMBER_TBL_Tre
SET mem_email = 'pkpk@naver.com'
WHERE mem_id = 103;

SAVEPOINT s1;


-- 2. 101번 삭제			-- S2
DELETE member_tbl_tre
WHERE mem_id = 101;

SAVEPOINT s2;


-- 3. 102번 삭제			-- S3
DELETE member_tbl_tre
WHERE mem_id = 102;

SAVEPOINT s3;


-- 4. 104번 삭제			-- S4
DELETE member_tbl_tre
WHERE mem_id = 104;

SAVEPOINT s4;


-- 순서대로 실행
ROLLBACK TO s4;
ROLLBACK TO s3;
ROLLBACK TO s2;
ROLLBACK TO s1;
ROLLBACK;

-- 데이터사전
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
  WHERE username = 'SCOTT_05';


-- 구조, 데이터까지 복사(단 제약조건은 복사안됨)
-- SCOTT_05 계정에서 실행
CREATE TABLE emp_idx_tbl
AS
SELECT * FROM emp_tbl;

CREATE TABLE dept_idx_tbl
AS
SELECT * FROM dept_tbl;

SELECT * FROM emp_idx_tbl;
SELECT * FROM dept_idx_tbl;

--인덱스생성
DROP INDEX idx_emp_ename;
CREATE INDEX idx_emp_ename
	ON emp_idx_tbl(ename);		

--인덱스 생성 확인
SELECT index_name
     , table_name
     , COLUMN_name
  FROM USER_IND_COLUMNS					--데이터사전에서 인덱스 조회
 WHERE table_name IN ('EMP_IDX_TBL');	-- 테이블명 대문자 주의

-- 제약조건
SELECT constraint_name
 	 , CONSTRAINT_type
 	 , table_name
 FROM user_constraints
WHERE table_name IN ('DEPT_TBL','EMP_TBL','EMP_IDX_TBL');


-- 고유인덱스
DROP INDEX idx_dept_deptno;
CREATE UNIQUE INDEX idx_dept_deptno
    ON dept_idx_tbl(deptno);		--deptno => pk 고유인덱스 생성

-- 결합인덱스
DROP INDEX idx_dept_com;
CREATE INDEX idx_dept_com
    ON dept_idx_tbl(deptname, loc);


-- 인덱스생성 확인
SELECT index_name
	 , table_name
	 , COLUMN_name
  FROM USER_IND_COLUMNS
 WHERE table_name in('DEPT_IDX_TBL');

-- 함수기반 인덱스
DROP INDEX idx_emp_salary;
CREATE INDEX idx_emp_salary
    ON emp_idx_tbl(salary * 12);


-- 인덱스 생성확인
SELECT index_name
	 , table_name
	 , COLUMN_name
  FROM USER_IND_COLUMNS
 WHERE table_name in('EMP_IDX_TBL');



-- 시퀀스
DROP SEQUENCE dept_seq;
CREATE SEQUENCE dept_seq
  START WITH 10
  INCREMENT BY 10
  MAXVALUE 90
  MINVALUE 0
  nocycle;


-- 생성확인
SELECT * 
  FROM user_sequences;

-- 처음시퀀스를 만든 경우 nextval
SELECT dept_seq.nextval
FROM dual;
-- 그 후 currval
SELECT dept_seq.currval
FROM dual;


DROP TABLE dt_seq_tbl
CREATE TABLE dt_seq_tbl(
	dtno	number(3),
	dtname	varchar2(50)	NOT NULL,
	loc		varchar2(100),
	CONSTRAINT dt_seq_tbl_dtn_pk PRIMARY key(dtno)
)

SELECT * FROM dt_seq_tbl;


DROP TABLE emp_seq_tbl;
CREATE TABLE emp_seq_tbl(
	empno		number(3),
	ename		varchar2(50)		NOT NULL,
	hire_date	DATE 				DEFAULT sysdate,
	salary		number(9)			CONSTRAINT emp_seq_tbl_salary_min CHECK (salary>0),
	deptno 		number(3),    	-- FK
    email		varchar2(100),	-- UNIQUE
    CONSTRAINT emp_seq_tbl_empno_pk PRIMARY key(empno),
    CONSTRAINT emp_seq_tbl_deptno_fk FOREIGN key(deptno) REFERENCES dept_tbl(deptno),
    CONSTRAINT emp_seq_tbl_email_uk UNIQUE (email)
    
);

SELECT * FROM emp_seq_tbl;

DROP SEQUENCE ex_dept_se;
CREATE SEQUENCE ex_dept_se
	START WITH 10
	INCREMENT BY 10
	MAXVALUE 50
	MINVALUE 0
	nocycle;

DROP SEQUENCE ex_emp_se;
CREATE SEQUENCE ex_emp_se
 START WITH 101
 INCREMENT BY 1
 MAXVALUE 105
 MINVALUE 0
 nocycle;


INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_se.nextval, 'IT', '뉴욕');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_se.nextval, 'IT1', '뉴욕4');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_se.nextval, 'IT2', '뉴욕3');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_se.nextval, 'IT3', '뉴욕2');
INSERT INTO dept_seq_tbl(deptno, deptname, loc)
 VALUES (ex_dept_se.nextval, 'IT4', '뉴욕1');


INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(ex_emp_se.nextval, '아이유','2024/1/20',10000,ex_dept_se.currval, 'email.com');

INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(ex_emp_se.nextval, '아이유1','2024/1/20',10000,ex_dept_se.currval, 'email3.com');

INSERT INTO emp_seq_tbl(empno, ename, hire_date, salary, deptno, email)
 VALUES(ex_emp_se.nextval, '아이유2','2024/11/20',10000,ex_dept_se.currval, 'email3.com');


