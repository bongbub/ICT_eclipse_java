-- 2025.6.17

-- 6-2-1. 사원테이블의 last_name이 'King'일 경우 employee_id, last_name 조회 
SELECT EMPLOYEE_ID 
		, LAST_NAME 
FROM EMPLOYEES
WHERE LAST_NAME = 'King';

-- 6-2-2. 사원테이블의 last_name이 'King'일 경우 employee_id, last_name 조회(INITCAP, UPPER, LOWER)
SELECT EMPLOYEE_ID 
	, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME = INITCAP('king');

SELECT EMPLOYEE_ID 
	, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME = UPPER('king');  -- king -> 0건

SELECT EMPLOYEE_ID 
	, LAST_NAME
FROM EMPLOYEES
WHERE LAST_NAME = LOWER('KING');   -- KING -> 0건



-- 6-3. 사원테이블의 email이 'TFOX'일 경우 email 조회  --UPPER(소문자)


-- 안녕이라는 문자는 길이가 어떻게 되는지 dual 테이블로 테스트
-- 2바이트 출력


-- 6출력
-- lengthb : 한글 한 문자당 3바이트


-- 영문은 length나 lengthb나 한글자당 1바이트로 동일.


 -- dual 테이블에게 오늘 내일, 모레, 어제 날짜를 가져옴


/* 6-5. SUBSTR(문자열데이터, 시작위치, 추출갯수) */


/* 6-6.
 * INSTR - 문자열내에 특정문자 위치를 찾아주는 함수
 * 형식 - INSTR(대상, 찾을 글자, 시작위치, 몇번째 발견)
*/


-- ------------------------------------------------------
-- 2025.6.18 <3일차>

/* 6-7.
 * REPLACE - 특정문자를 다른 문자로 바꾸는 REPLACE 함수
 * 형식 - REPLACE(문자열 데이터 또는 열이름(필수), [찾는 문자(필수)], [대체할 문자(선택)] 
 */




/* 6-8.
 * 데이터의 빈공간을 특정 문자로 채우는 LPAD, RPAD 함수
    RPAD(대상, 전체길이, 채울문자) => Right(오른쪽) + PAD(채우기) 오른쪽 채우기
    LPAD(대상, 전체길이, 채울문자) => Left(왼쪽) + PAD(채우기) 왼쪽 채우기
 */ 






/* 6-9.
 * CONCAT - 문자의 값을 연결한다.('||'와 동일)
 * 	      - CONCAT(컬럼명1, 컬럼명2)
 * 		  - CONCAT(CONCAT(컬럼명1, '/'), 컬럼명2)
 */
-- 1.사원테이블에서 사번, 입사일, 이름(first_name-last_name) -- 문자열연결 


-- 2. 입사년도가 02년도이거나 04년도인 사원의 사번, 입사일(----년 --월 --일) 이름(first_name - last_name)  --17건
-- 입사일 순서로 정렬, 별칭사용 -> 사번, 입사일, 이름
  --SUBSTR(문자열데이터, 시작위치, 추출갯수) : 시작위치부터



/* 6-10.
 * TRIM : 불필요한 공백제거
 * LTRIM : 왼쪽 공백 지우기
 * RTRIM : 오른쪽 공백 지우기
 * --' O racle mania             ' 각 제거해보기
 */


-- 6-11 
-- ROUND(숫자, 반올림위치)
-- TRUNC : 지정한 숫자의 특정 위치에서 버림한 값을 반환
-- 1234.5678
-- 1235.5678 -2~2까지 해보기



/* CEIL : 지정한 숫자와 가까운 큰 정수 반환
 * FLOOR : 지정한 숫자와 가까운 작은 정수 반환
 * 3.14, -3.14
 */

-- MOD : 숫자를 나눈 나머지 값을 구하는 MOD 함수 MOD(값1, 값2)



/* 6-12
 * 날짜연산, SYSDATE : 현재일
 * sysdate+1, -1
 */



/*
 * 6-13. 날짜함수
 * - 두 날짜간의 개월수 차이를 구하는 MONTHS_BETWEEN 함수
 * - 형식 : MONTHS_BETWEEN(날짜, 날짜)
 */













