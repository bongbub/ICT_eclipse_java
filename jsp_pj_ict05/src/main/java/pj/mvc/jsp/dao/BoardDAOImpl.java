package pj.mvc.jsp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import pj.mvc.jsp.dto.BoardCommentDTO;
import pj.mvc.jsp.dto.BoardDTO;

public class BoardDAOImpl implements BoardDAO{
	
	// 커넥션 풀 객체를 보관
	DataSource dataSource = null;
	
	// 싱글톤 객체 생성
	static BoardDAOImpl instance = new BoardDAOImpl();
	public static BoardDAOImpl getInstance() {		// 클래스명 메서드 호출할라니까 -> static으로 만들어줘야함 -> 그럼 메서드 내에 있는 instance도 static이 되어야함
		if(instance == null) {
			instance = new BoardDAOImpl();
		}
		return instance;
	}
	
	// 디폴트 생성자
	// 커넥션풀(DBCP : DataBase Connection Pool 방식) - context.xml에 설정 - Resource name으로 lookup
	private BoardDAOImpl(){
		try {
			Context context = new InitialContext();
			dataSource = (DataSource)context.lookup("java:comp/env/jdbc/jsp_pj_ict05");
		}catch(NamingException e) {
			e.printStackTrace();
		}
	}
	

	// 게시글 목록
	@Override
	public List<BoardDTO> boardList(int start, int end) {
		System.out.println("<<< BoardDAOImpl ==> boardList() >>>");
		
		Connection conn = null;				// 오라클 연결
		PreparedStatement pstmt = null;		// SQL문장
		ResultSet rs = null;				// SELECT 결과를 담기 위함
		
		// 1. List 생성
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			// 1-1. DB연결
			conn = dataSource.getConnection();
			
			// 1-2. SQL문 생성
			String sql = "SELECT *"
						+ " FROM"
						+ "  	(SELECT A.*"
						+ "		      , rownum AS rn"
						+ "		FROM"
						+ "		  	(SELECT * FROM mvc_board_tbl"
						+ "				ORDER BY b_num DESC)  A"
						+ "		)"
						+ " WHERE rn BETWEEN ? AND  ?";
			
			// 2. 데이터가 존재하면 DTO 생성
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			// 2-1. 데이터가 존재하면
			while(rs.next()) {
				// dto 생성하고 담는다
				BoardDTO dto = new BoardDTO();
				// 3. dto에 1건의 rs 게시글 정보를 담는다.
				dto.setB_num(rs.getInt("b_num"));
				dto.setB_title(rs.getString("b_title"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_password(rs.getString("b_password"));
				dto.setB_readCnt(rs.getInt("b_readCnt"));
				dto.setB_regDate(rs.getDate("b_regDate"));
				dto.setB_comment_count(rs.getInt("b_comment_count"));
				
				// 4. List에 dto를 추가한다
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
		// 5. list를 리턴
		return list;
	}

	// 게시글 갯수 구하기
	@Override
	public int boardCnt() {
		System.out.println(" <<< BoardDAOImpl - boardCnt() >>>");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			String sql = "SELECT COUNT(*) AS cnt FROM mvc_board_tbl";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt("cnt");
			}
		} catch(SQLException e) {
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
		return total;
	}

	// 조회수 증가
	@Override
	public void plusReadCnt(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "UPDATE mvc_board_tbl "
						+ "SET b_readCnt = b_readCnt + 1 "
						+ "WHERE b_num = ?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
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
	}

	// 게시글 상세 처리
	@Override
	public BoardDTO getBoardDetail(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO dto = new BoardDTO();
		try {
			String sql ="SELECT * FROM mvc_board_tbl "
						+ " WHERE b_num = ?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setB_num(num);
				dto.setB_title(rs.getString("b_title"));
				dto.setB_content(rs.getString("b_content"));
				dto.setB_writer(rs.getString("b_writer"));
				dto.setB_password(rs.getString("b_password"));
				dto.setB_readCnt(rs.getInt("b_readCnt"));
				dto.setB_regDate(rs.getDate("b_regDate"));
				dto.setB_comment_count(rs.getInt("b_comment_count"));
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

	// 게시글 수정삭제 버튼 클릭 시 - > 비밀번호 인증 처리
	@Override
	public int password_chk(int num, String password) {
		int selectCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "SELECT count(*) AS cnt FROM MVC_BOARD_TBL"
					+ " WHERE b_num = ?"
					+ " AND b_password = ? ";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, password);
			rs =pstmt.executeQuery();
			if(rs.next()) {
				selectCnt = rs.getInt("cnt");
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
		
	// 게시글 수정 처리
	@Override
	public void updateBoard(BoardDTO dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateCnt = 0;
		try {
			String sql = "UPDATE mvc_board_tbl"
					+ " SET b_password =? "
					+ " , b_title = ?"
					+ " , b_content = ?"
					+ " WHERE b_num = ?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getB_password());
			pstmt.setString(2, dto.getB_title());
			pstmt.setString(3, dto.getB_content());
			pstmt.setInt(4, dto.getB_num());
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
	}

	// 게시글 삭제 처리
	@Override
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int deleteCnt = 0;
		try {
			String sql = "DELETE FROM mvc_board_tbl "
					+ "WHERE b_num = ?";
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	}
	
	// 게시글 작성 처리
	@Override
	public void insertBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
	}
	
	// 댓글 작성 처리
	@Override
	public int insertComment(BoardCommentDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	// 댓글 목록 처리
	@Override
	public List<BoardCommentDTO> commentList(int board_num) {
		// TODO Auto-generated method stub
		return null;
	}
}
