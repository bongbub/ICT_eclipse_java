-- 2025.6.19
-- Join

/*
 * 8-1. 조인 => 면접
 * 부서정보
 * 
 * 정보를 제공하는 테이블 => 부모테이블 : 부서T => Primary Key(식별키, PK) => NOT NULL, Unique
 * 정보를 제공받는 테이블 => 자식테이블 : 사원T => Foreign Key(외래키, FK)
 * 
 * - 형식
 * SELECT t1.column, t2.column
 *   FROM table t1, table t2
 *  WHERE t1.column = t2.column
 *    AND 조건식;
 * 
 * - 중복컬럼은 테이블명을 붙여야 한다.
 * - 테이블 별칭을 붙였다면 컬럼을 가져올 때 별칭을 통해 가져와야한다
 * - 별칭을 붙이지 않으면(테이블명) 데이터를 조회하는데 시간이 걸린다 
 */ 


-- 부모테이블 부서ID, 부서명, 조회(20번 부서) => 부모T
SELECT d.DEPARTMENT_ID AS 부서ID
	 , d.DEPARTMENT_NAME AS 부서명
  FROM DEPARTMENTS d
 WHERE d.DEPARTMENT_ID = 20;      --20	Marketing

  
-- 자식테이블 부서ID, 사번 조회(20번 부서) => 자식T
SELECT e.DEPARTMENT_ID AS 부서ID
	 , e.EMPLOYEE_ID AS 사번
  FROM EMPLOYEES e
 WHERE e.DEPARTMENT_ID = 20; 		--20	201
									--20	202

-- 20번 부서의 사번, last이름, 부서ID, 부서명 구하기 
SELECT e.EMPLOYEE_ID AS 사번
	 , e.LAST_NAME AS 이름
	 , e.DEPARTMENT_ID AS 부서코드
	 , d.DEPARTMENT_NAME AS 부서명
  FROM DEPARTMENTS d		-- 사원테이블
  	 , EMPLOYEES e			-- 부서테이블 (회사에선 일케 테이블 분리해서 주석달아놓는것이 좋음)
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
   AND d.DEPARTMENT_ID = 20;			-- 별칭 생략시 에러, 두테이블의 중복컬럼이므로

   
   
   
-- 20번 부서의 사번, last이름, 부서ID, 부서명 구하고, 그 중에서도 사번이 201번인 사람 
SELECT e.EMPLOYEE_ID AS 사번
	 , e.LAST_NAME AS 이름
	 , e.DEPARTMENT_ID AS 부서코드
	 , d.DEPARTMENT_NAME AS 부서명
  FROM DEPARTMENTS d		
  	 , EMPLOYEES e			
 WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
   AND d.DEPARTMENT_ID = 20
   AND e.EMPLOYEE_ID = 201;   
   
   
-- 방법1)
-- [사원정보, 부서정보]
-- 사원테이블의 사번이 101번인 사원의 사번, 부서번호, 부서명 조회
SELECT e.EMPLOYEE_ID AS 사번
	 , e.DEPARTMENT_ID AS 부서번호
	 , d.DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES e
  	 , DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND e.EMPLOYEE_ID = 101;

-- [사원정보, 부서정보]
-- 사원테이블의 사번이 107번인 사원의 사번, 부서번호, 부서명 조회
SELECT e.EMPLOYEE_ID AS 사번
	 , e.DEPARTMENT_ID AS 부서번호e
	 , d.DEPARTMENT_ID 부서번호d
	 , d.DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES e
  	 , DEPARTMENTS d
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND e.EMPLOYEE_ID = 107;
-- e테이블과 d테이블 모두 manager_id를 갖고 있으니 이걸로 비교해도 되나?
-- X!! : 둘다 pk, fk가 아니므로 비교시 제대로 된 결과값을 가져올 수 없음.
-- 조인 비교할 땐 의미상 연결되어있는 컬럼을 비교하는 것이 옳음.



