-- 복습
-- 2025.6.16


-- 사원테이블에서 사번, 이름(First Name, Last Name), 부서코드 조회
SELECT EMPLOYEE_ID , FIRST_NAME ,LAST_NAME , DEPARTMENT_ID 
  FROM EMPLOYEES;

-- 부서테이블에서 부서번호, 부서명 조회
SELECT DEPARTMENT_ID , DEPARTMENT_NAME 
  FROM DEPARTMENTS;


-- 국가테이블에서 국가아이디, 국가명 조회
SELECT COUNTRY_ID , COUNTRY_NAME 
  FROM COUNTRIES;


-- 부서명 WHERE절 조회 (부서번호가 20)
SELECT DEPARTMENT_ID , DEPARTMENT_NAME 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 20;

-- 사원테이블에서 사원번호 110번이 누구인지를 찾아라
SELECT LAST_NAME, FIRST_NAME 
  FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 110;

 -- 사원테이블에서 사번, 이름, 부서코드 조회, 부서코드 오름차순 정렬
SELECT EMPLOYEE_ID , FIRST_NAME , DEPARTMENT_ID 
  FROM EMPLOYEES
  ORDER BY DEPARTMENT_ID ASC;


 -- 실습 4-1
-- 사번, 이름, 이메일, 입사일 조회 
-- (이메일 오름차순, FIRST_NAME 오름차순, 입사일 내림차순)
SELECT EMPLOYEE_ID , FIRST_NAME , EMAIL , HIRE_DATE 
  FROM EMPLOYEES
  ORDER BY email ASC, FIRST_NAME ASC, HIRE_DATE DESC;

 -- 실습 4-2
 -- 사원테이블에서 사번, First_name, 이메일, 
 -- 입사일, 급여, 부서코드, 직무코드 조회(사번이 206번일때)
 SELECT EMPLOYEE_ID , FIRST_NAME , EMAIL , HIRE_DATE , SALARY , DEPARTMENT_ID , JOB_ID
   FROM EMPLOYEES
   WHERE EMPLOYEE_ID = 206;


-- 실습 4-3
-- 부서테이블 모든 정보 조회
 SELECT * FROM DEPARTMENTS;

-- 실습 4-4
-- 부서테이블에서 부서코드, 부서명, 지역코드 조회(부서코드가 110번일 때)
SELECT DEPARTMENT_ID , DEPARTMENT_NAME , LOCATION_ID 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID  = 110;

-- 실습 4-5
-- 모든 지역테이블 정보 조회
SELECT * FROM LOCATIONS;

-- 실습 4-6. 지역테이블에서 지역코드, 주소(street_address), 
-- 도시, 국가코드 조회(지역코드가 1700일때) 
SELECT LOCATION_ID , STREET_ADDRESS, CITY , COUNTRY_ID 
  FROM LOCATIONS
 WHERE LOCATION_ID = 1700;

-- 실습 4-7. 국가테이블(countries) 정보 조회
SELECT * FROM COUNTRIES;

-- 실습 4-8. 국가ID, 국가명, 지역코드(국가코드가 US일때)
SELECT COUNTRY_ID , COUNTRY_NAME , REGION_ID 
  FROM COUNTRIES
 WHERE COUNTRY_ID = 'US';


 -- 실습 4-9. 직무테이블 조회
SELECT * FROM JOBS;

-- 실습 4-10. 직무테이블에서 직무코드, 직무타이틀, 최소급여 조회(직무코드가 AC_ACCOUNT일때)
SELECT JOB_ID , JOB_TITLE , MIN_SALARY
  FROM JOBS 
 WHERE JOB_ID = 'AC_ACCOUNT';


 -- 실습 4-11. 직무히스토리 테이블 조회
SELECT * FROM JOB_HISTORY ;

-- 실습 4-12. 직무히스토리 테이블에서 사원의 사번, 시작일, 종료일, 부서코드 조회
-- (job_id가 AC_ACCOUNT)
SELECT EMPLOYEE_ID , START_DATE , END_DATE , DEPARTMENT_ID 
  FROM JOB_HISTORY 
  WHERE JOB_ID = 'AC_ACCOUNT';
  












