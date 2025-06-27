-- 책
-- 테이블 생성
-- CREATE TABLE 테이블명(
--    컬럼명     데이터타입(크기) PRIMARY KEY, -- 중복(X), NOT NULL
--);
drop table Book;
drop table Customer;
drop table Orders;
DROP TABLE IMPORTED_BOOK;

CREATE TABLE Book(
  bookid    NUMBER(2) PRIMARY KEY,
  bookname  VARCHAR2(40),
  publisher VARCHAR2(40),
  price     NUMBER(8)
);
-- 고객
CREATE TABLE Customer(
  custid  NUMBER(2) PRIMARY KEY,
  name    VARCHAR2(40),
  address  VARCHAR2(50),
  phone    VARCHAR2(20)
);
-- 주문
CREATE TABLE Orders(
  orderid NUMBER(2) PRIMARY KEY,
  custid  NUMBER(2) REFERENCES Customer(custid),
  bookid  NUMBER(2) REFERENCES Book(bookid),
  saleprice NUMBER(8),
  orderdate DATE
);

CREATE TABLE Imported_Book (
  bookid    NUMBER,
  bookname  VARCHAR2(40),
  publisher VARCHAR2(40),
  price     NUMBER(8)
);
--------------------------------------------------------------------------------
-- INSERT INTO 테이블명(컬럼1, 컬럼2,...컬럼n)
-- VALUES(val1, val2..valn);
/* Book, Customer, Orders 데이터 생성 */
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (1, '축구의 역사', '굿스포츠', 7000);
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (2, '축구아는 여자', '나무수', 13000);  
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (3, '축구의 이해', '대한미디어', 22000);    
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (4, '골프바이블', '대한미디어', 35000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (5, '피겨교본', '굿스포츠', 8000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (6, '역도 단계별기술', '굿스포츠', 6000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (7, '야구의 추억', '이상미디어', 20000);   
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (8, '야구를 부탁해', '이상미디어', 13000); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (9, '올림픽 이야기', '삼성당', 7500); 
INSERT INTO Book (bookid, bookname, publisher, price)
  VALUES (10, 'Olympic Champions', 'Person', 13000);   

  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(1, '박지성', '영국 멘체스터', '000-5000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(3, '장미란', '대한민국 강원도', '000-7000-0001');  
INSERT INTO Customer (custid, name, address, phone)
  VALUES(4, '추신수', '미국 클리브랜드', '000-8000-0001');
INSERT INTO Customer (custid, name, address, phone)
  VALUES(5, '박세리', '대한민국 대전', NULL);  
  
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(1,1,1,6000,TO_DATE('2014-07-01', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(2,1,3,21000,TO_DATE('2014-07-03', 'yyyy-mm-dd'));  
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(3,2,5,8000,TO_DATE('2014-07-03', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(4,3,6,6000,TO_DATE('2014-07-04', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(5,4,7,20000,TO_DATE('2014-07-05', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(6,1,2,12000,TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(7,4,8,13000,TO_DATE('2014-07-07', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(8,3,10,12000,TO_DATE('2014-07-08', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(9,2,10,7000,TO_DATE('2014-07-09', 'yyyy-mm-dd'));
INSERT INTO ORDERS (orderid, custid, bookid, saleprice, orderdate)
  VALUES(10,3,8,13000,TO_DATE('2014-07-10', 'yyyy-mm-dd'));  

INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Person', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);
commit;  

SELECT *
  FROM Book;

SELECT *
  FROM Customer;

SELECT *
  FROM ORDERS;  

SELECT *
  FROM Imported_Book;  
  
-----------------------------------------------------------------------------


--02. SQL 개요
--예) 김연아 고객의 전화번호를 찾으시오.

SELECT NAME 이름
	 , PHONE 전화번호
  FROM CUSTOMER
 WHERE NAME = '김연아';

--3.1.1 SELECT/FROM
--3-1 모든 도서의 이름과 가격을 검색하시오.
SELECT b.BOOKNAME 도서명
	 , b.PRICE 가격
  FROM BOOK b;

--(3-1 변형) 모든 도서의 가격과 이름을 검색하시오.
SELECT b.PRICE 가격
     , b.BOOKNAME 이름
  FROM BOOK b;

--3-2 모든 도서의 도서번호, 도서이름,출판사,가격을 검색하시오.
SELECT b.BOOKID 도서번호
     , b.BOOKNAME 도서이름
     , b.PUBLISHER 출판사
     , b.PRICE 가격
  FROM BOOK b;

--3-3 도서 테이블에 있는 모든 출판사를 검색하시오.
SELECT b.PUBLISHER
  FROM BOOK b;

--3.1.2 WHERE 조건

--3-4 가격이 20,000원 미만인 도서를 검색하시오.
SELECT b.BOOKNAME 도서이름
	 , b.PRICE 가격
  FROM BOOK b
 WHERE b.PRICE < 20000;

--3-5 가격이 10,000원 이상 20,000 이하인 도서를 검색하시오.
SELECT b.BOOKNAME 이름
	 , b.PRICE 가격
  FROM BOOK b
 WHERE b.PRICE >= 10000
   AND b.PRICE <= 20000;

--3-6 출판사가 '굿스포츠'혹은 '대한미디어'인 도서를 검색하시오.
SELECT b.BOOKNAME 도서이름
	 , b.PUBLISHER 출판사
  FROM BOOK b
 WHERE b.PUBLISHER = '굿스포츠'
    OR b.PUBLISHER = '대한미디어'
ORDER BY b.PUBLISHER ASC;

--3-7 '축구의 역사'를 출간한 출판사를 검색하시오.
SELECT b.BOOKNAME 도서이름
     , b.PUBLISHER 출판사
  FROM BOOK b
 WHERE b.BOOKNAME = '축구의 역사';

--3-8 도서이름에 '축구'가 포함한 출판사를 검색하시오.
SELECT b.PUBLISHER 출판사
	 , b.BOOKNAME 도서이름
  FROM BOOK b
 WHERE b.BOOKNAME LIKE '%축구%';
  

--3-9 도서이름의 왼쪽 두 번째 위치에 '구'라는 문자열을 갖는 도서를 검색하시오.
SELECT b.BOOKNAME 도서이름
  FROM BOOK b
 WHERE b.BOOKNAME LIKE '_구%';

--3-10 축구에 관한 도서 중 가격이 20,000원 이상인 도서를 검색하시오.
SELECT b.BOOKNAME 도서이름
     , b.PRICE 가격
  FROM BOOK b
 WHERE b.PRICE >= 20000
   AND b.BOOKNAME LIKE '%축구%';

--3-11 출판사가 '굿스포츠' 혹은 '대한미디어'인 도서를 검색하시오.
SELECT b.BOOKNAME 도서이름
     , b.PUBLISHER 출판사
  FROM BOOK b
 WHERE b.PUBLISHER = '굿스포츠'
    OR b.PUBLISHER = '대한미디어'
ORDER BY b.PUBLISHER desc;

--3-12 도서를 이름순으로 검색하시오
SELECT *
  FROM BOOK b
 ORDER BY b.BOOKNAME ASC;

--3-13 도서를 가격순으로 검색하고, 가격이 같으면 이름순으로 검색하시오
SELECT b.BOOKNAME 도서명
	 , b.PRICE 가격
	 , b.BOOKID 도서번호
	 , b.PUBLISHER 출판사
  FROM BOOK b
 ORDER BY b.PRICE, b.BOOKNAME;

--3-14 도서를 가격의 내림차순으로 검색하시오. 만약 가격이 같다면 출판사의 오름차순으로 검색한다.
SELECT b.BOOKID 도서번호
     , b.BOOKNAME 도서이름
     , b.PUBLISHER 출판사 
     , b.PRICE 가격
  FROM BOOK b
  ORDER BY b.PRICE DESC, b.PUBLISHER ASC;

--3-15 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT sum(ib.PRICE) "총 판매액"
  FROM IMPORTED_BOOK ib;

--3-16 2번 김연아 고객이 주문한 도서의 총 판매액을 구하시오.
SELECT c.NAME 이름
     , sum(o.SALEPRICE) "총 판매액"
  FROM CUSTOMER c
     , ORDERS o
 WHERE c.CUSTID = o.CUSTID
   and c.name = '김연아'
GROUP BY c.NAME;

--3-17 고객이 주문한 도서의 총판매액, 평균값, 최저가, 최고가를 구하시오
SELECT sum(o.SALEPRICE) 총판매액
	 , avg(o.SALEPRICE) 평균값
	 , min(o.SALEPRICE) 최저가 
	 , max(o.SALEPRICE) 최고가
  FROM ORDERS o;

--3-18 마당서점의 도서 판매 건수를 구하시오.
SELECT count(o.ORDERID) 도서판매건수
  FROM ORDERS o;

--3.2.2 GROUP BY
--3-19 고객별로 주문한 도서의 총 수량과 총 판매액을 구하시오.
SELECT o.CUSTID 고객번호
	 , count(o.BOOKID) "총 구매 도서 수"
	 , sum(o.SALEPRICE) "총 판매액"
  FROM orders o
 GROUP BY o.CUSTID
 ORDER BY o.CUSTID ASC;

--3-20 가격이 8,000원 이상인 도서를 구매한 고객에 대하여 고객별 주문 도서의 총 수량을 구하시오. 단, 두권 이상 구매한 고객만 구한다.
SELECT o.CUSTID 고객번호
	 , count(o.CUSTID) 주문도서수량
  FROM ORDERS o
  where o.SALEPRICE >= 8000
GROUP BY o.CUSTID
HAVING COUNT(o.CUSTID) >= 2;


--3-21 고객과 고객의 주문에 관한 데이터를 모두 보이시오.
SELECT *
  FROM CUSTOMER c
     , ORDERS o
 WHERE c.CUSTID = o.CUSTID;

--3-22 고객과 고객의 주문에 관한 데이터를 고객번호 순으로 정렬하여 보이시오.
SELECT *
  FROM CUSTOMER c
     , ORDERS o
 WHERE o.CUSTID = c.CUSTID
 ORDER BY c.CUSTID ASC;
     
--3-23 고객의 이름과 고객이 주문한 도서의 판매가격을 검색하시오.
SELECT c.NAME 이름
	 , o.SALEPRICE 가격
  FROM CUSTOMER c
     , ORDERS o
 WHERE c.CUSTID = o.CUSTID
 ORDER BY c.CUSTID ASC;

--3-24 고객별로 주문한 모든 도선의 총 판매액을 구하고, 고객별로 정령하시오.
SELECT sum(o.SALEPRICE) 총판매액
     , c.CUSTID 고객번호
  FROM CUSTOMER c
     , ORDERS o
 WHERE c.CUSTID = o.CUSTID
 GROUP BY c.CUSTID
 ORDER BY c.CUSTID ASC;

--3-25 고객의 이름과 고객이 주문한 도서의 이름을 구하시오.
SELECT c.NAME 고객명
	 , b.BOOKname 도서명
  FROM CUSTOMER c
     , ORDERS o
     , BOOK b
 WHERE c.CUSTID = o.CUSTID
   AND o.BOOKID = b.BOOKID;

--3-26 가격이 20,000원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오.
SELECT c.NAME 고객명
	 , b.BOOKNAME 도서명
  FROM CUSTOMER c
     , ORDERS o
     , BOOK b
 WHERE c.CUSTID = o.CUSTID
   AND b.BOOKID = o.BOOKID
   AND b.PRICE >= 20000;


--3-27 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오.
SELECT c.NAME
	 , o.SALEPRICE
  FROM orders o
  	 , CUSTOMER c
 WHERE o.CUSTID(+) = c.CUSTID;
  
 
--3.3.2 부속질의
--3-28 가장 비싼 도서의 이름을 보이시오.
SELECT b.BOOKNAME 도서명
  FROM BOOK b
 WHERE b.PRICE = (SELECT max(price) FROM book);

--3-29 도서를 구매한 적이 있는 고객의 이름을 검색하시오.
SELECT c.NAME 이름
  FROM CUSTOMER c
 WHERE c.CUSTID = any(SELECT o.CUSTID
 					 FROM orders o);
  
--3-30 대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오.
SELECT c.NAME 이름
	 , o.BOOKID 도서아이디
  FROM CUSTOMER c
  	 , orders o
 WHERE o.BOOKID in(SELECT b.BOOKID
                     FROM book b
                    WHERE b.PUBLISHER like '%대한미디어%')
   AND o.CUSTID = c.CUSTID;


--3-31 출판사별로 출판사의 평균 도서 가격보다 비싼 도서를 구하시오.
SELECT b.BOOKNAME 책이름
	 , b.PUBLISHER
  FROM book b
 WHERE b.PRICE > (SELECT round(avg(b2.PRICE))
                    	FROM BOOK b2
				  		WHERE b2.PUBLISHER = b.PUBLISHER)

--3-32 도서를 주문하지 않은 고객의 이름을 보이시오.
SELECT c.NAME 고객명
  FROM CUSTOMER c
 WHERE c.CUSTID NOT in (SELECT o.CUSTID
                    FROM orders o);

--3-33 주문이 있는 고객의 이름과 주소를 보이시오.
SELECT c.NAME 이름
	 , c.ADDRESS 주소
  FROM CUSTOMER c
 WHERE c.CUSTID in (SELECT DISTINCT o.CUSTID
                    	 FROM orders o);


--4.1 CREATE 문
--3-34 다음과 같은 속성을 가진 NewBook 테이블을 생성하시오. 정수형은 NUMBER를, 문자형은 가변형 문자타입인 VARCHAR2를 사용한다.
 bookid	NUMBER,
bookname  VARCHAR2(20),
publisher  VARCHAR2(20),
price      NUMBER);

DROP TABLE NewBook;

CREATE TABLE NewBook(
	bookid 		NUMBER,
	bookname	varchar2(20),
	publisher	varchar2(20),
	price		NUMBER);

--3-35 다음과 같은 속성을 가진 NewCustomer 테이블을 생성하시오.
-custid(고객번호) NUMBER, 기본키
-name(이름)-VARCHAR2(40)
-address(주소)-VARCHAR2(40)
-phone(전화번호)-VARCHAR2(30)

DROP TABLE NewCustomer;

CREATE TABLE NewCustomer (
	custid		NUMBER		PRIMARY KEY,
	name		varchar2(40),
	address		varchar2(40),
	phone		varchar2(30));


--3-36 다음과 같은 속성을 가진 NewOrders 테이블을 생성하시오.
-orderid(주문번호)- NUMBER, 기본키
-custid(고객번호)- NUMBER, NOT NULL 제약조건, 외래키(NewCustomer.custid, 인쇄삭제)
-bookid(도서번호)- NUMBER, NOT NULL 제약조건
-saleprice(판매가격)-NUMBER
-orderdate(판매일자)-DATE

DROP TABLE NewOrders;

CREATE TABLE NewOrders(
	orderid		NUMBER	PRIMARY KEY,
	custid		NUMBER  NOT null,
	bookid		NUMBER	NOT NULL,
	saleprice	NUMBER,
	orderdate	DATE,
	CONSTRAINT neworders_custid_fk FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);

SELECT * FROM NEWOrders;

--4.2 ALTER문
--3-37 NewBook 테이블에 VARCHAR2(13)의 자료형을 가진 isbn 속성을 추가하시오.
ALTER TABLE NEWBOOK
ADD isbn varchar2(13);

SELECT * FROM NEWBOOK n;

--3-38 NewBook 테이블의 isbn 속성의 데이터 타입을 NUMBER형으로 변경하시오.
ALTER TABLE NEWBOOK
MODIFY isbn NUMBER;

--3-39 NewBook 테이블의 isbn 속성을 삭제하시오.
ALTER TABLE NEWBOOK
DROP COLUMN isbn;

--3-40 NewBook 테이블의 bookid 속성에 NOT NULL 제약조건을 적용하시오.
ALTER TABLE NEWBOOK
MODIFY (bookid NOT null);

--3-41 NewBook 테이블의 bookid 속성을 기본키로 변경하시오.
ALTER TABLE newbook
ADD CONSTRAINT newbook_bookid_pk PRIMARY KEY (bookid);

--4.3 DROP 문
--3-42 NewBook 테이블을 삭제하시오.
DROP TABLE newbook;

--3-43 NewCustomer 테이블을 삭제하시오. 만약 삭제가 거절된다면 원인을 파악하고 관련된 테이블을 같이 삭제하시오(NewOrders 테이블이 NewCustomer를 참조하고 있음).
DROP TABLE NEWORDERS;
DROP TABLE NEWCUSTOMER;







