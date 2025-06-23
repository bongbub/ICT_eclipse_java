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








