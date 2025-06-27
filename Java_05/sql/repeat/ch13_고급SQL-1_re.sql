-- 2025.6.26
-- 복습

-- 부서별 직무별 그룹함수
SELECT DEPARTMENT_ID 부서명
     , job_id 직무명
     , count(*)
     , round(sum(salary)) 총급여
     , round(avg(salary)) 평균급여
     , round(max(salary)) 최대급여
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID, JOB_ID
 ORDER BY DEPARTMENT_ID, job_id;


-- rollup
SELECT DEPARTMENT_ID 부서명
     , job_id 직무명
     , count(*)
     , round(sum(salary)) 총급여
     , round(avg(salary)) 평균급여
     , round(max(salary)) 최대급여
  FROM EMPLOYEES
 GROUP BY ROLLUP (DEPARTMENT_ID, JOB_ID)
 ORDER BY DEPARTMENT_ID, job_id;


-- cube
SELECT DEPARTMENT_ID 부서명
     , job_id 직무명
     , count(*)
     , round(sum(salary)) 총급여
     , round(avg(salary)) 평균급여
     , round(max(salary)) 최대급여
  FROM EMPLOYEES
 GROUP BY CUBE (DEPARTMENT_ID, JOB_ID)
 ORDER BY DEPARTMENT_ID, job_id;

-- grouping sets
SELECT DEPARTMENT_ID 부서명
     , job_id 직무명
     , count(*)
     , round(sum(salary)) 총급여
     , round(avg(salary)) 평균급여
     , round(max(salary)) 최대급여
  FROM EMPLOYEES
 GROUP BY GROUPING sets (DEPARTMENT_ID, JOB_ID)
 ORDER BY DEPARTMENT_ID, job_id;



SELECT DEPARTMENT_ID 부서명
     , job_id 직무명
     , count(*)
     , round(sum(salary)) 총급여
     , round(avg(salary)) 평균급여
     , round(max(salary)) 최대급여
     , GROUPING(department_id)
     , GROUPING(job_id)
  FROM EMPLOYEES
 GROUP BY CUBE (DEPARTMENT_ID, JOB_ID)
 ORDER BY DEPARTMENT_ID, job_id;


-- LISTAGG ~ WITHIN GROUP
SELECT DEPARTMENT_ID
	 , listagg(last_name, ',')  -- ,를 기준으로 나열
	 WITHIN group(ORDER BY salary desc) AS lastname
  FROM employees
  GROUP BY department_id, job_id
  ORDER BY department_id, job_id ASC;


-- pivot
SELECT *
  FROM (SELECT department_id, job_id, salary
  		FROM employees)
  	pivot(max(salary))
  		FOR department_id IN (10,20,30)
  		)
  ORDER BY job_id;

-- 잘 만들어진건지 검증
SELECT job_id, department_id, max(salary)
  FROM EMPLOYEEs
  WHERE DEPARTMENT_ID < 40
  GROUP BY job_id, department_id
ORDER BY department_id;

