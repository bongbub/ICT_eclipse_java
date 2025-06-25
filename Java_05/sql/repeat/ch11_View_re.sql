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
)





