-- 방법2. JOIN ~ ON => FROM절의 ,를 JOIN으로 바꾸고, WHERE를 ON으로 바꾸고 첫번째 AND를 WHERE로 바꾼다.
 /*
 - JOIN~ON
 - 중복컬럼은 테이블명을 붙여야 함
 - 테이블명과 테이블명 사이에 콤마(,)대신 JOIN을 사용하고 
 - 공통으로 존재하는 키를 비교(조인조건)하는 WHERE 대신에 ON을 사용한다.
 - 다른 검색이나 필터조건은 WHERE절에 분리해서 기술한다.
 */
   
SELECT e.EMPLOYEE_ID AS 사번
	 , e.DEPARTMENT_ID AS 부서번호e
	 , d.DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE e.EMPLOYEE_ID = 107;
   
  

-------------------------------------------------

-- 60번 부서(Sales)에서 일하는 사원의 사번, last name, 부서번호, 부서명
-- 기본방법1)과 방법2)로 각각해보기
   
-- 방법 1)
SELECT e.EMPLOYEE_ID AS 사번
	 , e.LAST_NAME AS 이름
	 , e.DEPARTMENT_ID AS 부서번호
	 , d.DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES e
  	 , DEPARTMENTS d
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
 AND d.DEPARTMENT_ID = 60;


-- 방법 2)
SELECT e.EMPLOYEE_ID AS 사번
	 , e.LAST_NAME AS 이름
	 , e.DEPARTMENT_ID AS 부서번호
	 , d.DEPARTMENT_NAME AS 부서명
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d
    ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
 WHERE d.DEPARTMENT_ID = 60;



-- [1. 사원정보, 직무정보 ]
-- 사원테이블의 사번이 110번인 사원의 사번, last_name, 직무ID, 직무타이틀, 최소급여, 최대급여
-- 방법1.
SELECT e.EMPLOYEE_ID AS 사번
	 , e.LAST_NAME AS 이름
	 , e.JOB_ID 직무id
	 , j.JOB_TITLE 직무타이틀
	 , j.MIN_SALARY 최소급여
	 , j.MAX_SALARY 최대급여
  FROM EMPLOYEES e
  	 , JOBS j
WHERE e.JOB_ID = j.JOB_ID
 AND e.EMPLOYEE_ID = 110;

-- 방법2.
SELECT e.EMPLOYEE_ID AS 사번
     , e.LAST_NAME 이름
     , j.JOB_ID 직무ID
     , j.JOB_TITLE 직무타이틀
     , j.MIN_SALARY 최소급여
     , j.MAX_SALARY 최대급여
  FROM EMPLOYEES e
  JOIN JOBS j
    ON e.JOB_ID = j.JOB_ID
 WHERE e.EMPLOYEE_ID = 110;


-----------------------------------------------
-- 세개 테이블 조인
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서번호
	 , d.DEPARTMENT_NAME 부서명
	 , j.JOB_TITLE 직무타이틀
  FROM EMPLOYEES e
  	 , DEPARTMENTS d
  	 , JOBS j
  WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND e.JOB_ID = j.JOB_ID
  AND e.EMPLOYEE_ID = 107;


-- [2. 사원정보, 부서정보, 위치정보 ]
-- 100번인 사원의 사번, last_name, 부서테이블의 부서코드, 부서명, 
-- 위치테이블의 location_id, street_address
-- 방법1. 
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서번호
	 , d.DEPARTMENT_NAME 부서명
	 , l.LOCATION_ID 위치번호
	 , l.STREET_ADDRESS 주소
  FROM EMPLOYEES e
  	 , DEPARTMENTS d
  	 , LOCATIONS l
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.LOCATION_ID = l.LOCATION_ID
   AND e.EMPLOYEE_ID = 100;


SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서번호
	 , d.DEPARTMENT_NAME 부서명
	 , l.LOCATION_ID 위치번호
	 , l.STREET_ADDRESS 주소
  FROM EMPLOYEES e
  join DEPARTMENTS d
    on e.DEPARTMENT_ID = d.DEPARTMENT_ID
  JOIN  LOCATIONS l
    ON d.LOCATION_ID = l.LOCATION_ID
 WHERE e.EMPLOYEE_ID = 100;


------------------------------------------------------------------------------------------------------------------------
-- 2025.6.20
-- 아침테스트

