package jdbc.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.mvc.dto.BookDTO;

// DAO - DB처리(DB연결, 데이터 CRUD(입력수정삭제조회))
public class BookDAOImpl implements BookDAO{
	
	// 추후 싱글톤으로 변경
	
	
	// DB연결
	String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbID = "scott_05";		// 계정
	String dbPassword = "tiger";	// 비밀번호
	
	// 연결할때 사용할 클래스(커넥션 정보) 연결변수
	Connection conn = null; // 자바에서 제공하는 클래스(java.sql)
	PreparedStatement pstmt = null;   // SQL 문장을 담음(제공클래스 java.sql)
	ResultSet rs = null;	// SQL 실행결과(SELECT절에서만 사용)

	@Override
	public int bbookInsert(BookDTO dto) {
		System.out.println("BookDAOImpl - bookInsert()");
		
		int insertCnt = 0;
		
		String query = "INSERT INTO mvc_book_tbl(bookid, title, author, publisher, price)"
				+ " VALUES((SELECT nvl(max(bookId) + 1, 1) FROM MVC_BOOK_TBL mbt), ?, ?, ?, ?)";
				// getter로 가져오면 문장이 길어짐. ex) dto.getBookId, dto.getBookTitle....)
				// --> dto 자리를 ?로 줌 ==> 현재에서 설정하지 않겠다
				// 또한 Values 앞이든, into문 괄호 끝 뒤든, 공백하나 줘야함.!!!!! 중요
				// 쿼리로 ?를 받아 prepareStatement로 받고, pstmt로 나중에 할당하겠다는 뜻
				// 근데 도서번호자리(첫번째 물음표)는 자동으로 count되게 할것이니까 현재(max값)을 가져와서 줌
		
		try {
			
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword); //오라클 연결
			pstmt = conn.prepareStatement(query);	//sql문 작성
			
			// ?로 준 값 할당
			pstmt.setString(1, dto.getTitle()); // 1은 물음표 위치
			pstmt.setString(2, dto.getAuthor());	// 2번물음표에 getAuthor()이 들어감
			pstmt.setString(3, dto.getPublisher());	// 3번 물음표에 getPub..()이 들어감
			pstmt.setInt(4, dto.getPrice());	// 4번 물음표에 getPrice()들어감
			
			insertCnt = pstmt.executeUpdate();              // 실행하다
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close(); //열렸을 때만 닫아주기
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return insertCnt;  // 결과값을 리턴
	}

	@Override
	public int bbookUpdate(int bookid, BookDTO dto) {
		
		int updateCnt = 0;
		//--UPDATE [테이블] SET [열] = '변경할값' WHERE [조건]
		String query = "UPDATE mvc_book_tbl SET title = ?, author = ?, publisher = ?, price = ? WHERE bookid = ? ";
		
		try {
			
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword); //오라클 연결
			pstmt = conn.prepareStatement(query);	//sql문 작성
			
			//pstmt.setInt(1, dto.getBookId());// 1은 물음표 위치
			pstmt.setString(1, dto.getTitle()); 
			pstmt.setString(2, dto.getAuthor());
			pstmt.setString(3, dto.getPublisher());	
			pstmt.setInt(4, dto.getPrice());	
			pstmt.setInt(5, bookid);
			
			updateCnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close(); //열렸을 때만 닫아주기
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return updateCnt;
	}

	@Override
	public int bbookDelete(int bookId) {
		int deleteCnt = 0;
		String query = "DELETE FROM mvc_book_tbl WHERE bookid = ?";
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword); //오라클 연결
			pstmt = conn.prepareStatement(query);	//sql문 작성
			
			pstmt.setInt(1, bookId);
			deleteCnt = pstmt.executeUpdate();
			
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(pstmt != null) pstmt.close(); //열렸을 때만 닫아주기
				if(conn != null) conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return deleteCnt;
	}
	
	@Override
	public BookDTO sselectBookById(int bookId) {
		String query = "SELECT * FROM mvc_book_tbl WHERE bookid = ? ";
		BookDTO dto = null;
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, bookId);
			rs = pstmt.executeQuery();
			if(rs.next()) { // rs에 값이 존재하면
				dto = new BookDTO();
				dto.setBookId(rs.getInt("bookId"));
				dto.setAuthor(rs.getString("author"));
				dto.setTitle(rs.getString("title"));
				dto.setPublisher(rs.getString("publisher"));
				dto.setPrice(rs.getInt("price"));
				dto.setPubdate(rs.getString("pubdate"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dto;
	}
	
	
	
	
	
	
	

}
