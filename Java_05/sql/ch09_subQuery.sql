-- 2025.6.23
-- 서브쿼리


/*============================= 굉~~~~장히 중요!!!!!!!!!!!!!!!! ===========================
 서브쿼리

 * 메인쿼리 내부에 포함된 SELECT 문장이다. 
 * 즉 서브쿼리에서 실행된 결과가 메인쿼리에 전달되어 최종적인 결과를 출력한다. 
 * - 메인쿼리 : 서브쿼리를 포함하고 있는 쿼리문
 * - 서브쿼리 : 메인쿼리에 포함된 쿼리문으로, 비교연산자의 오른쪽에 기술하고, 반드시 괄호안에 넣어야 한다.
 *            메인쿼리가 실행되기 전에 한번만 실행된다.
 *            서브쿼리의 SELECT 절에 명시한 열은 메인쿼리의 비교대상과 같은 자료형과 같은 갯수로 지정해야 한다.
 
 * - 종류 : 단일행 서브쿼리, 다중행 서브쿼리
 *   - 단일행 서브쿼리 : 수행결과가 오직 하나의 행만을 반환하는 서브쿼리
 *            연산자 : >, >=, =, <=, <, <>, !=, ^=
 *   - 다중행 서브쿼리 : 수행결과가 하나이상의 행만을 반환하는 서브쿼리 
 *            연산자 : IN, ANY, SOME, ALL, EXISTS
 */


-- hr 계정에서 실행 
-- 1. 단일행 서브쿼리
-- 1) last_name이 'Chen'의 급여(=8200)보다 많은 급여를 받는 사원의 사번, 이름, 급여를 구하시오.(급여는 오름차순)
SELECT e.SALARY
  FROM EMPLOYEES e
  WHERE e.LAST_NAME = 'Chen';  --이게 서브쿼리
 
SELECT EMPLOYEE_ID 사번
     , LAST_NAME 이름
     , SALARY 급여
  FROM EMPLOYEES
 WHERE SALARY >(SELECT e.SALARY
  				FROM EMPLOYEES e
  				WHERE e.LAST_NAME = 'Chen')
ORDER BY salary;


--2) 'Chen'과 같은 부서(=100)에서 일하는 사원의 사번, 이름, 부서번호, 부서명을 구하시오(사번 오름차순) 
SELECT e.EMPLOYEE_ID 사번
     , e.LAST_NAME 이름
     , d.DEPARTMENT_ID 부서번호
     , d.DEPARTMENT_NAME 부서명
  FROM EMPLOYEES e
     , DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.DEPARTMENT_id = (SELECT DEPARTMENT_ID
                          FROM employees
                          WHERE last_name = 'Chen') -- (= 100)
 ORDER BY e.EMPLOYEE_ID asc;


-- 3) job_title이 'Programmer'를 포함하는 사원과 같은 직무(job_id=IT_PROG)에서 일하는 사원의 
-- 사번, 사원명, job_id, 급여 출력
SELECT e.EMPLOYEE_ID 사번
     , e.LAST_NAME 사원명
     , j.JOB_ID 직무번호
     , e.SALARY 급여
     , j.JOB_TITLE 타이틀
  FROM JOBS j
     , EMPLOYEES e
 WHERE j.JOB_ID = e.JOB_ID
   AND j.JOB_ID = (SELECT JOB_ID
                      FROM jobs
                      WHERE JOB_TITLE Like '%Programmer%')
ORDER BY e.EMPLOYEE_ID ASC;


-------------------------------------------------------------------------------------------------------------------
--  << 2025.6.24 >>

/*                
 * 2. 다중행 서브쿼리 : 수행결과가 하나이상의 행만을 반환하는 서브쿼리 
 *            연산자 : IN, ANY, SOME, ALL, EXISTS  (IN, EXISTS만 주로 사용됨)
 */ 
-- 1) IN : => 중요 
-- 메인쿼리의 비교조건이 서브쿼리의 결과와 하나라도 일치하면 참 



-- 사원테이블에서 20,30,40번 부서에서 근무하는 사원의 사번, 이름, job_id, 급여, 부서ID 출력(단 부서번호로 정렬) 
SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
     , HIRE_DATE 입사일
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID in(20,30,40)
ORDER BY DEPARTMENT_ID asc;				-- 9건

