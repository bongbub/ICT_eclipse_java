-- 2025.6.17	
-- sql문 
-- 06장. 오라클함수


/* ch6. 오라클함수
 * 6-2. 대소문자를 바꿔주는 UPPER, LOWER, INITCAP
 * -- UPPER : 대문자로 변환
 * -- LOWER : 소문자로 변환
 * -- INITCAP : 첫글자만 대문자로, 나머지 글자는 소문자로 변환
 */



-- 6-2-1. 사원테이블의 last_name이 'King'일 경우 employee_id, last_name 조회 
SELECT EMPLOYEE_ID
     , LAST_NAME 
  FROM EMPLOYEES 
  WHERE LAST_NAME= 'King';


-- 6-2-2. 사원테이블의 last_name이 'King'일 경우 employee_id, last_name 조회(INITCAP)
SELECT EMPLOYEE_ID , LAST_NAME 
FROM EMPLOYEES 
WHERE LAST_NAME= INITCAP('king');  -- 2건 


SELECT EMPLOYEE_ID , LAST_NAME 
FROM EMPLOYEES 
WHERE LAST_NAME= UPPER('king');	  --0건 

SELECT EMPLOYEE_ID , LAST_NAME 
FROM EMPLOYEES 
WHERE LAST_NAME= LOWER('KING');	  --0건 


-- 6-3. 사원테이블의 email이 'TFOX'일 경우 email 조회  --UPPER(소문자)
SELECT EMAIL 
FROM EMPLOYEES
WHERE EMAIL = UPPER('tfox');


/* 6-4.
 * 문자열 길이를 구하는 LENGTH 함수 : 한글 한문자당 1byte
 * 문자열 길이를 구하는 LENGTHB 함수 : 한글 한문자당 3byte
 */
-- Dual 테이블 : SYS 소유의 테이블로, 오라클에서 제공하는 dummy 테이블, 한 행으로 결과를 출력함, 임시연산, 함수결과 확인용도
-- 내부 데이터는 DUMMY
-- DUMMY  VARCHAR2(1)라는 하나의 컬럼으로 구성되어 있고, 데이터는 'X'값 


SELECT * FROM dual;

SELECT LENGTH('안녕') FROM dual;
-- 안녕이라는 문자는 길이가 어떻게 되는지 dual 테이블로 테스트
-- 2바이트 출력

SELECT LENGTHB('안녕') FROM dual;
-- 6출력
-- lengthb : 한글 한 문자당 3바이트

SELECT LENGTH('oracle') FROM dual;	-- 6
SELECT LENGTHB('oracle') FROM dual;	-- 6
-- 영문은 length나 lengthb나 한글자당 1바이트로 동일.


SELECT sysdate AS 오늘
 FROM dual;
 -- dual 테이블에게 오늘 날짜를 가져옴

SELECT sysdate + 1 AS 내일
FROM dual;
-- dual 테이블에게 내일 날짜를 물어봄

SELECT sysdate +2 AS 모래,
	   sysdate -1 AS 어제
FROM dual;


/* 6-5.
 * 문자열 일부를 추출하는 SUBSTR 함수.. 인덱스는 1부터 시작
 * - SUBSTR(문자열데이터, 시작위치, 추출갯수) : 시작위치부터 추출갯수만큼 추출한다.
 * - 시작위치가 양수인 경우 1부터 시작, 음수인 경우 뒤쪽부터 시작
 * - 추출 갯수 생략시 데이터 끝까지 추출
 */ 


SELECT JOB_ID 
	 , SUBSTR(JOB_ID , 1, 2) 첫번째	-- job_id의 첫번째 자릿수부터 2개까지 가져오기
	 , SUBSTR(JOB_ID , -2, 2) 두번째	-- job_id의 뒤에서 두번째 자릿수부터 2개 가져오기
	 , SUBSTR(JOB_ID , -5) 세번째		-- job_id의 뒤에서 5번째 자릿수부터 끝까지 추출
	 , SUBSTR(JOB_ID , 5) 네번째		-- job_id의 5번째부터 끝까지 추출
FROM EMPLOYEES
WHERE JOB_ID = 'AC_ACCOUNT';



/* 6-6.
 * INSTR - 문자열내에 특정문자 위치를 찾아주는 함수
 * 형식 - INSTR(대상, 찾을 글자, 시작위치, 몇번째 발견)
 *     - 시작위치, 몇번째 발견 생략시 모두 1로 간주
*/  

