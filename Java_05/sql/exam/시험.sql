/*

[문항1] 아래는 employee 테이블의 출력 결과입니다.

급여가 2000 이상 3000 이하인 사원의 이름과,
 사원번호, 입사일, 급여를 출력하되 이름을 오름차순 정렬하세요.
 */

SELECT last_name 이름
	 , EMPLOYEE_ID 사원번호
     , hire_date 입사일
     , salary 급여
  FROM employees
 WHERE salary BETWEEN 2000 and 3000
 ORDER BY last_name ASC;


	
--[문항2] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--커미션이 NULL 인 사원이름과, 입사일, 부서번호를 출력하되 부서번호를 오를차순 
--정렬하고 부서번호가 같은 항목이 있을 경우 이름을 오름차순으로 정렬하세요.

SELECT last_name 이름
	 , hire_date 입사일
	 , DEPARTMENT_ID 부서번호
  FROM employees
 WHERE COMMISSION_PCT IS null
ORDER BY department_id, last_name;


--[문항3] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--커미션이 0.1 이거나 0.2 이거나 0.3인 사원의 사원번호와 
--이름, 월급, 커미션을 출력 하되 커미션을 내림차순 정렬하세요.
--IN 연산자를 사용해서 출력 하세요.

SELECT EMPLOYEE_ID 사원번호
	 , last_name 이름
	 , salary 월급
	 , COMMISSION_PCT 커미션
  FROM EMPLOYEES 
 WHERE COMMISSION_PCT IN (0.1,0.2,0.3)
ORDER BY COMMISSION_PCT DESC;
  

	
--[문항4] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--이름의 첫 글자가 ’S’로 시작하는 사원의 이름을 출력하세요.

SELECT last_name 이름
  FROM EMPLOYEES
 WHERE last_name LIKE 'S%';



--[문항5] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--LIKE 연산자와 와일드 카드를 사용해서 
--'81'년도에 입사하지 않은 사원의 이름과 입사일을 출력하세요.

SELECT last_name 이름
	 , HIRE_DATE 입사일
  FROM employees
 WHERE HIRE_DATE not LIKE '81%';


--[문항6] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--부서 번호를 중복 제거후 오름차순으로 정렬해서 출력하세요.

SELECT DISTINCT DEPARTMENT_ID 부서번호
  FROM employees
  ORDER BY DEPARTMENT_ID ASC;




--[문항7] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--이름에 ‘a’ 와 ‘e’ 를 모두 포함하는 사원의 이름을 출력하세요.

SELECT EMPLOYEE_ID 사번
     , last_name 이름
  FROM EMPLOYEES
 WHERE LAST_NAME LIKE '%a%'
   AND last_name LIKE '%e%';




--[문항8] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--substr 함수를 사용해서 12월 달에 입사한 사원의 사원번호, 이름, 입사일을 출력하세요.

SELECT EMPLOYEE_ID 사원번호
	 , last_name 이름
	 , hire_date 입사일
  FROM employees
 WHERE SUBSTR(hire_date,4,2) = '12';
 
 

	
--[문항9] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--NVL 함수를 사용해서 사원의 연봉을 계산하고,
--사원이름, 월급, 커미션 , 연봉을 출력하되 연봉이 많은 순서대로 출력하세요.

SELECT last_name 이름
	 , salary 월급
	 , COMMISSION_PCT 수당
	 , nvl(commission_pct,0) + (salary *12) AS 연봉
  FROM employees
 ORDER BY nvl(commission_pct,0) + (salary *12) desc;
  
  

	
--[문항10] employee 테이블에서 아래 문항의 쿼리문를 작성하세요.
--
--각 부서별 평균 월급을 구해서 부서번호와 평균 월급을 
--출력 하되 각각 별칭이름을 “부서번호”, “평균월급” 으로 출력하세요.

SELECT DEPARTMENT_ID 부서번호
	 , round(avg(salary)) 평균월급
  FROM employees
 GROUP BY DEPARTMENT_ID
 ORDER BY DEPARTMENT_ID ASC;
 




















