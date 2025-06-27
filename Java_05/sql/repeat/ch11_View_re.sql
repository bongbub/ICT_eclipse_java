-- 2025.6.24
-- 복습

-- View 생성
CREATE OR REPLACE VIEW v_emp_dept_re
AS 
SELECT e.empno
     , e.ename
     , e.hire_date
     , d.deptno
     , d.deptname
     , d.loc
  FROM emp_tbl e
     , dept_tbl d
WHERE e.deptno = d.deptno;

-- 데이터사전에서 방금 만든 뷰를 조회하는 법(sqldeveloper에서 됨)
SELECT view_name, text
  FROM user_views;

-- 뷰 이름으로 조회
SELECT * FROM v_emp_dept_re;

------------------------

DROP TABLE menu_tbl_re;
CREATE TABLE menu_tbl_re(
	food_code		number(3)		PRIMARY KEY,
	rest_name		varchar2(100)	NOT NULL,
	food_kind		varchar2(50)	NOT NULL,
	food_name		varchar2(50)	NOT NULL
);

INSERT INTO menu_tbl_re(food_code, rest_name, food_kind, food_name)
 VALUES (101, '홍두깨칼국수', '한식', '돈가스');
INSERT INTO menu_tbl_re(food_code, rest_name, food_kind, food_name)
 VALUES (102, '쿠우쿠우', '일식부페', '초밥');
INSERT INTO menu_tbl_re(food_code, rest_name, food_kind, food_name)
 VALUES (103, '거북이의주방', '일식', '카레');
INSERT INTO menu_tbl_re(food_code, rest_name, food_kind, food_name)
 VALUES (104, '호남식당', '한식', '제육볶음');
INSERT INTO menu_tbl_re(food_code, rest_name, food_kind, food_name)
 VALUES (105, '짜장상회', '중식', '짬짜면');
INSERT INTO menu_tbl_re(food_code, rest_name, food_kind, food_name)
 VALUES (106, '핵덮밥', '일식', '마제소바');

SELECT * FROM menu_tbl_re;

DELETE froom menu_tbl_re;  --where절 없으면 데이터 전체삭제(주의)

----------------------------------------
--뷰생성
-- menu_tbl_re에서 food_code = 101, 103, 105일때 모든 정보
CREATE OR REPLACE VIEW v_menu_re
AS
SELECT food_code
	 , food_kind
	 , rest_name
	 , food_name
  FROM menu_tbl_re
  WHERE food_code in(101,103,105);

SELECT * FROM v_menu_re

-- 뷰삭제
DROP VIEW v_menu;


CREATE OR REPLACE VIEW v_emp_readonly_re
AS
SELECT empno
	 , ename
	 , hire_date
	 , deptno
	 , salary
  FROM emp_tbl_re
  WITH READ ONLY;  --보는것만 가능
  
-- view 데이터 조회
SELECT * FROM v_emp_readonly_re;

INSERT INTO v_emp_readonly_re(empno, ename, hire_date, deptno, salary )
 VALUES (106, 롤스로이, sysdate, 60, 60000);
-- 에러발생 read only로 할당해준 뷰이기 때문에

--with check option
CREATE OR REPLACE VIEW v_emp_chkoption_re
AS
SELECT empno
	 , ename
	 , hire_date
	 , deptno
	 , salary
	 , email
FROM emp_tbl
WHERE empno in(111,112,113)
WITH CHECK OPTION;

SELECT * FROM V_EMP_CHKOPTION_re;


-- 데이터추가
SELECT INTO v_emp_chkoption_re(empno, ename, hire_date, deptno, salary)
 VALUES (111,'기안',sysdate, 50,50000);
SELECT INTO v_emp_chkoption_re(empno, ename, hire_date, deptno, salary)
 VALUES (112,'이효리',sysdate, 50,90000);
SELECT INTO v_emp_chkoption_re(empno, ename, hire_date, deptno, salary)
 VALUES (113,'김상순',sysdate, 50,20000);

SELECT * FROM emp_tbl_re; -- 기존데이터 5건 확인

SELECT * FROM v_emp_chkoption_re;	-- 추가데이터까지 7건 확인

--이메일 업데이트
UPDATE v_emp_chkoption_re
   SET email = 'kian@naver.com';
 WHERE empno = 111;
UPDATE v_emp_chkoption_re
   SET email = 'leehr@naver.com';
 WHERE empno = 112;
UPDATE v_emp_chkoption_re
   SET email = 'kimss@naver.com';
 WHERE empno = 113;

SELECT * FROM v_emp_chkoption_re;
SELECT * FROM emp_tbl_re;

-- 제거
DELETE FROM v_emp_chkoption_re
WHERE empno = 111;
COMMIT;

-----------------------
SELECT view_name, text
  FROM user_views;		-- views 데이터사전에서 뷰이름, 내용검색
  
SELECT * FROM v_emp_dept_re;

DESC emp_tbl; -- 해당 테이블이 가진 구조 출력

SELECT * FROM tab;  -- 테이블 목록 확인