--                  대상       찾을문자  시작위치  몇번째발견
SELECT INSTR('HELLO, ORACLE!' ,'L') AS instr_1						-- 3
	 , INSTR('HELLO, ORACLE!' ,'L', 5) AS instr_2					-- 12
	 , INSTR('HELLO, ORACLE! wowLOL' ,'L',    2,     2) AS instr_3	-- 4
FROM dual;





-- ------------------------------------------------------
-- 2025.6.18 <3일차>



/* 6-7.
 * REPLACE - 특정문자를 다른 문자로 바꾸는 REPLACE 함수
 * 형식 - REPLACE(문자열 데이터 또는 열이름(필수), [찾는 문자(필수)], [대체할 문자(선택)] 
 */ 
SELECT '010-1111-2222' AS REPLACE_BEFORE
	 , REPLACE('010-1111-2222', '-', ' ') AS REPLACE_1  -- -를 공백으로 변환
	 , REPLACE('010-1111-2222', '-', '/') AS REPLACE_2  -- -를 /로 변환
	 , REPLACE('010-1111-2222', '-') AS REPLACE_3  		-- 생략하면 제거됨
FROM dual;



/* 6-8.
 * 데이터의 빈공간을 특정 문자로 채우는 LPAD, RPAD 함수
    RPAD(대상, 전체길이, 채울문자) => Right(오른쪽) + PAD(채우기) 오른쪽 채우기
    LPAD(대상, 전체길이, 채울문자) => Left(왼쪽) + PAD(채우기) 왼쪽 채우기
 */ 

SELECT RPAD('971225-', 14, '*') AS RPAD_JUMIN
	 , RPAD('010-1234-', 13, '*') AS RPAD_PHONENUM
FROM dual;
-- 971225-*******	010-1234-****




/* 6-9.
 * CONCAT - 문자의 값을 연결한다.('||'와 동일)
 * 	      - CONCAT(컬럼명1, 컬럼명2)
 * 		  - CONCAT(CONCAT(컬럼명1, '/'), 컬럼명2)
 */
-- 1.사원테이블에서 사번, 입사일, 이름(first_name-last_name) -- 문자열연결 
SELECT FIRST_NAME || '-' || LAST_NAME AS "이름"
  FROM EMPLOYEES
  
-- 2. 입사년도가 02년도이거나 04년도인 사원의 사번, 입사일(----년 --월 --일) 이름(first_name - last_name)  --17건
-- 입사일 순서로 정렬, 별칭사용 -> 사번, 입사일, 이름
  --SUBSTR(문자열데이터, 시작위치, 추출갯수) : 시작위치부터 
SELECT EMPLOYEE_ID AS 사번
	 , TO_CHAR(HIRE_DATE, 'YYYY"년"MM"월"DD"일"') AS 입사일
	 , '20' || SUBSTR(HIRE_DATE , 1, 2) || '년' || SUBSTR(HIRE_DATE, 4, 2) || '월' || SUBSTR(HIRE_DATE,7,2)||'일' AS 입사일
	 , FIRST_NAME || ' '|| LAST_NAME  AS "이름"
  FROM EMPLOYEES
-- WHERE SUBSTR(HIRE_DATE,1,2) IN ('02','04') 		-- 이방법도 가능
 WHERE HIRE_DATE LIKE '02%'
 	OR HIRE_DATE LIKE '04%'
ORDER BY HIRE_DATE ASC;



/* 6-10.
 * TRIM : 불필요한 공백제거
 * LTRIM : 왼쪽 공백 지우기
 * RTRIM : 오른쪽 공백 지우기
 */

SELECT ' O racle mania             '
	 , TRIM(' O racle mania             ') AS TRIM
	 , LTRIM(' O racle mania             ') AS LTRIM
	 , RTRIM(' O racle mania             ') AS RTRIM
  FROM dual;



-------------- 3일차 2025.6.18(진도지연)