-- conuries T + regions T => region_id가 1일때의 정보 조회
-- 방법1)
SELECT r.REGION_ID 지역번호
     , c.COUNTRY_ID 국가번호
     , c.COUNTRY_NAME 국가명
     , r.REGION_NAME 지역명
  FROM COUNTRIES c
     , REGIONS r
WHERE c.REGION_ID = r.REGION_ID
  AND r.REGION_ID = 1;


-- 방법2)
SELECT c.COUNTRY_ID 국가번호
     , c.COUNTRY_NAME 국가명
     , r.REGION_ID 지역번호
     , r.REGION_NAME 지역명
  FROM COUNTRIES c
  JOIN REGIONS r
	ON c.REGION_ID = r.REGION_ID
 WHERE r.REGION_ID = 1
 ORDER BY r.REGION_ID ASC;
  
  

-- 사원 T +부서 T
-- 사번이 110번일 때 사번, last_name, 부서id, 부서명
-- 방법1)
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서아이디
	 , d.DEPARTMENT_NAME 부서명
  FROM EMPLOYEES e
  	 , DEPARTMENTS d
  WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND e.EMPLOYEE_ID = 110;


-- 방법2)
SELECT e.EMPLOYEE_ID
	 , e.LAST_NAME
	 , d.DEPARTMENT_ID
	 , d.DEPARTMENT_NAME
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
 WHERE e.EMPLOYEE_ID = 110
 ORDER BY e.EMPLOYEE_ID ASC;


-- [3. 사원정보, 부서정보, 위치정보, 국가정보 ]
-- 101번인 사원의 사번, last_name, 부서테이블의 부서코드, 부서명, 위치테이블의 location_id, street_address, 국가테이블의 id, name
-- 방법1. 
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서코드
	 , d.DEPARTMENT_NAME 이름
	 , l.LOCATION_ID 지역코드
	 , l.STREET_ADDRESS 주소
	 , c.COUNTRY_ID 국가번호
	 , c.COUNTRY_NAME 국가명
  FROM EMPLOYEES e
     , DEPARTMENTS d
     , LOCATIONS l
     , COUNTRIES c
WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
  AND d.LOCATION_ID = l.LOCATION_ID
  AND l.COUNTRY_ID = c.COUNTRY_ID
  AND e.EMPLOYEE_ID = 101;


-- 방법2
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서코드
	 , d.DEPARTMENT_NAME 이름
	 , l.LOCATION_ID 지역코드
	 , l.STREET_ADDRESS 주소
	 , c.COUNTRY_ID 국가번호
	 , c.COUNTRY_NAME 국가명
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  JOIN LOCATIONS l
    ON d.LOCATION_ID = l.LOCATION_ID
  JOIN COUNTRIES c
    ON l.COUNTRY_ID = c.COUNTRY_ID
 WHERE e.EMPLOYEE_ID = 101;



-- pk 조건2가지 : not null, 중복불가

-- [4. 사원정보, 부서정보, 위치정보, 국가정보, 지역정보]
-- 101번인 사원의 사번, last_name, 부서테이블의 부서코드, 부서명, 위치테이블의 location_id, street_address, 
-- 국가테이블의 id, name, Regions 테이블의 region_id, region_name
-- 방법1.
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서코드
	 , d.DEPARTMENT_NAME 부서명
	 , l.LOCATION_ID 지역번호
	 , l.STREET_ADDRESS 주소
	 , c.COUNTRY_ID 국가번호
	 , c.COUNTRY_NAME 국가명
	 , r.REGION_NAME 지역이름
	 , r.REGION_ID 구역id
  FROM EMPLOYEES e
     , DEPARTMENTS d
     , LOCATIONS l
     , COUNTRIES c
     , REGIONS r
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.LOCATION_ID = l.LOCATION_ID
   AND l.COUNTRY_ID = c.COUNTRY_ID
   AND c.REGION_ID = r.REGION_ID
   AND e.EMPLOYEE_ID = 101;


