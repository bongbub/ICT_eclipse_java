

-- 2025.6.19
-- SQL 4일차

-- 07-2 결과값을 원하는 열로 묶어 출력하는 Group by절

/*
 * ch7. 그룹함수 => 중요
 * 7-1. 그룹함수  (SUM(), AVG(), 
 * 7-2. GROUP BY
 * 7-3. HAVING
 */
-- 그룹함수 : 테이블의 전체 데이터중에서 통계적인 결과를 구하기 위해서,
--  하나 이상의 행을 그룹으로 묶어 연산하여 하나의 결과를 구한다.


-- 1. SUM : 합계 그룹함수
-- 급여합계
SELECT sum(SALARY) AS 급여총액     -- 691416 (한건 출력)
  FROM EMPLOYEES;

SELECT SALARY AS 급여총액     -- 107건
  FROM EMPLOYEES;


-- 2. AVG : 평균 그룹함수
-- 급여평균
SELECT avg(salary) AS 급여평균		-- 1건
  FROM employees;

-- 급여평균 소수점 3째자리에서 반올림
SELECT round(avg(salary),2) AS 급여평균		-- 1건  6461.83
  FROM employees;



-- 3. MAX, MIN : 최댓값, 최솟값 그룹함수
SELECT max(salary)
  FROM employees;			-- 24000 1건

SELECT min(salary)
  FROM employees; 			-- 2100  1건

-- 최근 입사일, 가장 오래된 입사일
  -- 날짜는 최근일 수록 크당~
SELECT max(hire_date) AS 최근입사일			-- 2008-04-21 00:00:00.000
	, min(HIRE_DATE) AS 오래된입사일	-- 2001-01-13 00:00:00.000
  FROM EMPLOYEES ;			





-- 4. COUNT(*) : 전체행(=row) 갯수를 구하는 그룹함수
-- COUNT(*) : NULL값으로 된 행, 중복된 행을 비롯하여 선택된 모든 행을 카운트한 갯수
-- COUNT(컬럼명) : 컬럼명의 값이 NULL이 아닌 갯수, 중복된 행 포함

-- 사원수
SELECT count(*) AS 사원수 
 FROM employees;			-- 1건 107
 WHERE EMPLOYEE_ID IS NOT NULL;		-- pk이므로 null체크 안함
 
-- 커미션을 받은 사원수는?
SELECT count(COMMISSION_PCT)
FROM employees;				-- 1건 35
-- 커미션이 null이 아닐때 깞
SELECT count(*)
FROM employees
WHERE COMMISSION_PCT IS NOT NULL;	-- 1건 35

-- 부서테이블의 부서갯수
SELECT count(*) AS 부서갯수
  FROM DEPARTMENTS;						-- 1건 27  -- department_id는 pk임
  
--사원테이블의 부서갯수
SELECT count(DEPARTMENT_ID)			-- 1건 106 
  FROM EMPLOYEES;

SELECT department_id
FROM employees
WHERE DEPARTMENT_ID IS NULL;		-- 1건 NULL (107건 중 한 건이 null임)


--사원테이블에서 부서코드를 중복되지 않게 출력
SELECT DISTINCT DEPARTMENT_ID
FROM employees
WHERE DEPARTMENT_ID IS NOT NULL;


-- 사원테이블의 급여총액, 최대급여, 급여평균(둘째자리),사원수
SELECT sum(salary) AS 급여총액
	 , max(salary) AS 최대급여
	 , round(avg(SALARY),2) AS 급여평균
	 , count(EMPLOYEE_ID) AS 사원수
FROM EMPLOYEES;


/*
 * 7-2. GROUP BY
 * - 특정 컬럼을 기준으로 그룹별로 나눌때 사용
 * - 형식
 *   SELECT 컬럼1,..컬럼n, 그룹함수
 *     FROM 테이블명
 *    WHERE 조건
 *   GROUP BY 컬럼1,..컬럼n
 *   ORDER BY 컬럼명 ASC | DESC;
 * 
 * - GROUP BY절 다음에 컬럼의 별칭은 사용할 수 없다.
 * - 그룹함수가 아닌 SELECT 리스트의 모든 일반 컬럼은 GROUP BY 절에 반드시 기술해야 한다.(중요)
 *   그러나 반대로 GROUP BY 절에 기술된 컬럼이 반드시 SELECT 리스트에 있어야 하는 것은 아니다. 
 *   단지 결과가 무의미하다.
 */ 


