-- 2025.6.17

-- 실습 4-15. 사원테이블의 사번, 이메일, 급여, 부서, 입사일 조회 (단, 부서코드가 60번, 100번만 조회)
SELECT EMPLOYEE_ID 
	 , EMAIL 
	 , SALARY 
	 , DEPARTMENT_ID 
	 , HIRE_DATE 
FROM EMPLOYEES 
WHERE DEPARTMENT_ID = 60 
OR DEPARTMENT_ID = 100;


-- 실습 5-1. 사원테이블에서 사번, last_name, job_id, salary 조회
-- 			단, salary가 10000 이상이고, 사번이 150 이상이고, last_name이 Ozer인 사원일 때
SELECT EMPLOYEE_ID "사번"
	 , LAST_NAME "이름"
	 , JOB_ID "직무"
	 , SALARY "연봉"
  FROM EMPLOYEES
 WHERE SALARY >= 10000 
   AND EMPLOYEE_ID  >= 150
   AND LAST_NAME = 'Ozer';


-- 실습 5-2. 사원테이블에서 사번, 입사일, 급여, 부서ID 조회(부서ID 오름차순, 급여 내림차순)
--			단, 급여는 15000 이상+


-- 실습 5-3. 부서테이블에서 부서ID가 50번 미만일때의 부서ID, 부서명, 매니저ID


-- 실습 5-4. 사원테이블에서 salary가 10000이상 11000이하인 사원의 사번, salary 검색(오름차순 정렬)



-- 날짜 / 문자 데이터 조회
-- 실습 5-5.사원테이블에서 last_name이 King이거나 입사일이 05/07/16인 사원의 사번, last_name, 입사일 조회 



-- 실습 5-6. 사원테이블에서 부서ID가 70,90,100인 사원의 사번, last_name, 부서ID로 조회(단 부서ID 오름차순)   -- 10건


-- 실습 5-7. salary가 10000이상 11000이하인 사원의 사번, salary 검색(오름차순 정렬) => 9건



-- 실습 5-8. 사원테이블에서 사번, 입사일 조회(단 입사일은 04/12/31 ~ 05/01/30), 단 입사일 오름차순 정렬 => 3건


-- 실습 5-9. 사원테이블에서 last_name의 3번째, 4번째 단어가 'tt'인 사원의 사번, last_name 조회..사번 오름차순정렬


-- 5-10. 사원테이블에서 사번, 'JONES'가 포함된 email 조회.. 사번 오름차순 정렬 - 1건


-- 5-11. JOBS 테이블에서 'REP'가 포함된 job_id 조회  -- 4건


-- 5-12-1. 사원테이블에서 사번, 'ul'이 포함된 last_name 조회.. 사번 오름차순 정렬   --  6건


-- 5-12-2. 사원테이블에서 사번, 'ul'이 포함되지 않은 last_name 조회.. 사번 오름차순 정렬  -- 101건


-- 5-13-1.사원테이블에서 부서ID가 null이 아닌 행의 모든 컬럼을 조회(단 부서id로 오름차순 정렬)    -- 106건



-- 신설부서 조회 --1건


-- 신입사원 조회 -> 사번 미정



-- 5-13-2.사원테이블의 employee_id, last_name, salary, salary*12+commission_pct 연봉, 
-- commission_pct 검색, salary >= 10000, commission_pct이 null이 아닐때  -- 11건


-- 10번부서 사원정보 + 20번부서 사원정보