/* 
 * 6-11. 숫자함수 => 중요
 * ROUND : 지정한 숫자의 특정 위치에서 반올림한 값을 반환
 * TRUNC : 지정한 숫자의 특정 위치에서 버림한 값을 반환
 * CEIL : 지정한 숫자와 가까운 큰 정수 반환
 * FLOOR : 지정한 숫자와 가까운 작은 정수 반환
 * MOD : 숫자를 나눈 나머지 값을 구하는 MOD 함수
 */


 -- ROUND(숫자, 반올림위치),   반올림위치가 생략시 0이 생략됨
 -- 반올림위치 0 : 소수점 첫째자리
 -- 반올림위치 -1 : 자연수 첫째자리가 5보다 크면 반올림을 하고 0으로 채우고, 5보다 작으면 0으로만 채운다.

-- 6-11. 
SELECT ROUND(1234.5678) AS ROUND			-- 1235  		// 반올림위치 생략 -> 0 
     , ROUND(1234.5678, 0) AS ROUND_0		-- 1235			// 소수점 0번까지 표기 
     , ROUND(1234.5678, 1) AS ROUND_1		-- 1234.6		// 소수점 첫째자리까지 표기 (소수점 둘째자리에서 반올림)
     , ROUND(1234.5678, 2) AS ROUND_2		-- 1234.57		// 소수점 둘째자리까지 표기 (소수점 셋째자리에서 반올림)
     , ROUND(1234.5678, -1) AS ROUND_M1		-- 1230			// .을 기준으로 1번째 자리 버리고 0넣기 (5이하)
     , ROUND(1235.5678, -1) AS ROUND_M2		-- 1240			// .을 기준으로 1번째 자리 반올림하고 0넣기 (5이상)
     , ROUND(1234.5678, -2) AS ROUND_M3		-- 1200			// .을 기준으로 2번째자리 0으로 채우기 (5이하)
     , ROUND(1254.5678, -2) AS ROUND_M4		-- 1300			// .을 기준으로 2번째자리 0으로 채우기 (5이상)
FROM dual;


SELECT TRUNC(1234.5678) AS TRUNC			-- 1234  		// 소수점 버리기
     , TRUNC(1234.5678, 0) AS TRUNC_0		-- 1234			// 소수점 버리기 
     , TRUNC(1234.5678, 1) AS TRUNC_1		-- 1234.6		// 소수점 첫째자리까지 표기 (이하 드랍)
     , TRUNC(1234.5678, 2) AS TRUNC_2		-- 1234.57		// 소수점 둘째자리까지 표기 (이하 드랍)
     , TRUNC(1234.5678, -1) AS TRUNC_M1		-- 1230			// .을 기준으로 1번째 자리 버리고 0넣기 
     , TRUNC(1235.5678, -1) AS TRUNC_M2		-- 1230			// .을 기준으로 1번째 자리 버리고 0넣기 
     , TRUNC(1234.5678, -2) AS TRUNC_M3		-- 1200			// .을 기준으로 2번째 자리 버리고 0넣기
     , TRUNC(1254.5678, -2) AS TRUNC_M4		-- 1300			// .을 기준으로 2번째 자리 버리고 0넣기 
FROM dual;


-- CEIL : 지정한 숫자와 가까운 큰 정수 반환
-- FLOOR : 지정한 숫자와 가까운 작은 정수 반환
SELECT CEIL(3.14)		-- 4   // 3과 4사이에서 큰 정수
     , FLOOR(3.14)		-- 3   // 3과 4사이에서 작은 정수
     , CEIL(-3.14)		-- -3  // -3과 -4사이에서 큰 정수
     , FLOOR(-3.14)		-- -4  // -3과 -4사이에서 작은 정수
  FROM dual;


-- MOD : 숫자를 나눈 나머지 값을 구하는 MOD 함수 MOD(값1, 값2)
SELECT MOD(15,6)	-- 3
	 , MOD(10,2)	-- 0
	 , MOD(11,2)	-- 1
  FROM dual;



/* 6-12
 * 날짜연산, SYSDATE : 현재일
 */
SELECT SYSDATE AS 오늘
	 , SYSDATE -1 AS 어제
	 , SYSDATE +1 AS 내일
  FROM dual;
-- 2025-06-18 13:13:37.000	2025-06-17 13:13:37.000	2025-06-19 13:13:37.000



/*
 * 6-13. 날짜함수
 * - 두 날짜간의 개월수 차이를 구하는 MONTHS_BETWEEN 함수
 * - 형식 : MONTHS_BETWEEN(날짜, 날짜)
 */
