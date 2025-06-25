-- 6.23복습

--hr 계정에서 실행
-- 1. 단일행 서브쿼리
-- 1) last_name이 'Chen'의 급여(=8200)보다 많은 급여를 받는 사원의 사번, 이름, 급여를 구하시오.(급여는 오름차순)
SELECT EMPLOYEE_ID
	 , LAST_NAME
	 , SALARY
  FROM EMPLOYEES
 WHERE salary > (SELECT salary
			      FROM employees
			      WHERE LAST_NAME = 'Chen')
ORDER BY SALARY ASC;


--2) 'Chen'과 같은 부서(=100)에서 일하는 사원의 사번, 이름, 부서번호, 부서명을 구하시오(사번 오름차순) 
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서번호
	 , d.DEPARTMENT_NAMEea
  FROM EMPLOYEES e
     , DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.DEPARTMENT_ID = (SELECT d.DEPARTMENT_ID
                            FROM employees e
                           WHERE e.LAST_NAME = 'Chen')
ORDER BY e.EMPLOYEE_ID ASC;
 


-- 3) job_title이 'Programmer'를 포함하는 사원과 같은 직무(job_id=IT_PROG)에서 일하는 사원의 
-- 사번, 사원명, job_id, 급여 출력
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 사원명
	 , e.JOB_ID jobId
	 , e.SALARY 급여
	 , j.JOB_TITLE 직무명
  FROM EMPLOYEES e
     , JOBS j
 WHERE e.JOB_ID = j.JOB_ID
   AND j.JOB_ID = (SELECT JOB_ID
                     FROM jobs
                    WHERE JOB_TITLE like '%Programmer%');

 ------------------------------------------
 -- 2025.6.24 복습
 -- 사원테이블에서 20,30,40번 부서에서 근무하는 사원의 사번, 이름, job_id, 급여, 부서ID 출력(단 부서번호로 정렬) 
SELECT e.EMPLOYEE_ID 사번
     , e.FIRST_NAME 이름
     , e.JOB_ID 직무번호
     , e.SALARY 급여
     , d.DEPARTMENT_ID 부서번호
  FROM EMPLOYEES e
     , departments d
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
  AND d.DEPARTMENT_ID in (SELECT e.department_id
                           FROM EMPLOYEES e
                           WHERE e.DEPARTMENT_ID IN (20,30,40))
ORDER BY d.department_id ASC;

 
 --  각 부서별 최대급여
SELECT max(salary) 최대급여
     , DEPARTMENT_ID 부서번호
  FROM employees
 GROUP BY DEPARTMENT_ID
 ORDER BY department_id;
  
-- 각 부서별 최대 급여와 동일한 급여를 받는 사원정보 
--     => 서브쿼리정보(12건)의 급여만 일치하는 정보를 가져와라
 SELECT e.LAST_NAME 사원명
      , e.DEPARTMENT_ID 부서번호
   FROM EMPLOYEES e
  WHERE (e.department_id,salary) IN (SELECT DEPARTMENT_ID		-- 서브쿼리문의 결과값 갯수(department_id, salary)와 메인쿼리 갯수값을 맞춰줘야함
  								 , round(max(SALARY),0) 
                         	FROM employees
                           GROUP BY department_id)
ORDER BY department_id asc;		-- 11건
/*
Whalen	10
Hartstein	20
Raphaely	30
Mavris	40
Fripp	50
Hunold	60
Baer	70
Russell	80
King	90
Greenberg	100
Higgins	110
 */

 
-- 2) ANY, SOME - 메인쿼리의 비교조건이 서브쿼리의 결과와 하나 이상이 일치하면 참이다.
--  > ANY : 메인쿼리 결과값 > 서브쿼리의 최소값
--  < ANY : 메인쿼리 결과값 < 서브쿼리의 최대값   
-- 30번 부서의 최소 salary(2500)보다 큰 정보 ANY
 SELECT salary 급여
      , department_id 부서번호
   FROM employees
  WHERE salary < ANY (SELECT min(salary)
                      FROM employees
                     WHERE DEPARTMENT_ID = 30)
