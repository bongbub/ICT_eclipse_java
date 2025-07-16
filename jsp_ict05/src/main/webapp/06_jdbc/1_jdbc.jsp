<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 - DBMS</title>
</head>
<body>


<!-- 	JDBC(Java DataBase Connectivity)
   - 자바에서 데이터베이스와 통신할 때 사용하는 API
   - DBMS와의 통신을 담당하는 자바클래스   
   - ojdbc6.jar 파일 필요 => WEB-INF/lib -->

<%
	// DB연결
	
	String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbID = "scott_05";
	String dbPassword="tiger";
	
	Connection conn = null; 		// 오라클 연결
	PreparedStatement pstmt = null;	// SQL문장
	ResultSet rs = null;		// 실행결과
	
	/* -- 회원정보 테이블 삭제
	 DROP TABLE member_tbl;
	 
	 -- 회원정보 테이블 생성
	 CREATE TABLE member_tbl(   					-- MEMBER_TBL 이라는 테이블 생성
		mem_id     	number(3) 		PRIMARY KEY,  	-- mem_id 라는 이름의 컬럼, number(3)형식의 프라이머리키 (pk:UNIQUE, NOT NULL)
		mem_name  	varchar(50) 	NOT NULL,  		-- NOT NULL : 필수라는 뜻
		mem_age		number(3),
		mem_email	varchar(60)		NOT NULL UNIQUE,-- 필수, 중복허용x
		mem_address varchar(100) 
	 );
	 
	 SELECT * FROM member_tbl; */ 
%>

	<h3> Member 정보 </h3>
	<table border="1" cellspacing="0" cellpadding="5">
		<tr>
			<th> id </th>
			<th> name </th>
			<th> age </th>
			<th> email </th>
			<th> address</th>
		</tr>
	<%
		try{
			// 1. JDBC 드라이버 로딩
			// Class.forName();  => 지정한 클래스 정보를 담고있는 클래스 인스턴스 구해주는 메서드
			Class.forName("oracle.jdbc.driver.OracleDriver");		// WEB-INF/lib 폴더에 jdbc6.jar 파일 추가
			
			// 2. DB 연결 => Database Connection 생성
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			
		   	// 3.SQL 작성 => PrepareStatement 작성
	      	/*
	         - SQL 쿼리의 틀을 미리 생성해놓고, 값을 나중에 지정
	         - 값변동을 자동으로 하기 위함
	         - 간결한 코드를 위해 사용
	         - 보안
	         - set 계열의 메서드를 사용해서 물음표를 대체할 값을 지정해 주어야 한다.
	         - 첫번째 물음표의 인덱스는 1이며, 이후 물음표의 인덱스는 나오는 순서대로 인덱스 값이 1씩 증가한다.
	         - ?를 ''로 감싸지 않는다.
	      	*/
	      	String query = "SELECT * FROM member_tbl "
	      					+ " ORDER BY mem_id";
			
			// 4. 쿼리 실행
			/*   
				ResultSet executeQuery()  =>  select문
	         	- SELECT문의 실행결과를 ResultSet 객체에 담아서 리턴한다.
	         	- 따라서 ResultSet에 제공하는 메서드를 사용해서 결과값을 읽어올 수 있다.
	         	- next() 메서드를 사용해서 SELECT 결과의 존재여부를 확인할 수 있다.
	         
	         	int executeUpdate() => I, U, D
	         	- Insert, Update, Delete 쿼리를 실행할 때 사용하며, 실행결과로 변경된 레코드의 건수를 리턴한다.
	         	- SQL문 실행후 테이블의 내용만 변경되는 경우 사용하며, 변경건수를 int형으로 리턴한다.
	         	- 결과가 0:실패, 1:성공
	      	*/
			pstmt = conn.prepareStatement(query);
			
			// 4-1. 실행(조회) 결과를 ResultSet에 담기
			rs = pstmt.executeQuery();		// Ctrl+Enter(실행)
			
			// 5. 실행결과 출력 => ResultSet에 데이터가 존재할 때 출력
			while(rs.next()){
			%>
			<tr>
				<td> <%= rs.getInt("mem_id") %></td>
				<td> <%= rs.getString("mem_name") %></td>
				<td> <%= rs.getInt("mem_age") %></td>
				<td> <%= rs.getString("mem_email") %></td>
				<td> <%= rs.getString("mem_address") %></td>
			</tr>
			<%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			try{
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	
	%>	
		
		
		
	</table>


</body>
</html>