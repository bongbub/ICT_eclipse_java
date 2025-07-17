package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
	
	// 커넥션풀(DBCP : DataBase Connection Pool 방식) - context.xml에 설정
	private CustomerDAOImpl(){
		// 디폴트 생성자 내에서 처리
		try {
			InitialContext context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_ict05");
		}catch(NamingException e) {
			e.printStackTrace();
		}
		
	}

	
	// ID 중복 확인 처리
	@Override
	public int useridCheck(String strId) {
		return 0;
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
		return 0;
	}

	// 회원정보 인증처리 및 탈퇴처리 
	@Override
	public int deleteCustomer(String strId) {
		return 0;
	}

	// 회원정보 인증처리 및 상세페이지 처리
	@Override
	public CustomerDTO getCustomerDetail(String strId) {
		return null;
	}

	// 회원정보 수정처리
	@Override
	public int updateCustomer(CustomerDTO dto) {
		return 0;
	}

}