ORDER BY salary ASC;
  
 
                  
-- 30번 부서의 최대 salary(11000)보다 큰 정보
SELECT department_id
	 , salary
  FROM employees
 WHERE salary > ANY (SELECT salary
                      FROM employees
                     WHERE DEPARTMENT_ID = 30)
 order BY salary ASC;
 
 
-- 4) EXISTS : 서브쿼리에 결과값이 하나이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 모두 false
-- EXISTS가 false이면 검색결과가 없다.
 SELECT department_id
	 , salary
  FROM employees
 WHERE  EXISTS (SELECT salary
                      FROM employees
                     WHERE DEPARTMENT_ID = 30)
   AND DEPARTMENT_ID = 30
 order BY salary ASC;
/*
30	2600
30	2800
30	2900
30	3100
30	11000
 */
 SELECT department_id
	 , salary
  FROM employees
 WHERE exists(SELECT salary
                      FROM employees
                     WHERE DEPARTMENT_ID = 300)
   AND DEPARTMENT_ID = 300
 order BY salary ASC;
-- 출력되는 값이 없다.

 
 -- 30번부서 최대급여 EXISTS 조인응용 부서명 가져오기
 SELECT e.DEPARTMENT_ID 부서번호
 	  ,	e.SALARY 급여
 	  ,	d.DEPARTMENT_NAME 부서명
   FROM EMPLOYEES e
   	  , departments d
  WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
    AND exists(SELECT max(salary)
  				  FROM employees
  				WHERE department_id = 30)
    AND d.DEPARTMENT_ID = 30
ORDER BY d.DEPARTMENT_ID ASC; 

 -- 5)스칼라 서브쿼리 : SELECT 절에서 사용하는 서브쿼리
 -- 반드시 한 컬럼만 반환하는 서브쿼리이다. 만약 한컬럼이 여러개의 값을 가지면 오류가 발생한다.
SELECT e.EMPLOYEE_ID 
     , e.LAST_NAME
     , (SELECT round(avg(salary)) FROM employees) AS 평균급여
     , e.DEPARTMENT_ID
     , (SELECT d.department_name FROM departments d 
     			WHERE e.DEPARTMENT_ID = d.department_id) AS 부서명
     , (SELECT d.DEPARTMENT_NAME FROM departments d, employees e
     		WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
     		AND d.DEPARTMENT_ID = 10)
  FROM employees e;



-- 6-1) 인라인뷰 : FROM절에서 사용하는 서브쿼리
-- 특정 테이블 전체가 아닌, SELECT문을 통해 일부 데이터를 추출한 후 별칭을 주어 사용
-- 10번 부서의 사번, 이름, 직무, 급여, 부서코드, 부서명 가져오기
SELECT e.EMPLOYEE_ID 사번
     , e.LAST_NAME 이름
     , e.JOB_ID 직무
     , e.SALARY
     , d.DEPARTMENT_ID
  FROM (SELECT department_id
          FROM DEPARTMENTS
          WHERE DEPARTMENT_ID = 10) d
     , EMPLOYEES e
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID;
 
 

-- 6-2). with절 : 인라인뷰를 가독성있게 사용할 경우
/* 테이블내 데이터 규모가 크거나, 현재 작업에 불필요한 열이 너무 많아, 행과 열만 사용하고자 할 때 사용
 * - 문법 
 *   WITH
 *   별칭1 AS (SELECT문),
 *   별칭2 AS (SELECT문)
 *   메인쿼리..
 *      FROM 별칭1,별칭2
 * 
 * - 실행 => WITH~끝 
 */  


WITH
d AS (SELECT department_id FROM departments WHERE DEPARTMENT_ID = 10)
SELECT e.EMPLOYEE_ID 사번
     , e.LAST_NAME 이름
     , e.JOB_ID 직무
     , e.SALARY
     , d.DEPARTMENT_ID
  FROM d
     , employees e
 WHERE e.department_id = d.DEPARTMENT_ID;



 
 
 
 