--  각 부서별 최대급여
SELECT DEPARTMENT_ID 부서번호
     , max(salary) 최대급여
  FROM EMPLOYEES
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID ASC;   -- 12건
 
 
-- 각 부서별 최대 급여와 동일한 급여를 받는 사원정보 
--     => 서브쿼리정보(12건)의 급여만 일치하는 정보를 가져와라
SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
     , HIRE_DATE 입사일
  FROM EMPLOYEES
 WHERE DEPARTMENT_ID in(SELECT DEPARTMENT_ID 부서번호   -- 조건이 2개인데 메인절의 where의 조건은 한개 ==> 에러발생
     						 , max(salary) 최대급여
  						  FROM EMPLOYEES
 						 GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID asc;	


-- 수정본
SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
     , HIRE_DATE 입사일
  FROM EMPLOYEES
 WHERE (DEPARTMENT_ID, salary) in(SELECT DEPARTMENT_ID 부서번호
     						 		   , max(salary) 최대급여
  						  			FROM EMPLOYEES
 						 		GROUP BY DEPARTMENT_ID)
ORDER BY DEPARTMENT_ID asc;	


-- 2) ANY, SOME - 메인쿼리의 비교조건이 서브쿼리의 결과와 하나 이상이 일치하면 참이다.
--  > ANY : 메인쿼리 결과값 > 서브쿼리의 최소값
--  < ANY : 메인쿼리 결과값 < 서브쿼리의 최대값
 
-- 30번 부서의 최소 salary(2500)보다 큰 정보
SELECT min(salary) 최소급여
  FROM EMPLOYEES
 WHERE department_id = 30;


SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
     , HIRE_DATE 입사일
  FROM EMPLOYEES
 WHERE salary > any(SELECT min(salary) 최소급여   --2500
  					FROM EMPLOYEES
 					WHERE department_id = 30)
ORDER BY DEPARTMENT_ID asc;	 					

-- salary보다 큰 정보

-- 서브쿼리
SELECT MAX(salary) 최소급여 			-- 메인쿼리 : 서브쿼리(11000)보다 작은 정보
FROM EMPLOYEES
WHERE department_id = 30;   -- 1100

SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
  FROM EMPLOYEES
 WHERE salary < any(SELECT MAX(salary) 최소급여   --2500
  					FROM EMPLOYEES
 					WHERE department_id = 30)
ORDER BY SALARY desc;	 


-- 3) ALL - 메인쿼리의 비교조건이 서브쿼리의 결과와 모두 일치하면 참이다.
--  > ALL : 메인쿼리 결과값 > 서브쿼리의 최대값
--  < ALL : 메인쿼리 결과값 < 서브쿼리는 최소값


-- 30번 부서의 최대 salary(11000)보다 큰 정보
SELECT max(SALARY)
  FROM employees 
 WHERE department_id = 30;  -- 11000
 
 SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
   FROM employees
  WHERE SALARY > ALL(SELECT max(SALARY)
  						FROM employees 
 						WHERE department_id = 30)			


 SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
   FROM employees
  WHERE SALARY < ALL(SELECT min(SALARY)   --최소급여2500보다 작은정보 메인 
  						FROM employees 
 						WHERE department_id = 30)
ORDER BY SALARY DESC;


-- 4) EXISTS : 서브쿼리에 결과값이 하나이상 존재하면 조건식이 모두 TRUE, 존재하지 않으면 모두 false
-- EXISTS가 false이면 검색결과가 없다.

 SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
   FROM employees
  WHERE EXISTS (SELECT min(SALARY)   
  						FROM employees 
 						WHERE department_id = 30)   -- 존재안함
    AND department_id = 30    -- 존재안함
ORDER BY SALARY DESC;


 SELECT DEPARTMENT_ID 부서번호
     , EMPLOYEE_ID 사번
     , LAST_NAME || '-' || FIRST_NAME 이름
     , SALARY 급여
   FROM employees
  WHERE EXISTS (SELECT min(SALARY)   
  						FROM employees 
 						WHERE department_id = 300)   -- 존재안함
    AND department_id = 300    -- 존재안함
ORDER BY SALARY DESC;

-- 조인응용 부서명 가져오기
 SELECT e.DEPARTMENT_ID 부서번호
     , e.EMPLOYEE_ID 사번
     , e.LAST_NAME || '-' || e.FIRST_NAME 이름
     , e.SALARY 급여
     , d.DEPARTMENT_NAME 부서명
   FROM employees e
      , departments d
  WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
  AND EXISTS (SELECT min(SALARY)   
				FROM employees 
				WHERE department_id = 30)   -- 존재안함
    AND d.department_id = 30    -- 존재안함
