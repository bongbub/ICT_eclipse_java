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


