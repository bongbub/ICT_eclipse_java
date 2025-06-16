-- 2025.6.16
-- [ 1일차 ]

-- 열(컬럼), 행(로우), 테이블(데이터가 저장되는 장소)
-- KEY => PK(Primary Key), FK(Foreign Key)
-- 화면 입력 -> DTO(setter -> 멤버변수 -> getter)-> DB(List에 DTO정보를 add -> 테이블에 insert)

/* ctrl + shift + y 소문자
 * ctrl + shift + x 대문자
 * SELECT * FROM 테이블명;
 *
 * SELECT 컬럼1, 컬럼2... FROM 테이블명
 *  WHERE 조건절 => 행에 대한 조건절
 *  ORDER BY 컬럼명 ASC; => SELECT문 맨끝에 온다. 여러열 지정가능, 
    정렬한 데이터가 동일하면, 그 뒤에 오는 데이터의 정렬방식을 따른다.
 *        ASC(오름차순이며 생략가능), DESC(내림차순);
 */

-- 실습 4-1. 
-- SELECT * FROM 테이블명;




-- 사원테이블에서 사번, 이름(First Name, Last Name), 부서코드 조회
SELECT  EMPLOYEE_ID			-- 사번
	 , FIRST_NAME		-- 이름
		, LAST_NAME			
		, DEPARTMENT_ID		-- 부서코드 조회
		, SALARY 
  FROM EMPLOYEES;			-- 사원테이블에서

 
-- 부서테이블에서 부서번호, 부서명 조회
 SELECT DEPARTMENT_ID, DEPARTMENT_NAME
   FROM DEPARTMENTS;

-- 국가테이블에서 국가아이디, 국가명 조회
 SELECT COUNTRY_ID , COUNTRY_NAME FROM  COUNTRIES;


-- 부서명 WHERE절 조회
 SELECT DEPARTMENT_ID
 		, DEPARTMENT_NAME
   FROM DEPARTMENTS
  WHERE DEPARTMENT_ID = 20;


-- 부서테이블에서 사원번호 ???번이 누구인지를 찾아라
 SELECT FIRST_NAME, LAST_NAME
   FROM EMPLOYEES
  WHERE EMPLOYEE_ID = 119;

 SELECT LAST_NAME
   FROM EMPLOYEES
  WHERE FIRST_NAME = 'Karen';
 
 -- 사원테이블에서 사번, 이름, 부서코드 조회, 부서코드 오름차순 정렬
 SELECT EMPLOYEE_ID
 	  , FIRST_NAME
 	  ,	DEPARTMENT_ID
 	  , SALARY 
   FROM EMPLOYEES
  ORDER BY DEPARTMENT_ID DESC , SALARY ASC;

 
 -- 실습 4-1
-- 사번, 이름, 이메일, 입사일 조회 
-- (이메일 오름차순, FIRST_NAME 오름차순, 입사일 내림차순)
 SELECT EMPLOYEE_ID
 	  , FIRST_NAME
 	  , EMAIL
 	  , HIRE_DATE
   FROM EMPLOYEES
  ORDER BY EMAIL ASC, FIRST_NAME ASC, HIRE_DATE DESC;
 	  
 
 
 -- 실습 4-2
 -- 사원테이블에서 사번, First_name, 이메일, 입사일, 급여, 부서코드, 직무코드 조회(사번이 206번일때)
 SELECT EMPLOYEE_ID
 	  , FIRST_NAME 
 	  , EMAIL 
 	  , HIRE_DATE 
 	  , SALARY 
 	  , DEPARTMENT_ID 
 	  , JOB_ID 
   FROM EMPLOYEES
 WHERE EMPLOYEE_ID = 206;
 
-- 실습 4-3
-- 부서테이블 모든 정보 조회
 SELECT * FROM DEPARTMENTS;
 
-- 실습 4-4
-- 부서테이블에서 부서코드, 부서명, 지역코드 조회(부서코드가 110번일 때)
 SELECT DEPARTMENT_ID 
      , DEPARTMENT_NAME 
      , LOCATION_ID
 FROM DEPARTMENTS
 WHERE DEPARTMENT_ID = 110;
 
-- 실습 4-5
-- 모든 지역테이블 정보 조회
SELECT * FROM LOCATIONS;


-- 실습 4-6. 지역테이블에서 지역코드, 주소(street_address), 도시, 국가코드 조회(지역코드가 1700일때) 
SELECT LOCATION_ID 
	 , STREET_ADDRESS 
	 , CITY 
	 , COUNTRY_ID 
FROM LOCATIONS
WHERE LOCATION_ID = 1700;


-- 실습 4-7. 국가테이블(countries) 정보 조회
SELECT * 
  FROM COUNTRIES;

-- 실습 4-8. 국가ID, 국가명, 지역코드(국가코드가 US일때)
SELECT COUNTRY_ID 
	 , COUNTRY_NAME 
	 , REGION_ID 
  FROM COUNTRIES
 WHERE COUNTRY_ID = 'US';	-- 문자열은 ' '로 감싸야 함 (대소문자 구분)
 
 -- 실습 4-9. 직무테이블 조회
 SELECT * FROM JOBS;
 
 -- 실습 4-10. 직무테이블에서 직무코드, 직무타이틀, 최소급여 조회(직무코드가 AC_ACCOUNT일때)
 SELECT JOB_ID 
      , JOB_TITLE 
      , MIN_SALARY 
   FROM JOBS
  WHERE JOB_ID ='AC_ACCOUNT' ;
 

 -- 실습 4-11. 직무히스토리 테이블 조회
 SELECT * FROM JOB_HISTORY;
 
  -- 실습 4-12. 직무히스토리 테이블에서 사원의 사번, 시작일, 종료일, 부서코드 조회(job_id가 AC_ACCOUNT)
 SELECT EMPLOYEE_ID 
 	  , START_DATE 
 	  , END_DATE 
 	  , DEPARTMENT_ID 
 FROM JOB_HISTORY
 WHERE JOB_ID = 'AC_ACCOUNT';
 
 
 