ORDER BY SALARY DESC;


---------------------
------------------ 매우중요
/* 서브쿼리 => 매우 중요
 1. WHERE 절에서 사용하는 서브쿼리 .. 조건비교
 2. FROM 절에서 사용하는 서브쿼리(=인라인뷰) .. 테이블 대용
 3. SELECT 절에서 사용하는 서브쿼리(=스칼라 서브쿼리) .. 컬럼 대용
 */ 
 
 -- 5)스칼라 서브쿼리 : SELECT 절에서 사용하는 서브쿼리
 -- 반드시 한 컬럼만 반환하는 서브쿼리이다. 만약 한컬럼이 여러개의 값을 가지면 오류가 발생한다.
SELECT e.EMPLOYEE_ID
     , e.LAST_NAME
     , e.JOB_ID
     --, avg(salary) --평균급여
     , (SELECT trunc(avg(salary),0) FROM employees) AS 평균급여 --평균급여 6461
     , e.DEPARTMENT_ID
     , (SELECT d.DEPARTMENT_NAME -- 컬럼한개만
          FROM DEPARTMENTS d
          	 , employees e2
          WHERE d.DEPARTMENT_ID = e2.DEPARTMENT_ID
            AND d.DEPARTMENT_ID = 10) AS 관리자부서명  -- 10번부서의 부서명-- 굳이 조인 안해도 되는데 그냥 한거임
  FROM employees e;

SELECT e.EMPLOYEE_ID
     , e.LAST_NAME
     , e.JOB_ID
     , (SELECT trunc(avg(salary),0) FROM employees) AS 평균급여 --평균급여 6461
     , e.DEPARTMENT_ID
     , (SELECT DEPARTMENT_NAME -- 컬럼한개만
          FROM DEPARTMENTS
          WHERE e.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID) AS "부서명"
     , (SELECT d.DEPARTMENT_NAME -- 컬럼한개만
          FROM DEPARTMENTS d
          	 , employees e
          WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
            AND d.DEPARTMENT_ID = 10) AS 관리자부서명
  FROM employees e;



-- 6-1) 인라인뷰 : FROM절에서 사용하는 서브쿼리
-- 특정 테이블 전체가 아닌, SELECT문을 통해 일부 데이터를 추출한 후 별칭을 주어 사용
-- 10번 부서의 사번, 이름, 직무, 급여, 부서코드, 부서명 가져오기

SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
     , e.JOB_ID 직무
     , e.SALARY 급여
     , d.DEPARTMENT_ID 부서코드
     , d.DEPARTMENT_NAME
  FROM DEPARTMENTS d
  	 , employees e
  WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
    AND d.DEPARTMENT_ID = 10
-- 200	Whalen	AD_ASST	4400	10	Administration
    

    
-- from에서 departments는 부서테이블에서 모든걸 가져와라, 
--    employees의 의미는 부서번호가 10번인걸 가져와라 이므로
--    employees를 고칠수있음
    -- 이렇게 사용을 자주함!!!!! 잘 알아둘 것
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
     , e.JOB_ID 직무
     , e.SALARY 급여
     , d.DEPARTMENT_ID 부서코드
     , d.DEPARTMENT_NAME
  FROM DEPARTMENTS d
  	 , (SELECT * FROM employees WHERE department_id = 10) e  --별칭을 e로 줘서 위select문을 맞춤
  WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
  --200	Whalen	AD_ASST	4400	10	Administration

SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
     , e.JOB_ID 직무
     , e.SALARY 급여
     , d.DEPARTMENT_ID 부서코드
     , d.DEPARTMENT_NAME
  FROM (SELECT * FROM employees WHERE department_id = 10) e  
     , (SELECT * FROM DEPARTMENTS) d     -- 이게 곧 departments d 와 같은 의미이므로
  WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
--200	Whalen	AD_ASST	4400	10	Administration


  -- 중요!
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
e AS (SELECT * FROM employees WHERE department_id = 10) 
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
     , e.JOB_ID 직무
     , e.SALARY 급여
     , d.DEPARTMENT_ID 부서코드
     , d.DEPARTMENT_NAME
  FROM e
  	 , DEPARTMENTS d  --별칭을 e로 줘서 위select문을 맞춤
  WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID




























