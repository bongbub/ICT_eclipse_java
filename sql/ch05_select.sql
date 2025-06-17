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
-- 단 salary가 10000이상이고, 사번이 150이상이고, last_name이 Ozer인 사원일 때


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







