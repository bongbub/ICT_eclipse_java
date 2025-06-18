-- 2025.6.17

--         AND OR 연산자
--      |피연산자1|  |피연산자2|
-- AND : true   +   true   =>  true
--	   : true   +   false  =>  false
--	   : false  +   true   =>  false
--     : false  +   false  =>  false
--------------------------
-- OR : true    +   true   =>  true
--    : true    +   false  =>  true
--    : false   +   true   =>  true
--    : false   +   false  =>  false



-- 실습 4-15. 사원테이블의 사번, 이메일, 급여, 부서, 입사일 조회 (단, 부서코드가 60번, 100번만 조회)
SELECT EMPLOYEE_ID
	 , EMAIL 
	 , SALARY
	 , DEPARTMENT_ID
	 , HIRE_DATE 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 60 
    OR DEPARTMENT_ID = 100;




/* 5장
 * [비교연산자]
 * - 같다 : =
 * - 같지않다 : <>, !=, ^=
 * - >, <, >=, <=
 */  



-- 실습 5-1. 사원테이블에서 사번, last_name, job_id, salary 조회
-- 			단, salary가 10000 이상이고, 사번이 150 이상이고, last_name이 Ozer인 사원일 때
SELECT EMPLOYEE_ID "사번"
     , LAST_NAME "이름"
     , JOB_ID "직무"
     , SALARY "연봉"
  FROM EMPLOYEES
 WHERE SALARY >= 10000 
   AND EMPLOYEE_ID >= 150
   AND LAST_NAME = 'Ozer';


-- 실습 5-2. 사원테이블에서 사번, 입사일, 급여, 부서ID 조회(부서ID 오름차순, 급여 내림차순)
--			단, 급여는 15000 이상
SELECT EMPLOYEE_ID
     , HIRE_DATE
     , SALARY 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE SALARY >= 15000
ORDER BY DEPARTMENT_ID ASC, SALARY DESC;



-- 실습 5-3. 부서테이블에서 부서ID가 50번 미만일때의 부서ID, 부서명, 매니저ID
SELECT DEPARTMENT_ID
     , DEPARTMENT_NAME 
     , MANAGER_ID 
  FROM DEPARTMENTS
 WHERE DEPARTMENT_ID < 50;


-- 실습 5-4. 사원테이블에서 salary가 10000이상 11000이하인 사원의 사번, salary 검색(오름차순 정렬)
SELECT EMPLOYEE_ID "사번"
     , SALARY "급여"
  FROM EMPLOYEES
 WHERE SALARY >= 10000
   AND SALARY <= 11000
ORDER BY SALARY ASC ;


-- 날짜 / 문자 데이터 조회
-- 실습 5-5.사원테이블에서 last_name이 King이거나 입사일이 05/07/16인 사원의 사번, last_name, 입사일 조회 
SELECT EMPLOYEE_ID
     , LAST_NAME 
     , HIRE_DATE 
  FROM EMPLOYEES
 WHERE LAST_NAME = 'King'
    OR HIRE_DATE = '05/07/16';



/* [IN 연산자] : 특정 컬럼의 값이 A,B,C 중에 하나라도 일치하면 참이 되는 연산자이다. => 중요!!!!!!!!!!!!!!!!!!
 * 				-> OR 여러개를 한 줄로 표기한 것과 같다 
 * - 형식 : 컬럼값 IN(A,B,C)  
 *         컬럼값 NOT IN(A,B,C) 
 * 		 
 */



-- 실습 5-6. 사원테이블에서 부서ID가 70,90,100인 사원의 사번, last_name, 부서ID로 조회(단 부서ID 오름차순)   -- 10건
SELECT EMPLOYEE_ID
     , LAST_NAME 
     , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IN (70,90,100)
ORDER BY DEPARTMENT_ID ASC;




/*  BETWEEN A AND B 연산자 => 중요
 * - WHERE 컬럼명 BETWEEN 최소값 AND 최대값; 
*/
-- 실습 5-7. salary가 10000이상 11000이하인 사원의 사번, salary 검색(오름차순 정렬) => 9건
SELECT EMPLOYEE_ID
     , SALARY
  FROM EMPLOYEES 
 WHERE SALARY BETWEEN 10000 AND 11000
ORDER BY SALARY ASC;



-- 실습 5-8. 사원테이블에서 사번, 입사일 조회(단 입사일은 04/12/31 ~ 05/01/30), 단 입사일 오름차순 정렬 => 3건
SELECT EMPLOYEE_ID
     , HIRE_DATE 
  FROM EMPLOYEES
 WHERE HIRE_DATE BETWEEN '04/12/31' AND '05/01/30'
