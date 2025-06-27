-- 2025.6.26

/* 1. 그룹화와 관련된 여러가지 함수
    ROLLUP, CUBE, GROUPING SETS 함수
    => GROUP BY 절에 지정할 수 있는 특수함수이다.
    
    [형식]
    SELECT 컬럼1, 컬럼2, 그룹함수...
      FROM 테이블명
     WHERE절
     GROUP BY ROLLUP(그룹화할 컬럼1, 컬럼2 ..);
     
     SELECT 컬럼1, 컬럼2, 그룹함수...
      FROM 테이블명
     WHERE절
     GROUP BY CUBE(그룹화할 컬럼1, 컬럼2 ..);
     
     SELECT 컬럼1, 컬럼2, 그룹함수...
      FROM 테이블명
     WHERE절
     GROUP BY GROUPING SETS(그룹화할 컬럼1, 컬럼2 ..);
*/

-------------------------------------------------------------------
-- HR 계정에서 실습
-- 1. 기존 GROUP BY절만 사용한 그룹화
-- 부서별 직무별 그룹함수
SELECT e.DEPARTMENT_ID 부서명
     , e.JOB_ID 직무명
     , count(*)
     , round(sum(e.salary)) 총급여
     , round(avg(e.salary)) 평균급여
     , round(max(e.SALARY)) 최대급여
  FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID, e.JOB_ID
ORDER BY e.DEPARTMENT_ID, e.JOB_ID ASC;


-- 2. ROLLUP 함수를 적용한 그룹화
-- ROLLUP 함수는 명시한 열에 대해 소그룹별 결과를 출력하고, 마지막에 최종결과를 출력한다.
-- ROLLUP 함수에 명시한 열에 한하여 결과가 출력되며, ROLLUP 함수에는 그룹함수를 지정할 수 없다.
SELECT e.DEPARTMENT_ID 부서명
     , e.JOB_ID 직무명
     , count(*)
     , round(sum(e.salary)) 총급여
     , round(avg(e.salary)) 평균급여
     , round(max(e.SALARY)) 최대급여
  FROM EMPLOYEES e
GROUP BY ROLLUP (e.DEPARTMENT_ID, e.JOB_ID)
ORDER BY e.DEPARTMENT_ID, e.JOB_ID ASC;
/*
10	AD_ASST		4400	4400	4400
10	null	    4400    4400	 4400	// 결산
20	MK_MAN		13000	13000	13000
20	MK_REP		6000	6000	6000
20	null		19000	9500	13000	// 결산
30	PU_CLERK	13900	2780	3100
...
null null		691416	6462	24000	// 마지막은 총계
*/


----------------------------------------------------------------
-- 3. CUBE 함수를 적용한 그룹화
-- ROLLUP 결과와 동일하게 출력되며, 그 아래에 부서와 상관없이 직책별 결과가 함께 출력된다.
-- CUBE 함수는 지정한 모든 열에서 가능한 조합의 결과를 모두 출력한다.

SELECT e.DEPARTMENT_ID 부서명
     , e.JOB_ID 직무명
     , count(*)
     , round(sum(e.salary)) 총급여
     , round(avg(e.salary)) 평균급여
     , round(max(e.SALARY)) 최대급여
  FROM EMPLOYEES e
GROUP BY CUBE (e.DEPARTMENT_ID, e.JOB_ID)  -- 52건 : ROLLUP(부서별소계, 총계) + 직무정보 
ORDER BY e.DEPARTMENT_ID, e.JOB_ID ASC;

-----------------------------------------------------------
-- 4. GROUPING SETS
-- GROUPING SETS 함수를 사용하여 컬럼별로 그룹으로 묶어 출력하기
-- 지정한 모든 열을 각각 대그룹으로 처리하여 출력
-- CUBE와 같으나 소계가 없음

SELECT e.DEPARTMENT_ID 부서명
     , e.JOB_ID 직무명
     , count(*)
     , round(sum(e.salary)) 총급여
     , round(avg(e.salary)) 평균급여
     , round(max(e.SALARY)) 최대급여
  FROM EMPLOYEES e
GROUP BY GROUPING SETS (e.DEPARTMENT_ID, e.JOB_ID)   
ORDER BY e.DEPARTMENT_ID, e.JOB_ID ASC;


------------------------------------------------------
-- 5. GROUPING 함수 : 그룹화(0) , 비그룹화(1) , NULL(1)
-- 그룹지어있으면 0, 그룹지어있지 않으면 1, null이면 1
-- 각 한 컬럼씩만 GROUPING 할 수 있다.

-- 부서와 직무의 그룹화 결과 여부를 GROUPING 함수로 확인하기
SELECT e.DEPARTMENT_ID 부서명
     , e.JOB_ID 직무명
     , count(*)
     , round(sum(e.salary)) 총급여
     , round(avg(e.salary)) 평균급여
     , round(max(e.SALARY)) 최대급여
     , GROUPING(department_id) 		-- 한 컬럼씩만 그룹화
     , GROUPING(job_id)				-- 한 컬럼씩만 그룹화
  FROM EMPLOYEES e
GROUP BY CUBE (e.DEPARTMENT_ID, e.JOB_ID)   
ORDER BY e.DEPARTMENT_ID, e.JOB_ID ASC;


------------------------------------------------------
-- 6. LISTAGG 함수 :   LISTAGG  ~ WITHIN GROUP  => 그룹에 속해 있는 데이터를 가로로 나열할 때 사용
-- 부서별 사원 이름을 나열히 나열해서 출력하기 

SELECT e.DEPARTMENT_ID 부서명
     , listagg(e.LAST_NAME, ',')
     WITHIN group(ORDER BY salary desc) AS lastname
  FROM EMPLOYEES e
GROUP BY e.DEPARTMENT_ID, e.JOB_ID   
ORDER BY e.DEPARTMENT_ID, e.JOB_ID ASC;


SELECT DEPARTMENT_ID , salary , last_name
  FROM EMPLOYEES
ORDER BY DEPARTMENT_ID, salary desc;
/*
  ...
30	2500	Colmenares
30	2600	Himuro
30	2800	Tobias
30	2900	Baida
30	3100	Khoo
30	11000	Raphaely
  ...
**/

-------------------------------------------------------------
-- 7. PIVOT 함수를 사용하여 직책별, 부서별, 최대급여를 2차원 표 형태로 출력하기
SELECT *
  FROM (SELECT DEPARTMENT_ID , job_id , salary
  		FROM EMPLOYEES)	
  PIVOT(max(salary)
   		 FOR department_id IN (10,20,30)    --가로 표 제목
		)
ORDER BY job_id;

--AD_ASST		4400   (10번부서)
--MK_MAN		13000  (20번부서)
--MK_REP		6000   (20번부서)
--PU_CLERK		3100   (30번부서)
--PU_MAN		11000  (30번부서)

-- 검증
SELECT JOB_ID, DEPARTMENT_ID, max(salary) 
  FROM employees
 WHERE DEPARTMENT_ID < 40
 GROUP BY job_id, department_id
 ORDER BY DEPARTMENT_ID;

/*
AD_ASST		10	4400
MK_MAN		20	13000
MK_REP		20	6000
PU_CLERK	30	3100
PU_MAN		30	11000
*/