-- 부서별 평균급여(부서코드 오름차순 정렬)
SELECT department_id AS 부서코드
	 , avg(salary) AS 평균급여
FROM EMPLOYEES
GROUP BY department_id
ORDER BY department_id ASC;


-- 사원테이블에서 부서별, 직무(job_id)별 최대급여 구하기(소수점이하 둘째자리), 부서정렬  
SELECT DEPARTMENT_ID AS 부서코드
     , JOB_ID AS 직무
     , round(max(salary),2) AS 최대급여
  FROM EMPLOYEES
GROUP BY DEPARTMENT_ID		-- 부서별 그룹화
		, JOB_ID			-- 직무별 그룹화
ORDER BY DEPARTMENT_ID ASC;
-- job_id 때문에 부서코드가 중복되게됨. 
-- 같은 부서에 직무코드가 여러개 있기 때문에
-- cf) group by employee_id 할 필요 없다! 
--	왜냐 이미 employee_id는 pk이기때무네 굳이 할 필요 없당



-- 사원테이블에서 직무(job_id)별 총급여, 최대급여, 최소급여, 직무정렬 
SELECT job_id	AS 직무
	 , sum(salary) AS 총급여
	 , max(salary) AS 최대급여
	 , min(salary) AS 최소급여
  FROM EMPLOYEES
GROUP BY JOB_ID
ORDER BY job_id;


-- 부서별, 직무(job_id)별 인원수, 최대급여, 급여평균 구하기(소수점 두째자리)
-- 부서, 직무 오름차순 정렬(단 부서는 NULL 허용안함)
SELECT DEPARTMENT_ID AS 부서번호
	 , JOB_ID AS 직무
	 , count(*) AS 인원수
	 , max(salary) AS 최대급여
	 , round(avg(salary),2) AS 급여평균
  FROM EMPLOYEES
 WHERE department_id IS NOT null
GROUP BY DEPARTMENT_ID
  	 , JOB_ID
ORDER BY DEPARTMENT_ID, job_id ASC;


/*
 * 7-3. 그룹함수 제한 : HAVING절 => 중요 p190
 * - 표시할 그룹을 지정하여 집계정보를 기준으로 Filtering
 * - HAVING + 그룹함수 조건절
 * - 형식
 *   SELECT 컬럼1,..컬럼n, 그룹함수
 *     FROM 테이블명
 *    WHERE 조건
 *   GROUP BY 컬럼1,..컬럼n
 *   HAVING + 그룹함수 조건절
 *   ORDER BY 컬럼명 ASC | DESC;
 */


-- 부서별, 직무(job_id)별 인원수, 최대급여, 급여평균, 총급여 구하기(소수점 두째자리)
-- 부서, 직무 오름차순 정렬(단 부서는 NULL 허용안함), 총급여가 50000원 이상
SELECT DEPARTMENT_ID AS 부서번호
	 , JOB_ID AS 직무
	 , count(*) AS 인원수
	 , max(salary) AS 최대급여
	 , round(avg(salary),2) AS 급여평균
	 , sum(salary) AS 총급여
  FROM EMPLOYEES
 WHERE department_id IS NOT NULL
GROUP BY DEPARTMENT_ID
  	 , JOB_ID
HAVING sum(salary) >= 50000
ORDER BY DEPARTMENT_ID, job_id ASC; 		-- 4건
-- 그룹함수의 조건은 HAVING에서 줘야한다! (HAVING : 그룹을 제한하는 조건식)

-- 부서별 최대급여, 총급여(단 총급여가 15000 이상), 부서코드 오름차순 정렬
-- 부서코드가 없으면 제외
SELECT DEPARTMENT_ID AS 부서코드
	 , max(SALARY) AS 최대급여
     , sum(SALARY) AS 총급여
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID IS NOT NULL
 GROUP BY DEPARTMENT_ID
 HAVING sum(salary) >= 15000
 ORDER BY DEPARTMENT_ID ASC;


-- 직무별 총급여, 평균급여(단 평균급여가 5000 이상)
-- 소수점 이하는 무조건 절삭(TRUNC), 직무(job_id) 오름차순 정렬(단 job_id가 IT를 포함할때 조회안되도록
SELECT job_id AS 직무
	 , trunc(sum(salary)) AS 총급여
	 , Trunc(avg(salary)) AS 평균급여
  FROM EMPLOYEES
WHERE JOB_ID NOT like '%IT%'
GROUP BY job_id
HAVING avg(salary) >= 5000
ORDER BY job_id ASC;


