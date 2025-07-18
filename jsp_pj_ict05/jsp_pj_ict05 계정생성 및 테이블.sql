/*6. 계정생성(System 계정에서) 1. ~ 2.*/

/* DBeaver에서는 Oracle 하위에 있는 Schemas를 새로고침하면 
자동으로 생성된 계정이 보인다. */

-- 오라클 설치(SYSTEM/ORACLE) 
-- SYSTEM계정에서 계정 생성
-- hr : sql developer-system_01계정에서 계정생성안해도 되고, 3.락해제 5.비밀번호변경만 한다.

-- 1. 계정생성 : jsp_pj_ict05 계정생성
-- create user <계정이름> identified by <계정암호> default tablespace users;
create user  jsp_pj_ict05 identified by tiger default tablespace users;

-- 2. 사용자 권한 부여
-- grant [시스템 권한] to [계정];
grant connect, resource, create view to jsp_pj_ict05;


-- 3. 락 해제
-- alter user <계정이름> account unlock;
alter user jsp_pj_ict05 account unlock;

-- 4. 계정 잘못만든 경우 계정, 객체 삭제하기 
-- drop user <계정이름> cascade;
-- drop user jsp_pj_ict05 cascade; 

-- 5. 패스워드 변경
-- alter user <계정이름> identified by <패스워드>;
-- alter user jsp_pj_ict05 identified by tiger; 

------------------------------------------------------------------------------------------------------

/*7. 테이블 생성*/
-- jsp_pj_ict05 계정에서 작업
-- 회원정보 테이블
DROP TABLE mvc_customer_tbl  CASCADE CONSTRAINTS;
CREATE TABLE mvc_customer_tbl(
    user_id         VARCHAR2(20)    PRIMARY KEY,    	-- ID
	user_password   VARCHAR2(20)    NOT NULL,          	-- 비밀번호
	user_name   	VARCHAR2(50)    NOT NULL,          	-- 이름
	user_birthday   DATE            NOT NULL,          	-- 생년월일    
	user_address    VARCHAR2(50)    NOT NULL,          	-- 주소
	user_hp         VARCHAR2(13),                      	-- 핸드폰      
	user_email      VARCHAR2(50)    NOT NULL,          	-- 이메일
	user_regdate    TIMESTAMP       DEFAULT sysdate    	-- 가입일
); 

-- 테이블 생성했다면, 꼭 해당 스키마를 새로고침을 해야 하위의 테이블 목록에 생성된 것이 보임

SELECT * FROM MVC_CUSTOMER_TBL;

DELETE FROM MVC_CUSTOMER_TBL ;
