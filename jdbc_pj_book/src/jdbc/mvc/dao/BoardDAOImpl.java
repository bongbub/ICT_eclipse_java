package jdbc.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.mvc.dto.BoardDTO;

public class BoardDAOImpl implements BoardDAO{
	
	// 싱글톤
	private static BoardDAOImpl instance = new BoardDAOImpl();
	private BoardDAOImpl() {
		
	}
	public static BoardDAOImpl getInstance() {
		if(instance == null) {
			instance = new BoardDAOImpl();
		}
		return instance;
	}
	
	// DB 연결
	String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbID = "scott_05";
	String dbPassword="tiger";
	
	// 연결에 사용하는 클래스
	Connection conn=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	@Override
	public int boardInsertDAO(BoardDTO dto) {
		
		//성공했는지 확인하는 int
		int insertCnt = 0;
		String query = "INSERT INTO mvc_board_tbl(boardNo, boardTitle, boardContent, boardId)"
				+" VALUES((SELECT NVL(MAX(boardNo) + 1, 1) FROM mvc_board_tbl ),?,?,?)";
		try {
			conn=DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getBoardTitle());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setString(3,dto.getBoardId());
			
			insertCnt = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return insertCnt;
	}

	@Override
	public int boardUpdateDAO(int boardNo, BoardDTO dto) {
		int updateCnt = 0;
		String query="UPDATE mvc_board_tbl SET boardTitle=?, boardContent=?, boardId=?, boardNo = ?"
				+ "WHERE boardNo = ?";
		try {
			conn=DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt=conn.prepareStatement(query);
			
			pstmt.setString(1, dto.getBoardTitle());
			pstmt.setString(2, dto.getBoardContent());
			pstmt.setString(3, dto.getBoardId());
			pstmt.setInt(4, boardNo);
			pstmt.setInt(5, boardNo);
			updateCnt=pstmt.executeUpdate();
			
			
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

	@Override
	public int boardDeleteDAO(int boardNo) {
		int deleteCnt=0;
		String query="DELETE FROM mvc_board_tbl WHERE boardNo=?";
		
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt=conn.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
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

	@Override
	public BoardDTO boardSelectByIdDAO(int boardNo) {
		String query = "SELECT * FROM mvc_board_tbl WHERE boardNo=?";
		BoardDTO dto = null;
		try {
			conn=DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt=conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto = new BoardDTO();
				dto.setBoardNo(rs.getInt("boardNo"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setBoardId(rs.getString("boardId"));
				dto.setBoardRegDate(rs.getDate("boardRegDate"));
				dto.setBoardRegDate(rs.getDate("boardRegDate"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return dto;
	}

	@Override
	public List<BoardDTO> boardSelectByTitleDAO(String boardTitle) {
		String query = "SELECT * FROM mvc_board_tbl WHERE boardTitle like ?";
		BoardDTO dto = null;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+boardTitle+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setBoardNo(rs.getInt("boardNo"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setBoardId(rs.getString("boardId"));
				dto.setBoardRegDate(rs.getDate("boardRegDate"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<BoardDTO> boardSelectAllDAO() {
		String query = "SELECT * FROM mvc_board_tbl ORDER BY boardNo ASC";
		BoardDTO dto = null;
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new BoardDTO();
				dto.setBoardNo(rs.getInt("boardNo"));
				dto.setBoardTitle(rs.getString("boardTitle"));
				dto.setBoardContent(rs.getString("boardContent"));
				dto.setBoardId(rs.getString("boardId"));
				dto.setBoardRegDate(rs.getDate("boardRegDate"));
				
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}
			catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
		
	}

}