-- 방법2
SELECT
       e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서코드
	 , d.DEPARTMENT_NAME 부서명
	 , l.LOCATION_ID 지역번호
	 , l.STREET_ADDRESS 주소
	 , c.COUNTRY_ID 국가번호
	 , c.COUNTRY_NAME 국가명
	 , r.REGION_NAME 지역이름
	 , r.REGION_ID 구역id
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  JOIN LOCATIONS l
    ON d.LOCATION_ID = l.LOCATION_ID
  JOIN COUNTRIES c
    ON l.COUNTRY_ID = c.COUNTRY_ID
  JOIN REGIONS r
    ON c.REGION_ID = r.REGION_ID
 WHERE e.EMPLOYEE_ID = 101;


-- [5. 사원정보, 부서정보, 위치정보, 국가정보, 지역정보, 직무정보(현재), 직무history(이전)]
-- 101번인 사원의 사번, last_name, 부서테이블의 부서코드, 부서명, 위치테이블의 location_id, street_address, 
-- 국가테이블의 id, name, Regions 테이블의 region_id, region_name, 모든 직무정보, 
-- 직무history : start_date : '97/09/21'의 모든 정보 
-- 방법1. 
SELECT 
	   e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서코드
	 , d.DEPARTMENT_NAME 부서명
	 , l.LOCATION_ID 지역번호
	 , l.STREET_ADDRESS 주소
	 , c.COUNTRY_ID 국가코드
	 , c.COUNTRY_NAME 국가명
	 , r.REGION_ID 지역번호
	 , r.REGION_NAME 지역이름
	 , j.JOB_ID 직업코드
	 , j.JOB_TITLE 직무명
	 , j.MAX_SALARY 최대급여
	 , j.MIN_SALARY 최소급여
	 , jh.EMPLOYEE_ID 사번
	 , jh.END_DATE 퇴사일
	 , jh.START_DATE 입사일
	 , jh.JOB_ID 직무코드
	 , jh.DEPARTMENT_ID 부서코드
  FROM EMPLOYEES e
     , DEPARTMENTS d
     , LOCATIONS l
     , COUNTRIES c
     , REGIONS r
     , JOBS j
     , JOB_HISTORY jh
 WHERE e.DEPARTMENT_ID = d.DEPARTMENT_ID
   AND d.LOCATION_ID = l.LOCATION_ID
   AND l.COUNTRY_ID = c.COUNTRY_ID
   AND c.REGION_ID = r.REGION_ID
   AND e.JOB_ID = j.JOB_ID
   AND e.EMPLOYEE_ID = jh.EMPLOYEE_ID
   AND e.EMPLOYEE_ID = 101
   AND jh.START_DATE = '97/09/21';

-- 방법2
SELECT e.EMPLOYEE_ID 사번
	 , e.LAST_NAME 이름
	 , d.DEPARTMENT_ID 부서코드
	 , d.DEPARTMENT_NAME 부서명
	 , l.LOCATION_ID 지역번호
	 , l.STREET_ADDRESS 주소
	 , c.COUNTRY_ID 국가코드
	 , c.COUNTRY_NAME 국가명
	 , r.REGION_ID 지역번호
	 , r.REGION_NAME 지역이름
	 , j.JOB_ID 직업코드
	 , j.JOB_TITLE 직무명
	 , j.MAX_SALARY 최대급여
	 , j.MIN_SALARY 최소급여
	 , jh.EMPLOYEE_ID 사번
	 , jh.END_DATE 퇴사일
	 , jh.START_DATE 입사일
	 , jh.JOB_ID 직무코드
	 , jh.DEPARTMENT_ID 부서코드
  FROM EMPLOYEES e
  JOIN DEPARTMENTS d
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  JOIN locations l
    ON d.LOCATION_ID = l.LOCATION_ID
  JOIN COUNTRIES c
    ON l.COUNTRY_ID = c.COUNTRY_ID
  JOIN REGIONS r
    ON c.REGION_ID = r.REGION_ID
  JOIN jobs j
    ON e.JOB_ID = j.JOB_ID
  JOIN JOB_HISTORY jh
    ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID
 WHERE e.EMPLOYEE_ID = 101
   AND jh.START_DATE = '97/09/21';

