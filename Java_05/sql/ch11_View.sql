-- 2025.6.24
---------------------------------------------

/*
1. 뷰의 개념과 사용하기 => 중요!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

- 뷰(View)는 한마디로 물리적인 테이블을 근거로 한 논리적인 가상테이블
- 디스크 저장 공간이 할당되지 않는다.
  즉, 실질적으로 데이터를 저장하지 않고, 데이터 사전에, 뷰를 정의할 때 기술한 쿼리문만 저장되어 있다.
  하지만 사용방법은 테이블에서 파생된 객체 테이블과 유사하기 때문에 가상테이블이라 한다.
  뷰의 정의는 USER_VIEWS 데이터 사전을 통해 조회가 가능하다.
  
2. 동작원리
- 뷰는 데이터를 저장하고 있지 않은 가상테이블이므로 실체가 없다.
  뷰가 테이블처럼 사용될 수 있는 이유는, 뷰를 정의할 때 CREATE VIEW 명령어 다음의
  AS 절에 기술한 쿼리문장 자체를 데이터딕셔너리에 저장하고 있다가 이를 실행하기 때문이다.
  
  SELECT문의 FROM 절에서 v-emp로 기술하여 정의하면, 오라클 서버는 USER_VIEWS에서 뷰이름(v-emp)를 찾는다.
  기술했던 서브쿼리문장이 저장된 text값을 view 즉 v_emp 위치로 가져와서 실행한다.
 
3. 뷰를 사용하는 이유
- 보안과 사용의 편의성 때문
- 보안 : 권한별로 접근이 제한되어서 동일한 테이블에 접근하는 사람마다 다른 뷰에 접근할 수 있도록 한다.

4. 권한 부여
-- 권한 부여 방법(System에서 부여) :  grant create view to scott_05;  
   만약 권한을 부여하지 않으면 insufficient privileges => create view 권한 없음 => 권한 부여하면 됨
-- View 생성시 자동으로  user_views 데이터사전에 자동등록된다.

-- View 이름은 user_views 데이터사전의 view_name에 저장
-- SQL문은 user_views 데이터사전의 text에 저장
*/



-- view 생성
CREATE OR REPLACE VIEW v_emp_dept		-- 데이터사전(user_views)에 자동 등록
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


-- 데이터사전(user_views)에서 view를 조회.. sql문이 txt 컬럼에 저장됨
--SELECT view_name, text
 -- FROM user_views;

SELECT * FROM v_emp_dept;	--뷰 이름으로 조회를 하는 것


------------------------------------------------------------------


DROP TABLE menu_tbl;
CREATE TABLE menu_tbl(
	food_code	NUMBER(3) 		PRIMARY KEY,
	rest_name	varchar2(100)	NOT NULL,
	food_kind	varchar2(50) 	NOT NULL,
	food_name	varchar2(50)	NOT null);

SELECT * FROM menu_tbl;

INSERT INTO MENU_TBL(FOOD_CODE, rest_name, food_kind, food_name)
 VALUES (101, '홍두깨칼국수', '한식','돈가스');
INSERT INTO MENU_TBL(FOOD_CODE, rest_name, food_kind, food_name)
 VALUES (102, '쿠우쿠우', '일식부페','초밥');
INSERT INTO MENU_TBL(FOOD_CODE, rest_name, food_kind, food_name)
 VALUES (103, '거북이의 주방', '일식','카레');
INSERT INTO MENU_TBL(FOOD_CODE, rest_name, food_kind, food_name)
 VALUES (104, '호남식당', '한식','제육볶음');
INSERT INTO MENU_TBL(FOOD_CODE, rest_name, food_kind, food_name)
 VALUES (105, '짜장상회', '중식','짬짜면');

commit();
SELECT * FROM MENU_TBL;

DELETE FROM menu_tbl ;

-- 뷰생성
-- v_menu => menu_tbl에서 food_code=101, 103, 105일때 food_code, food_kind, rest_name, food_name 정보
CREATE OR REPLACE VIEW v_menu  
AS
SELECT food_code
     , food_kind
     , rest_name
     , food_name
  FROM menu_tbl
 WHERE food_code IN (101,103,105);

-- 결과
SELECT * FROM v_menu;



/*  뷰 삭제하기
    [ 형식 ] DROP VIEW 뷰이름;
-- 뷰는 실체가 없는 가상테이블이기 때문에 뷰를 삭제한다는 것은 USER_VIEWS 데이터 사전에
      저장되어 있는 뷰의 정의를 삭제한다는 것을 의미
-- 뷰를 정의한 기본테이블의 구조나 데이터에는 영향이 없다.
*/
DROP VIEW v_menu;   -- 데이터사전에서 text 삭제



----------------------

/* 
- CREATE OR REPLACE VIEW 
  이미 존재하는 뷰에 대해서 그 내용을 새롭게 변경하여 재생성
  뷰가 없으면 새롭게 생성하고, 존재하면 TEXT 변경
  
- WITH CHECK OPTION -- 조회 기준
  지정한 제약 조건을 만족하는 데이터에 한해 DML(I,U,D) 작업이 가능하도록 뷰 생성 
  
- WITH READ ONLY
  해당 뷰를 통해서 SELECT만 가능하며, INSERT/UPDATE/DELETE를 할 수 없다.
*/


-- WITH READ ONLY
CREATE OR REPLACE VIEW v_emp_readonly
AS
SELECT empno
     , ename
     , hire_date
     , deptno
     , salary
  FROM emp_tbl 
 WITH READ ONLY;

