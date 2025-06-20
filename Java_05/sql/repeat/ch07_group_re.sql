-- 2025.6.19
-- groupMethod repeat


-- 1. SUM : 합계 그룹함수
SELECT sum(salary) AS 급여총액 
FROM EMPLOYEES;

SELECT salary AS 급여
FROM EMPLOYEES;

-- 2. AVG : 평균 그룹함수
-- 급여평균
SELECT avg(SALARY)
  FROM EMPLOYEES;


-- 급여평균 소수점 3째자리에서 반올림
SELECT round(avg(salary), 2)
  FROM EMPLOYEES;

-- 3. MAX, MIN : 최댓값, 최솟값 그룹함수
SELECT max(SALARY)
  FROM EMPLOYEES;

SELECT min(salary)
  FROM EMPLOYEES;

-- 최근 입사일, 가장 오래된 입사일
SELECT max(hire_date)AS 최근입사일
     , min(hire_date)AS 오래된입사일
  FROM EMPLOYEES;

-- 사원수
SELECT count(EMPLOYEE_ID)
  FROM EMPLOYEES;

-- 커미션을 받은 사원수는?
SELECT count(COMMISSION_PCT)
  FROM EMPLOYEES;

-- 커미션이 null이 아닐때 값
SELECT count(*)
  FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL;

-- 부서테이블의 부서갯수
SELECT count(DEPARTMENT_ID)
  FROM DEPARTMENTS;

--사원테이블의 부서갯수
SELECT count(DEPARTMENT_ID)
  FROM EMPLOYEES;

-- 사원테이블에 null이 아닌 부서갯수
SELECT count(DEPARTMENT_ID)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL;
-- 사원테이블 null인 부서갯수
SELECT count(*)
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NULL;

--사원테이블에서 부서코드를 중복되지 않게 출력 not null
SELECT DISTINCT DEPARTMENT_ID
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL;

-- 사원테이블의 급여총액, 최대급여, 급여평균(둘째자리),사원수
SELECT sum(salary) 급여총액
     , max(salary) 최대급여
     , round(avg(salary),2) 급여평균
     , count(EMPLOYEE_ID) 사원수
  FROM EMPLOYEES;

-- 부서별 평균급여(부서코드 오름차순 정렬)
SELECT DEPARTMENT_ID 부서코드
	 , round(avg(salary)) 평균급여
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
  ORDER BY DEPARTMENT_ID asc;
 

-- 사원테이블에서 부서별, 직무(job_id)별 최대급여 구하기(소수점이하 둘째자리), 부서정렬  
SELECT 
	   DEPARTMENT_ID 부서번호
	 , JOB_ID 직무
	 , round(max(SALARY),2) 최대급여
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 		, job_id
 ORDER BY DEPARTMENT_ID ASC;

-- 사원테이블에서 직무(job_id)별 총급여, 최대급여, 최소급여, 직무정렬 
SELECT job_id 직무
     , round(sum(salary))
	 , round(max(salary)) 총급여
	 , round(min(salary)) 최대급
  FROM EMPLOYEES
 GROUP BY JOB_ID
 ORDER BY JOB_ID;
 

-- 부서별, 직무(job_id)별 인원수, 최대급여, 급여평균 구하기(소수점 두째자리)
-- 부서, 직무 오름차순 정렬(단 부서는 NULL 허용안함)
SELECT DEPARTMENT_ID 부서번호
	 , job_id 직무
	 , count(job_id) 직무별인원수
     , max(salary) 최대급여
     , round(avg(salary),2) 급여평균
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NOT null
 GROUP BY DEPARTMENT_ID, job_id
 ORDER BY DEPARTMENT_ID asc, JOB_ID ASC;
  

-- 부서별, 직무(job_id)별 인원수, 최대급여, 급여평균, 총급여 구하기(소수점 두째자리)
-- 부서, 직무 오름차순 정렬(단 부서는 NULL 허용안함), 총급여가 50000원 이상
SELECT DEPARTMENT_ID 부서번호
	 , JOB_ID 직무번호
	 , count(job_id) 직무별인원수
	 , round(max(salary),2) 최대급여
	 , round(avg(salary),2) 급여평균
	 , round(sum(salary),2) 총급여
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NOT null
 GROUP BY DEPARTMENT_ID
 		, job_id
 HAVING sum(SALARY) >= 50000
 ORDER BY DEPARTMENT_ID, JOB_ID ASC;


-- 부서별 최대급여, 총급여(단 총급여가 15000 이상), 부서코드 오름차순 정렬
-- 부서코드가 없으면 제외
SELECT DEPARTMENT_ID 부서번호
	 , round(max(salary))
	 , round(sum(SALARY))
  FROM EMPLOYEES
  WHERE DEPARTMENT_ID IS NOT null
 GROUP BY DEPARTMENT_ID
 HAVING sum(salary) >= 15000
 ORDER BY DEPARTMENT_ID ASC;



-- 직무별 총급여, 평균급여(단 평균급여가 5000 이상)
-- 소수점 이하는 무조건 절삭(TRUNC), 직무(job_id) 오름차순 정렬(단 job_id가 IT를 포함할때 조회안되도록
SELECT job_id 직무
     , trunc(sum(SALARY)) 총급여
     , Trunc(avg(salary)) 평균급여
  FROM EMPLOYEES
  WHERE JOB_ID NOT like '%IT%'
 GROUP BY JOB_ID
 HAVING avg(salary) >= 5000
 ORDER BY JOB_ID ASC;



