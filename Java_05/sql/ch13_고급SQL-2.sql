-- 2025.6.26

/* 1. 분석함수(중요)
- 테이블에 있는 데이터를 특정용도로 분석하여 결과를 반환하는 함수
- PARTITION BY : 계산 대상을 그룹으로 정한다.
- OVER : 분석함수임을 나타내는 키워드
- 분석함수는 그룹별 계산결과를 각 행마다 보여준다.
   분석함수는 그룹함수와 그룹단위로 값을 계산한다는 점에서 유사하지만,
            그룹마다가 아니라 결과 SET의 각 행마다 집계결과를 보여준다.
*/

-----------------------------

-- HR 계정에서 실행
-- 각각의 동일 부서의 급여합계

SELECT DEPARTMENT_ID
	 , EMPLOYEE_ID
	 , SALARY
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;


SELECT DEPARTMENT_ID
	 , EMPLOYEE_ID
	 , SALARY
	 , sum(salary) over(PARTITION BY department_ID) AS sum_sal
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID;


------------------------------------------------------
/* 2. 순위함수  (중요)
- RANK() 함수 - 순위를 부여하는 함수로 동일 순위 처리가 가능하다. 동일 등수가 순위에 영향을 미친다.
  (중복 순위 다음 순서는 건너뜀 - 1,2,2,2,5)
  
- DENSE_RANK() 함수 -  RANK() 함수와 동일하나, 동일 등수가 순위에 영향을 미치지 않는다.
 (중복 순위 다음 순서는 건너뛰지 않음 - 1,2,2,2,3)
 
- ROW_NUMBER() 함수 - 특정순위로 일련번호를 제공하는 함수로, 동일 순위 처리가 불가능하다.
 (중복 순위없이 유일값 - 1,2,3,4)
 
- 순위함수 사용시 반드시 ORDER BY절 기술
- NTILE(분류) 함수는 쿼리의 결과를 N개의 그룹으로 분류하는 기능을 제공한다.
- NTILE(분류숫자) 함수는 지정한 분류숫자 만큼의 그룹으로 분류하는 기능을 제공한다.
*/



-- 2-1. 순위함수 RANK()
-- 급여가 높은 순서로 순위 구하기
-- HR에서 작업
SELECT DEPARTMENT_ID
     , employee_id
     , SALARY
     , rank() over(ORDER BY salary desc)AS 순위
  FROM EMPLOYEES;

-----------------------
--2-2. 순위함수 비교
SELECT DEPARTMENT_ID
     , employee_id
     , SALARY
     , rank() over(ORDER BY salary desc)AS rank
     , dense_rank() over(ORDER BY salary desc) AS D_rank
     , ROW_NUMBER() over(ORDER BY salary desc) AS R_Rank
  FROM EMPLOYEES;


----------------------------------------------
-- 2-3. 순위함수 NTILE (분류)
SELECT department_id
     , employee_id
     , salary
     , ntile(2) over(ORDER BY employee_id) AS 그룹2	-- 전체를 2등분하여 1,2로 표현
     , ntile(3) over(ORDER BY employee_id) AS 그룹2	-- 전체를 3등분하여 1,2,3로 표현
     , ntile(4) over(ORDER BY employee_id) AS 그룹2	-- 전체를 4등분하여 1,2,3,4로 표현
  FROM employees



/* 3. 윈도우 함수
- 분석함수 중에서 윈도우절(WINDOWING)을 사용하는 함수를 윈도우함수라고 한다.
- 윈도우절을 사용하게 되면 PARTITION BY절에 명시된 그룹을 좀더 세부적으로 그룹핑할 수 있다.
- 윈도우절은 분석함수 중에서 일부(AVG, SUM, MAX, MIN, COUNT)만 사용할 수 있다.
- ROWS : 물리적인 ROW 단위로 행집합을 지정한다.
- RANGE : 논리적인 상대번지로 행집합을 지정한다. 
*/
  
  
  
-- 3-1. ROWS 사용예제
-- 부서별로 이전 ROW의 급여와 현재 ROW의 급여합계를 출력
-- ROWS 2 PRECEDING ->(현재 + 이전 + 그 이전) 급여합계  
SELECT employee_id
     , last_name
     , department_id
     , SALARY
     , sum(salary) over(PARTITION BY department_id	--salary 총합을 부서별로 쪼갯다
     					ORDER BY employee_id
     					ROWS 2 preceding) AS pre_sum
  FROM employees;

-----------------------------------------------------------------------------

-- 3-2. RANGE 사용예제 => 중요!!!!!!!!!!!!!!!!!!!!
-- 영업정보 시스템에서 분석화면에 전월비교, 전년비교, 분기별 합계, 분기별 평균
-- PRECEDING : 이전  /  FOLLOWING : 이후
-- SCOTT_03에서 실행 - 전체 블록잡아서 실행

WITH test AS ( 		-- test테이블
	SELECT '202401' AS yyyymm, 100 AS amt FROM dual
	UNION ALL SELECT '202402' AS yyyymm, 200 AS amt FROM dual
	UNION ALL SELECT '202403' AS yyyymm, 300 AS amt FROM dual
	UNION ALL SELECT '202404' AS yyyymm, 400 AS amt FROM dual
	UNION ALL SELECT '202405' AS yyyymm, 500 AS amt FROM dual
	UNION ALL SELECT '202406' AS yyyymm, 600 AS amt FROM dual
--	UNION ALL SELECT '202407' AS yyyymm, 700 AS amt FROM dual	-- 빠진 달은 0원으로 계산
	UNION ALL SELECT '202408' AS yyyymm, 800 AS amt FROM dual
	UNION ALL SELECT '202409' AS yyyymm, 900 AS amt FROM dual
	UNION ALL SELECT '202410' AS yyyymm, 1000 AS amt FROM dual
	UNION ALL SELECT '202411' AS yyyymm, 1100 AS amt FROM dual
	UNION ALL SELECT '202412' AS yyyymm, 1200 AS amt FROM dual
)
SELECT yyyymm
     , amt
     , sum(amt) OVER(ORDER BY to_date(yyyymm, 'yyyymm')
     			RANGE BETWEEN INTERVAL '3' MONTH PRECEDING   -- 이전 3개월(현재달은 미포함)
     					  AND INTERVAL '1' MONTH PRECEDING) AS amp_pre3	-- 3달 전부터 한달 전
     , sum(amt) OVER(ORDER BY to_date(yyyymm, 'yyyymm')
     			RANGE BETWEEN INTERVAL '1' MONTH FOLLOWING   -- 이후 3개월(현재달은 미포함)
     					  AND INTERVAL '3' MONTH FOLLOWING) AS amp_post3 --한달 후 부터 3달후
  FROM test;   -- 테이블 별칭

-------------------------------------------------------------------------------------------