SELECT SYSDATE AS 오늘
	 , TRUNC(MONTHS_BETWEEN(SYSDATE, '2025-05-10')) AS "개강 후 몇 개월?"   -- 1   -- 1.27744...(TRUNC없을때)
	 , ROUND(MONTHS_BETWEEN('2025-11-26', '2025-05-20')) AS "종강일 - 개강일"   -- 6
	 , TRUNC(MONTHS_BETWEEN( '2025-11-26', SYSDATE)) AS "종강까지 몇 개월?"   -- 5
	 , ROUND(TO_DATE('2025-11-26')- SYSDATE) AS "남은 수업일수"   ㅂ			-- -160일
	 , ROUND(TO_DATE('2025-11-20') - TO_DATE('2025-05-20'))AS "전체수업일수"	--184
  FROM DUAL;



/*
 * 6-14. 날짜함수
 * - 몇 개월 이후 날짜를 더하는 ADD_MONTHS 함수
 * - 형식 : ADD_MONTHS(날짜, 더할 개월수)
 */ 
SELECT SYSDATE 오늘                              -- 2025-06-18  
	 , ADD_MONTHS(SYSDATE, 5)AS "5개월 후"		-- 2025-11-18 
  FROM DUAL;




/* 6-15. 날짜의 ROUND 반올림 함수, TRUNC 버림 함수
 * 형식 : TRUNC(date, format)
 * TRUNC => format이 'MONTH'인 경우, 달을 기준으로 자른다. 이번달 1일
 * ROUND => format이 'MONTH'인 경우, 일을 기준으로 16보다 작으면 이번달 1일, 16 이상이면 다음달 1일
 */ 
-- 사원테이블에서 사번, 입사일, T_입사일, R_입사일, 근무개월수, R_근무개월수, T_근무개월수를 구한다. 입사일 오름차순  
SELECT EMPLOYEE_ID 사번
	 , TRUNC(HIRE_DATE, 'MONTH')							T_입사일
	 , ROUND(HIRE_DATE, 'MONTH')							R_입사일
	 , MONTHS_BETWEEN(SYSDATE, HIRE_DATE)					근무개월수
	 , ROUND(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 0)			R_근무개월수
	 , TRUNC(MONTHS_BETWEEN(SYSDATE, HIRE_DATE), 0)			T_근무개월수
  FROM EMPLOYEES
ORDER BY  HIRE_DATE;



/* 6-16.
 * - NEXT_DAY : 돌아오는 요일의 날짜 반환 => NEXT_DAY([날짜 데이터], [요일문자])
 *              요일 대신 숫자가 올수 있다.  1:일요일, 2:월요일
 * - LAST_DAY : 달의 마지막 날짜 반환 => LAST_DAY([날짜 데이터])
 */
 SELECT sysdate 오늘					-- 2025-06-18	
 	  , next_day(sysdate, 1)      		-- 2025-06-18 
 	  , next_day(sysdate, '일요일')     	--	2025-06-22 
 	  , next_day(sysdate, '월요일')		-- 2025-06-22  
 	  , next_day(sysdate, '화요일')		-- 2025-06-23  
 	  , next_day(sysdate, '수요일')		-- 2025-06-25  
 	  , next_day(sysdate, '목요일')		-- 아직 새로운 주가 돌아오지 않았으므로 2025-06-19  
 	  , next_day(sysdate, '금요일')		-- 마찬가지 2025-06-20  
 	  , next_day(sysdate, '토요일')		-- 2025-06-21 
FROM dual;



-- 사원테이블에서 사번, 입사일, 입사한 달의 마지막날 조회
SELECT EMPLOYEE_ID AS 사번
	 , TO_CHAR(HIRE_DATE, 'YYYY"년"MM"월"DD"일"') AS 입사일
	 , TO_CHAR(LAST_DAY(HIRE_DATE), 'yyyy"년"mm"월"dd"일"') AS "입사달의 마지막 날"
  FROM EMPLOYEES
ORDER BY HIRE_DATE ;


/*
 * TO_CHAR : 숫자 또는 날짜 -> 문자 데이터로 변환
 * TO_NUMBER : 문자 -> 숫자 데이터로 변환
 * TO_DATE : 문자 -> 날짜 데이터로 변환
 */