-- view 데이터 조회
SELECT * FROM v_emp_readonly;

INSERT INTO v_emp_readonly(empno, ename, hire_date, deptno, salary)
 values(106, '롤스토이', sysdate, 60, 60000 );
-- cannot perform a DML operation on a read-only view 
-- read only로 할당해준 view니까 insert가 불가능하다

-- [ WITH CHECK OPTION ]
-- view 입력,수정,삭제시 실제 테이블이 반영됨, view는 조회결과이므로 반영됨
-- 1) email 컬럼을 추가해서 view 생성 : WITH CHECK OPTION
-- 2) 111,112,113 insert(update는 차후에 하고, email 컬럼 insert 제외) => 조회 조건에 3건만 제약조건
-- 3) email update
-- 4) delete

-- 1) email 컬럼을 추가해서 view 생성 : WITH CHECK OPTION
CREATE OR REPLACE VIEW v_emp_chkoption
as
select empno
     , ename
     , hire_date
     , deptno
     , salary
     , email -- 추가
from emp_tbl
where empno in(111,112,113)   -- 지정한 제약조건에 만족하는 데이터에 한해 DML(I,U,D)작업이 가능
WITH CHECK OPTION;

select * from v_emp_chkoption;


-- 2) 데이터추가 111,112,113 insert(update는 차후에 하고, email 컬럼 insert 제외) => 조회 조건에 3건만 제약조건
select into v_emp_chkoption(empno, ename, hire_date, deptno, salary)
 values(111, '기안', sysdate, 50, 50000);
select into v_emp_chkoption(empno, ename, hire_date, deptno, salary)
 values(112, '이효리', sysdate, 50, 90000);
 select into v_emp_chkoption(empno, ename, hire_date, deptno, salary)
 values(113, '김상순', sysdate, 50, 40000);
 commit;
 
 -- 3) email update
 -- [기존데이터 5건]
 select * from emp_tbl;
 
 --[ view를 통한 추가데이터 3건]
 select * from v_emp_chkoption;
 
 -- email updatehttps://cafe.naver.com/withjasmine
 update v_emp_chkoption
    set email = 'kian@email.com'
where empno = 111;
 update v_emp_chkoption
    set email = 'leehr@email.com'
where empno = 112;
 update v_emp_chkoption
    set email = 'kimss@email.com'
where empno = 113;
commit;

select * from v_emp_chkoption;
select * from emp_tbl;
 
 -- 4) delete
 delete from v_emp_chkoption
 where empno = 111;
 commit;
 
 
 
------------------------------------------------------------
--SQL Developer로 가서 실행한 코드

SELECT view_name, text
  FROM user_views;

select * from v_emp_dept;

desc emp_tbl;    -- 해당테이블이 갖고 있는 구조를 보여준다

select * from tab;     -- 테이블 목록 확인


INSERT INTO v_emp_readonly(empno, ename, hire_date, deptno, salary)
 values(106, '롤스토이', sysdate, 60, 60000 );





----------------------------------------------------------------------------------------
-- 2025.6.25


/*
  	중요
  
 	인라인뷰 : 일회성으로 만들어서 사용하는뷰
 	
 	 
 */


SELECT rownum AS 순위			-- rownum => 행(row)의 고유 번호, 넘버링
 	 , e.*
  FROM emp_tbl e
ORDER BY e.empno desc;	



-- 최근 회원가입순으로 2명 출력 (인라인뷰)
SELECT rownum AS 순위
	 , e.* 
  FROM emp_tbl e
WHERE rownum < 3;


------------------------ hr 계정으로 테스트
-- 2) 입사일이 빠른 순서로 5명 출력 (인라인뷰 + 서브쿼리)

SELECT EMPLOYEE_ID 사번
	 , LAST_name
	 , hire_date
	 , salary
  FROM EMPLOYEES
 ORDER BY hire_date ASC;	-- 107건


SELECT rownum AS 순위
	 , e.* 
  FROM (SELECT EMPLOYEE_ID
	 	, LAST_name
	 	, hire_date
	 	, salary
  	  	FROM EMPLOYEES
	 	ORDER BY hire_date ASC) e
  WHERE rownum < 6;                -- 5건


-- 3) 고액 급여 5명 출력(인라인뷰 + 서브쿼리)
SELECT rownum AS 순위
	 , e.* 
  FROM (SELECT EMPLOYEE_ID
	 	, LAST_name
	 	, hire_date
	 	, salary
  	  	FROM EMPLOYEES
	 	ORDER BY salary desc) e			-- desc로 해야, 넘버링이 늘어날수록 급여가 적어짐.(급여가높은사람부터 보임)
  WHERE rownum < 6;                -- 5건

/*
1	100	King	1055775600000	24000
2	101	Kochhar	1127228400000	17000
3	102	De Haan	979311600000	17000
4	145	Russell	1096556400000	14000
5	146	Partners	1104850800000	13500		-- 입사일 hire_date가 이상하게 출력되는것은 툴이 날짜를 밀리초 숫자로 전환하는등의 날짜포맷처리 오류로 일어나는 일이라고 함..
 */



 -- 4) 인라인 뷰 (WITH절 사용) - 가독성

WITH 								-- 나는 emp라는 별칭에 대해 설명한다
 emp AS (SELECT EMPLOYEE_ID
	 	, LAST_name
	 	, hire_date
	 	, salary
  	  	FROM EMPLOYEES
	 	ORDER BY salary desc)
SELECT rownum AS 순위
	 , emp.* 
  FROM emp     			-- 별칭만 준다
  WHERE rownum < 6;
 








































