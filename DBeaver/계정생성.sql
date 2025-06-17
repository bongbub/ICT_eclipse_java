-- SYSTEM_04 관리자 계정은 (SYSTEM/비밀번호 oracle)로 연결
-- 모든 계정은 관리자인 SYSTEM_05 계정에서 계정 생성

-- 1. 사용자 계정생성 : scott_05 계정생성 .. 1,2,3번
-- create user <계정이름> identified by <계정암호> default tablespace users;
create user scott_05 identified by tiger default tablespace users; 

-- 2. 사용자 권한 부여
-- grant [시스템 권한] to [계정];
grant connect, resource, create view, create session to scott_05;

-- 3. 락 해제
-- alter user <계정이름> account unlock;
alter user scott_05 account unlock;



//////////////////////////////////////////////////////

-- hr 계정사용(오라클에서 제공하는 인사관리데이터) .. 2, 3, 5번
-- 2. 사용자 권한 부여
-- grant [시스템 권한] to [계정];
grant connect, resource, create view, create session to hr;

-- 3. 락 해제
-- alter user <계정이름> account unlock;
alter user hr account unlock;

-- 5. 패스워드 변경
--alter user <계정이름> identified by <패스워드>;
alter user hr identified by tiger; 
/////////////////////////////////////////////////////////

--  권한취소
-- revoke [시스템 권한] from [계정];
-- revoke create view from jdbc;

-- 4. 계정 잘못만든 경우 계정, 객체 삭제하기 
-- drop user <계정이름> cascade;
-- drop user hr cascade; 