/*
1. TO_CHAR
- 날짜형 혹은 숫자형을 문자형으로 변환한다. 
- 형식 : TO_CHAR(날짜데이터, '출력형식')
- 날짜 출력 형식
  종류    의미
  YYYY   년도표현(4자리)
  YY     년도표현(2자리)
  MM     월을 숫자로 표현       
  MON    월을 알파벳으로 표현
  DD     일을 숫자로 표현
  DAY    요일 표현
  DY     요일을 약어로 표현
  W      몇 번째 주
  CC     세기
*/ 
-- 1. TO_CHAR
-- 날짜형 혹은 숫자형을 문자형으로 변환한다. 
-- 형식 : TO_CHAR(날짜데이터, '출력형식')

SELECT SYSDATE 오늘   -- 2025-06-18
	 , TO_CHAR(SYSDATE, 'YY/MM/DD DAY') AS to1 -- 25/06/18 수요일
	 , TO_CHAR(SYSDATE, 'YY/MM/DD (DAY)') AS to2 -- 25/06/18 (수요일)
	 , TO_CHAR(SYSDATE, 'YY/MM/DD DY') AS to3 -- 25/06/18 수
	 , TO_CHAR(SYSDATE, 'YY/MM/DD (DY)')  AS to4 -- 25/06/18 (수)
  FROM dual;


-- 시간 표현
-- 오전 -> AM  |  오후 -> PM
-- 12시간 -> HH:MI:SS    |    24시간 -> HH24:MI:SS

SELECT SYSDATE 오늘														-- 2025-06-18 15:30:53.000
	 , TO_CHAR(SYSDATE, 'YY/MM/DD (DY) HH:MI:SS') AS 날짜HH				-- 25/06/18 (수) 03:30:53
	 , TO_CHAR(SYSDATE, 'YY/MM/DD (DY) HH24:MI:SS PM') AS 날짜HH24PM		-- 25/06/18 (수) 15:30:53 오후
  FROM dual;



/*  
-- 1-2. TO_CHAR(숫자형) -> 문자형으로 변환한다.  
-- 형식 : TO_CHAR(숫자, '출력형식')  
- L : 각 지역별 통화기호를 앞에 표시 예)한국: ￦   -- 도구-환경설정 -> 검색(돋보기) -> NLS 창에 통화 : ￦으로 설정되어 있음
-  특수문자 : ㄹ+한자키 
- , : 천단위 자리 구분을 표시
- . : 소수점을 표시
- 9 : 자리수를 나타내며, 자리수가 맞지 않아도 0으로 채우지 않는다.
- 0 : 자리수를 나타내며, 자리수가 맞지 않을 경우 나머지 공간을 0으로 채운다.
*/ 

SELECT EMPLOYEE_ID AS 사번
	 , SALARY 
	 , TO_CHAR(SALARY , 'L9,999,999') AS "L9"	-- ￦24,000		// 통화기호 표시 (L)
	 , TO_CHAR(SALARY , 'L0,009,999') AS "L0"   -- ￦0,024,000	// 빈 앞의 자리를 0으로 채움
	 , TO_CHAR(SALARY , '$9,999,999') AS "$9"   -- $24,000		
	 , TO_CHAR(SALARY , '$0,009,999') AS "$0"   -- $0,024,000
  FROM EMPLOYEES;
-- 100	24000	           ￦24,000	        ￦0,024,000	    $24,000	 $0,024,000



 /*
 * 2. TO_DATE : 문자 -> 날짜 데이터로 변환
 * - 형식 : TO_DATE('문자', '날짜 format')
 
 */
  
-- 입사일이 03/06/17인 사원의 사번, 입사일 조회
SELECT EMPLOYEE_ID 사번		-- 100
	 , HIRE_DATE 입사일		-- 2003-06-17 00:00:00.000
FROM EMPLOYEES
WHERE HIRE_DATE = '03/06/17'; 	-- hire_date => DATE타입 --> 03/06/17 => DATE 타입

SELECT EMPLOYEE_ID 사번		-- 100
	 , HIRE_DATE 입사일		-- 2003-06-17 00:00:00.000
	 , TO_CHAR(HIRE_DATE, 'yyyy-mm-dd (dy)') "TO_CHAR 입사일"		-- 2003-06-17 (화)
FROM EMPLOYEES
WHERE HIRE_DATE = TO_DATE('20030617', 'yyyy-mm-dd'); 	-- 받은 문자(20030617)을 DATE타입으로 변환


/*
 * TO_NUMBER
 *  - 문자형을 숫자형으로 바꾼다.
 */
  
SELECT TO_NUMBER('100,000', '999,999') - TO_NUMBER('50,000','999,999')  AS 테스트   -- 50000
  FROM dual;
  

/* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~쭝요!!!!!!!!!!!!!!!!!!!!!!!
 * 1. NVL 함수 => 매우 중요
 * - NULL : 미확정, 값이 정해져있지 않아 알수없는 값을 의미하며, 연산, 대입, 비교가 불가능하다.
 *          연산시 관계 컬럼값도 null로 바뀐다.
 * - NVL : 값이 NULL일 경우 연산, 대입, 비교가 불가능하므로 NVL을 이용해 대체
 *         NULL을 0 또는 다른 값으로 변환한다.
 *      문법 : NVL(컬럼값, 초기값)
 *            단 두개의 값은 반드시 데이터 타입이 일치해야 한다.
 */

-- 1.사원테이블의 last_name, salary, salary*12+commission_pct 연봉, commission_pct, salary >= 10000   
-- 조건식 : salary >= 10000 그리고 commission_pct가 null이면 0으로 치환
SELECT LAST_NAME AS 이름
     , SALARY AS 급여
     , round(SALARY * 12 + NVL(commission_pct, 0))||' 원' AS 연봉
     , NVL(commission_pct, 0) AS 수당
     , COMMISSION_PCT AS 수당원본
  FROM EMPLOYEES
 WHERE SALARY >= 10000
 ORDER BY LAST_NAME ASC;
  
  -- 2.LOCATIONS 테이블에서 location_id, city, state_province 조회
-- (단 state_province가 null이 아닌 경우 조회)
SELECT LOCATION_ID 
	 , CITY 
  FROM LOCATIONS
 WHERE STATE_PROVINCE IS NOT NULL
 ORDER BY LOCATION_ID ASC;

  
