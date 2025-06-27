-- 2025.6.26
-- 복습

-- 분석함수
SELECT DEPARTMENT_ID 부서번호
	 , EMPLOYEE_ID 사원번호
	 , salary 급여
  FROM employees
ORDER BY DEPARTMENT_ID;  -- 부서번호와 사원번호를 출력(부서번호정렬)


SELECT DEPARTMENT_ID 부서번호
	 , EMPLOYEE_ID 사원번호
	 , salary 급여
	 , sum(salary) OVER(PARTITION BY DEPARTMENT_ID) AS 파티션sal
  FROM employees
ORDER BY DEPARTMENT_ID;  


-- 순위함수
-- 급여가 높은 순서대로 순위 구하기
SELECT DEPARTMENT_ID
     , EMPLOYEE_ID
     , SALARY
     , rank() over(ORDER BY salary DESC) AS 순위
  FROM EMPLOYEES;


-- 순위함수 비교
SELECT DEPARTMENT_ID
     , EMPLOYEE_ID
     , SALARY
     , rank() over(ORDER BY salary DESC) AS 순위
     , dense_rank() over(ORDER BY salary desc) AS DENSE_RANK
     , row_number() over(ORDER BY salary desc) AS Row_number
  FROM EMPLOYEES;

-- 순위함수 NTILE (분류)
SELECT DEPARTMENT_ID
     , EMPLOYEE_ID
     , SALARY
     , Ntile(2) over(ORDER BY employee_id) AS 그룹2
     , Ntile(3) over(ORDER BY employee_id) AS 그룹3
     , Ntile(4) over(ORDER BY employee_id) AS 그룹4
  FROM EMPLOYEES;

-- rows
-- 부서별로 이전 ROW의 급여와 현재 ROW의 급여 합계를 출력
-- ROWS 2 PRECEDING 
SELECT EMPLOYEE_ID
	 , last_name
	 , DEPARTMENT_ID
	 , salary
	 , sum(salary) over(PARTITION BY department_id
	 					ORDER BY employee_id
	 					ROWS 2 PRECEDING) AS pre_sum
  FROM EMPLOYEES;


-- range

WITH test AS (
	SELECT '202401' AS yyyymm, 100, AS amt FROM dual
	UNION ALL SELECT '202402' AS yyyymm, 200 AS amt FROM dual
	UNION ALL SELECT '202403' AS yyyymm, 300 AS amt FROM dual
	UNION ALL SELECT '202404' AS yyyymm, 400 AS amt FROM dual
	UNION ALL SELECT '202405' AS yyyymm, 500 AS amt FROM dual
	UNION ALL SELECT '202406' AS yyyymm, 600 AS amt FROM dual
	UNION ALL SELECT '202407' AS yyyymm, 700 AS amt FROM dual
	UNION ALL SELECT '202408' AS yyyymm, 800 AS amt FROM dual
	UNION ALL SELECT '202409' AS yyyymm, 900 AS amt FROM dual
	UNION ALL SELECT '202410' AS yyyymm, 1000 AS amt FROM dual
	UNION ALL SELECT '202411' AS yyyymm, 1100 AS amt FROM dual
	UNION ALL SELECT '202412' AS yyyymm, 1200 AS amt FROM dual
	)
SELECT yyyymm
	 , amt
	 , sum(amt) OVER(order BY to_date(yyyymm, 'yyyymm')
	 				RANGE BETWEEN INTERVAL '3' MONTH PRECEDING
	 						AND  INTERVAL '1' MONTH PRECEDING) AS amp_pre
	 , sum(amt) OVER(Order BY to_date(yyyymm, 'yyyymm')
	 				RANGE BETWEEN INTERVAL '3' MONTH FOLLOWING 
	 						AND  INTERVAL '1' MONTH FOLLOWING) AS amp_pre
  FROM test;