ORDER BY HIRE_DATE ASC;
--146	2005-01-05 00:00:00.000
--142	2005-01-29 00:00:00.000
--150	2005-01-30 00:00:00.000





 /*
 *  LIKE 연산자와 와일드 카드 => 중요
 * - 컬럼명 LIKE Pattern(와일드카드)
 * - 와일드 카드 :
 *   % => 길이와 상관없이 모든 문자데이터를 의미
 *   _ => 어떤 값이든 상관없이 한개의 문자데이터를 의미
 */
 
 -- 실습 5-9. 사원테이블에서 last_name의 3번째, 4번째 단어가 'tt'인 사원의 사번, last_name 조회..사번 오름차순정렬
SELECT EMPLOYEE_ID
	 , LAST_NAME
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '__tt%'
ORDER BY EMPLOYEE_ID ASC;


-- 5-10. 사원테이블에서 사번, 'JONES'가 포함된 email 조회.. 사번 오름차순 정렬 - 1건
SELECT EMPLOYEE_ID, EMAIL 
  FROM EMPLOYEES
 WHERE EMAIL LIKE '%JONES%'
ORDER BY EMPLOYEE_ID ASC;


-- 5-11. JOBS 테이블에서 'REP'가 포함된 job_id 조회  -- 4건
SELECT JOB_ID 
  FROM JOBS
 WHERE JOB_ID LIKE '%REP%';
--HR_REP
--MK_REP
--PR_REP
--SA_REP


-- 5-12-1. 사원테이블에서 사번, 'ul'이 포함된 last_name 조회.. 사번 오름차순 정렬   --  6건
SELECT EMPLOYEE_ID , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '%ul%'
ORDER BY EMPLOYEE_ID ASC;
--148	Cambrault
--154	Cambrault
--155	Tuvault
--157	Sully
--182	Sullivan
--185	Bull



-- 5-12-2. 사원테이블에서 사번, 'ul'이 포함되지 않은 last_name 조회.. 사번 오름차순 정렬  -- 101건
SELECT EMPLOYEE_ID , LAST_NAME 
  FROM EMPLOYEES
 WHERE LAST_NAME NOT LIKE '%ul%'
ORDER BY EMPLOYEE_ID ASC;



/*
 * NULL : 미확정, 값이 정해져 있지 않아 알수없는 값을 의미하며, 연산불가, 비교불가, 대입불가
 *        연산시 관계 컬럼값도 null로 바뀐다. 예) 커미션이 null이면 연봉도 null
 *      - IS NULL, IS NOT NULL  예) 컬럼명 IS NULL, 컬럼명 IS NOT NULL
 
 -- PK(Primary Key) => 1.Unique(데이터가 중복되지 않아야 한다.)  2. NOT NULL(필수)
 */



-- 5-13-1.사원테이블에서 부서ID가 null이 아닌 행의 모든 컬럼을 조회(단 부서id로 오름차순 정렬)    -- 106건
SELECT *
  FROM EMPLOYEES
WHERE DEPARTMENT_ID IS NOT NULL 
ORDER BY DEPARTMENT_ID ASC;


-- 신설부서 조회 --1건
SELECT *
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;


-- 신입사원 조회 -> 사번 미정
SELECT *
  FROM EMPLOYEES
 WHERE EMPLOYEE_ID IS NULL;
-- primary key(여기선 employee_id)는 not null!
-- 때문에 나오는 값이 아예 없음.



-- 5-13-2.사원테이블의 employee_id, last_name, salary, salary*12+commission_pct 연봉, 
-- commission_pct 검색, salary >= 10000, commission_pct이 null이 아닐때  -- 11건
SELECT EMPLOYEE_ID , LAST_NAME , SALARY
     , SALARY * 12 + COMMISSION_PCT 
  FROM EMPLOYEES
 WHERE SALARY >= 10000 AND COMMISSION_PCT IS NOT NULL;



/*
 * 5-14. 합집합
 * -- UNION : 중복제거 / UNION ALL 중복허용
 * -- ORDER BY는 문장의 맨끝
 * -- 합집합(UNION), 교집합(INTERSECT), 차집합(MINUS)은 테이블간에 갯수와 자료형이 일치해야 한다. 테이블은 달라도 무관
 * 
 */


-- 10번부서 사원정보 + 20번부서 사원정보
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 10
UNION
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 20
 ORDER BY DEPARTMENT_ID DESC;  -- 문장 맨 끝에 온다

SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 20
UNION ALL
SELECT EMPLOYEE_ID 
	 , LAST_NAME 
	 , SALARY 
	 , DEPARTMENT_ID 
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID = 20;