-- 3.LOCATIONS 테이블에서 location_id, city, state_province 조회
-- (단 state_province가 null일 경우 '미정 주'로 출력
SELECT LOCATION_ID
     , CITY 
     , NVL(STATE_PROVINCE, '미정 주') 
  FROM LOCATIONS
 WHERE STATE_PROVINCE IS null
 ORDER BY LOCATION_ID ASC;


 /*
  * NVL2 함수
  * 형식 : NVL2(expr1, expr2, expr3)
  * - expr1이 null이면 expr3을 반환하고, null이 아니면 expr2을 반환
  */

-- 사원테이블의 last_name, salary, salary*12+commission_pct 연봉, commission_pct, salary >= 10000 
--	commissio_pct가 NULL이면 0으로 반환하고 NULL이 아니면 commission_pct 반환
SELECT LAST_NAME 이름
     , SALARY 급여
     , SALARY * 12 + COMMISSION_PCT AS 연봉
     , SALARY * 12 + nvl2(COMMISSION_PCT, commission_pct, 0) as nvl2연봉
     , COMMISSION_PCT 수당
  FROM EMPLOYEES
 WHERE SALARY >= 10000;
 

/*
 * 3. NULLIF 함수
 * - 형식 : NULLIF(expr1, expr2)
 * - 두 표현식을 비교하여 동일하면 null을 반환하고, 동일하지 않으면 첫번째 표현식을 반환
 */
 SELECT NULLIF('A', 'A')AS "A vs A"  -- null
     , NULLIF('A', 'B')AS "A vs B"  -- A
  FROM dual; 


/*
 * 4. COALESCE
 * - 형식 : COALESCE(expr-1,expr-2,..expr-n)
 * - 인수중에서 NULL이 아닌 첫번째 인수를 반환하는 함수
 */

 -- 사원테이블의 last_name, salary, salary*12+commission_pct 연봉, commission_pct, salary >= 10000 
SELECT EMPLOYEE_ID AS 아이디, LAST_NAME 이름
     , SALARY 급여
     , SALARY * 12 + COMMISSION_PCT AS 연봉
     , SALARY * 12 + nvl2(COMMISSION_PCT, commission_pct, 0) as nvl2연봉
     , SALARY * 12 + COALESCE(COMMISSION_PCT, 0) as COALESCE연봉
     , COMMISSION_PCT 수당
  FROM EMPLOYEES
 WHERE SALARY >= 10000;


/* ~~~~~~~~~~~~~~~~~~~ 종요!!!
 * DECODE 함수 : 자바의 Switch Case문과 동일
 * - 조건에 따라 다양한 선택이 가능
 * - 형식 : DECODE(표현식,
 *                 조건1, 결과1,
 *                 조건2, 결과2,
 *                 조건3, 결과3,..
 *                 기본결과n); 
 */ -- 표현식이 조건1이면 결과1수행, 표현식이 조건2면 결과2 수행....
 
 
-- 사번, 이름, job_id, salary, 수당 출력(단 decode를 이용해 수당 출력)
--    표현식    조건        결과
-- job_id : AD_PRES  salary*1.1,
--          AD_VP    salary*1.2,
--          IT_PROG   salary*1.3,
--          FI_MGR    salary*1.4,
--          그 외      salary*1.5  AS 수당
 SELECT EMPLOYEE_ID 사번
 	  , LAST_NAME 이름
 	  , JOB_ID 직급
 	  , SALARY 급여
 	  , DECODE(JOB_ID,
 	  		   'AD_PRES', SALARY *1.1
 	  		   ,'AD_VP', SALARY * 1.2
 	  		   ,'IT_PROG', SALARY*1.3
 	  		   ,'FI_MGR', SALARY *1.4
 	  		   ,SALARY * 1.5) AS 수당 
   FROM EMPLOYEES;
  
  
/*
 * CASE-END문 : 자바의 if else문과 동일
 * - 형식 : CASE 
 *           WHEN 표현식 조건1 THEN 결과1
 *           WHEN 표현식 조건2 THEN 결과2
 *           WHEN 표현식 조건3 THEN 결과3..
 *           ELSE 결과n                  
 *         END
 */

-- CASE문 적용
 SELECT EMPLOYEE_ID 사번
 	  , LAST_NAME 이름
 	  , JOB_ID 직급
 	  , SALARY 급여
 	  , CASE JOB_ID
 	  		   WHEN 'AD_PRES' THEN SALARY *1.1
 	  		   WHEN 'AD_VP' THEN SALARY * 1.2
 	  		   WHEN 'IT_PROG' THEN SALARY*1.3
 	  		   WHEN 'FI_MGR' THEN SALARY *1.4
 	  		   ELSE SALARY * 1.5 
 	  	END	   AS 수당 							-- END 꼭 닫아줘야함!!!!!! 
   FROM EMPLOYEES
   ORDER BY JOB_ID ASC;



-- case문을 이용해 comm_texty(별칭) 출력  
-- 사번, 이름, job_id, salary, commission_pct, case문을 이용해 comm_text 출력 
-- comm_text : commission_pct가 null이면 '해당사항 없음'
--                           0이면 '수당 없음'
--                           0보다 크면 연봉 출력 => '연봉 : ' 
-- 예
-- 100   King   AD_PRES   24000      해당사항 없음
-- 145   Russell   SA_MAN   14000   0.4   연봉 : 168000.4


SELECT EMPLOYEE_ID AS 사번
     , LAST_NAME AS 이름
     , JOB_ID  AS 직급
     , SALARY AS 급여
     , CASE 
     		WHEN COMMISSION_PCT IS NULL THEN '해당사항없음'
     		WHEN COMMISSION_PCT=0 THEN '수당없음'
     		ELSE '연봉 : ' || (SALARY * 12 + COMMISSION_PCT)
     	END AS comm_text
  FROM EMPLOYEES;



/* DECODE함수, CASE문
    사원테이블의 부서ID가 10~60인 경우 부서ID와 '부서명' 출력
    그 외는 '부서미정'으로 출력
    부서ID로 정렬한다.
    단 부서ID는 중복되지 않아야 하며, 부서ID가 null이면 출력안되게
    
    부서ID    부서명
    10       Administration
    20       Marketing
    30       Purchasing
    40       Human Resources
    50       Shipping
    60       IT
    그외      부서미정 
*/    

SELECT CASE
	WHEN DEPARTMENT_ID IS NOT NULL THEN department_id  
	END AS 부서ID
	 ,DECODE(DEPARTMENT_ID 
			, 10, DEPARTMENT_NAME
			, 20, DEPARTMENT_NAME
			, 30, DEPARTMENT_NAME
			, 40, DEPARTMENT_NAME
			, 50, DEPARTMENT_NAME
			, 60, DEPARTMENT_NAME
			, '부서미정') AS 부서명
  FROM DEPARTMENTS
  --WHERE DEPARTMENT_ID IS NOT NULL 
  ORDER BY DEPARTMENT_ID ASC;


	







