-- 2025.6.20 복습

 -- 회원정보 테이블 삭제
DROP TABLE member_tbl_re;

 -- 회원정보 테이블 생성 mem_tbl_re
-- mem_id, mem_name, mem_age, mem_email, mem_address
CREATE TABLE member_tbl_re(
	mem_id		number(3)		PRIMARY KEY,
	mem_name	varchar2(50) 	NOT NULL,
	mem_age		number(3),
	mem_email	varchar2(60)	NOT NULL,
	mem_address	varchar2(100)
);

-- 데이터 확인 
SELECT * FROM member_tbl_re;

-- 데이터 추가
INSERT INTO MEMBER_TBL_re(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (101, '김태희', 30, 'kth@naver.com', '서울시 서초구');
 /*
 INSERT INTO member_tbl(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (101, '박나래', 30, 'park@naver.com', '서울시 서초구');
*/ -- pk위반.(not null, unique)
 
 INSERT INTO MEMBER_TBL_re(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (102, '아이유', 20, 'iu@naver.com', '서울시 마포구');

 INSERT INTO MEMBER_TBL_re(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (103, '닝닝', 24, 'ning@naver.com', '서울시 강남구');
 
 INSERT INTO MEMBER_TBL_re(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (104, '윈터', 24, 'winter@naver.com', '서울시 강남구');
 
 INSERT INTO MEMBER_TBL_re(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (105, '카리나', 26, 'karina@naver.com', '서울시 강남구');
 
 INSERT INTO MEMBER_TBL_re(mem_id, mem_name, mem_age, mem_email, mem_address)
  VALUES (106, '지젤', 26, 'giselle@naver.com', '서울시 강남구');
 

COMMIT;
ROLLBACK;

SELECT * FROM member_tbl_re;


-- 데이터수정
UPDATE member_tbl_re
 SET mem_address = '하이용';
-- 이러면 모든 행의 address가 바뀜

UPDATE member_tbl_re
 SET mem_address = '하이용'
 WHERE mem_id = 101;  --101의 address가 바뀜
 
-- 데이터삭제
DELETE member_tbl_re
 WHERE mem_id = 101;  --101번행 정보 삭제
 
 
 -----------------
 --제약조건 설정
 DROP TABLE dept_tbl_re;
CREATE TABLE dept_tbl_re(
	deptno		number(3),
	deptname	varchar2(50)		NOT NULL,
	loc			varchar2(50),
	CONSTRAINT dept_tbl_re_deptno_pk PRIMARY key(deptno)
);

DROP TABLE emp_tbl_re;
CREATE TABLE emp_tbl_re(
	empno		number(3),
	ename		varchar2(50)	NOT NULL,
	hire_date	DATE 			DEFAULT sysdate,
	salary		number(7)		CONSTRAINT emp_tbl_re_salary_min CHECK (salary>0),
	email 		varchar2(100), 
	deptno		number(3)
	CONSTRAINT emp_tbl_re_empno_pk PRIMARY key(empno),
	CONSTRAINT emp_tbl_re_deptno_fk FOREIGN key(deptno) REFERENCES dept_tbl_re(deptno) ON DELETE CASCADE,
	CONSTRAINT emp_tbl_re_eamil_uk UNIQUE(email)
);


-- 제약 조건명 검색
SELECT constraint_name
	 , constraint_type
	 , table_name
  FROM user_constraints
 WHERE table_name IN ('DEPT_TBL_RE', 'EMP_TBL_RE');







