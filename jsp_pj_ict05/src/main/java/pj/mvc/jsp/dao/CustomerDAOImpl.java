package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;		// 주의!
import javax.naming.NamingException;
import javax.sql.DataSource;			// 주의!

import pj.mvc.jsp.dto.CustomerDTO;

public class CustomerDAOImpl implements CustomerDAO{
	
	// 커넥션 풀 객체 보관
	DataSource dataSource = null;
	
	
	// 싱글톤 객체 생성
	static CustomerDAOImpl instance = new CustomerDAOImpl();
	
	public static CustomerDAOImpl getInstance() {
		if(instance == null) {
			instance = new CustomerDAOImpl();
		}
		return instance;
	}
	
	// 커넥션풀(DBCP : DataBase Connection Pool 방식) - 톰캣파일(Servers)내에있음 context.xml에 설정
	private CustomerDAOImpl(){
		// 디폴트 생성자 내에서 처리
		try {
			InitialContext context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_ict05");	// context.xml의 <Resource.. name명과 같아야함)
		}catch(NamingException e) {
			e.printStackTrace();
		}
		
	}

	
	// ID 중복 확인 처리
	@Override
	public int useridCheck(String strId) {
		int selectCnt = 0;
		String query = "SELECT user_id FROM mvc_customer_tbl WHERE user_id =?";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = dataSource.getConnection();
			pstmt= conn.prepareStatement(query);
			
			pstmt.setString(1, strId.trim());
			rs = pstmt.executeQuery();
			
			// 데이터가 존재하면
			if(rs.next()) {
				selectCnt = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return selectCnt;
	}

	// 회원가입 처리
	@Override
	public int insertCustomer(CustomerDTO dto) {
		System.out.println("CustomerDAOImpl - insertCustomer() ");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int insertCnt = 0;
		
		try {
			// 1. DB 연결 => 데이터베이스 커넥션 생성
			conn = dataSource.getConnection();
			
			// 2. SQL 작성 => PreparedStatement 작성
			String sql = "INSERT INTO mvc_customer_tbl (user_id, user_password, user_name, user_birthday, user_address, user_hp, user_email, user_regdate)"
					+ " VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUser_id());
			pstmt.setString(2, dto.getUser_password());
			pstmt.setString(3, dto.getUser_name());
			pstmt.setDate(4, dto.getUser_birthday());
			pstmt.setString(5, dto.getUser_address());
			pstmt.setString(6, dto.getUser_hp());
			pstmt.setString(7, dto.getUser_email());
			pstmt.setTimestamp(8, dto.getUser_regdate());
			
			// 3. 실행
			insertCnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println(insertCnt);
		return insertCnt;
	}

	// 로그인 처리 / 회원정보 인증(수정, 탈퇴)
	@Override
	public int idPasswordChk(String strId, String password) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int loginCnt = 0;
		
		try {
			String query = "SELECT user_id, user_password FROM mvc_customer_tbl WHERE user_id=? and user_password=?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, strId);
			pstmt.setString(2, password);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				loginCnt = 1;
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return loginCnt;
	}

	// 회원정보 인증처리 및 탈퇴처리 
	@Override
	public int deleteCustomer(String strId) {
		int deleteCnt = 0;
		Connection conn= null;
		PreparedStatement pstmt = null;
		
		try {
			String query = "DELETE FROM mvc_customer_tbl WHERE user_id=?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, strId);
			deleteCnt = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return deleteCnt;
	}

	// 상세페이지 조회
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		CustomerDTO dto = new CustomerDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM mvc_customer_tbl WHERE user_id = ?";
		try {
			conn = dataSource.getConnection();
			pstmt =  conn.prepareStatement(query);
			pstmt.setString(1, strId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setUser_id(rs.getString("user_id"));
				dto.setUser_password(rs.getString("user_password"));
				dto.setUser_name(rs.getString("user_name"));
				dto.setUser_birthday(rs.getDate("user_birthday"));
				dto.setUser_address(rs.getString("user_address"));
				dto.setUser_hp(rs.getString("user_hp"));
				dto.setUser_email(rs.getString("user_email"));
				dto.setUser_regdate(rs.getTimestamp("user_regdate"));
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	// 회원정보 수정처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		String query = "UPDATE mvc_customer_tbl SET user_password=? ,"
				+ " user_name=?, user_birthday=? , user_address=? , user_hp=? , user_email=?, user_regdate=? WHERE user_id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateCnt = 0;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getUser_password());
			pstmt.setString(2, dto.getUser_name());
			pstmt.setDate(3, dto.getUser_birthday());
			pstmt.setString(4, dto.getUser_address());
			pstmt.setString(5, dto.getUser_hp());
			pstmt.setString(6, dto.getUser_email());
			pstmt.setTimestamp(7, dto.getUser_regdate());
			pstmt.setString(8, dto.getUser_id());
			
			updateCnt = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return updateCnt;
	}

}
