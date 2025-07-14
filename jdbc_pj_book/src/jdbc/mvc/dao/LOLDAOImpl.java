package jdbc.mvc.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.mvc.dto.LOLDTO;

public class LOLDAOImpl implements LOLDAO{
	
	// 싱글톤
	private static LOLDAOImpl instance = new LOLDAOImpl();
	private LOLDAOImpl() {};
	public static LOLDAOImpl getInstance() {
		if(instance == null) {
			instance = new LOLDAOImpl();
		}
		return instance;
	}
	
	
	// DB처리
	String dbUrl = "jdbc:oracle:thin:@localhost:1521/xe";
	String dbID = "scott_05";
	String dbPassword = "tiger";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// 1. 챔피언 검색
	@Override
	public List<LOLDTO> daoSelectChamp(String champName) {
		String query = "SELECT * FROM mvc_lol_tbl WHERE champName like ?";
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+champName+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LOLDTO dto = new LOLDTO();
				dto.setChampId(rs.getInt("champId"));
				dto.setChampName(rs.getString("champName"));
				dto.setqSkill(rs.getString("qSkill"));
				dto.setwSkill(rs.getString("wSkill"));
				dto.seteSkill(rs.getString("eSkill"));
				dto.setrSkill(rs.getString("rSkill"));
				dto.setMainLine(rs.getString("mainLine"));
				dto.setSubLine(rs.getString("subLine"));
				dto.setWinPc(rs.getDouble("winPc"));
				
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<LOLDTO> daoSelectLine(String mainLine) {
		String query = "SELECT * FROM mvc_lol_tbl WHERE mainLine like ?";
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%" + mainLine + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LOLDTO dto = new LOLDTO();
				dto.setChampId(rs.getInt("champId"));
				dto.setChampName(rs.getString("champName"));
				dto.setqSkill(rs.getString("qSkill"));
				dto.setwSkill(rs.getString("wSkill"));
				dto.seteSkill(rs.getString("eSkill"));
				dto.setrSkill(rs.getString("rSkill"));
				dto.setMainLine(rs.getString("mainLine"));
				dto.setSubLine(rs.getString("subLine"));
				dto.setWinPc(rs.getDouble("winPc"));
				list.add(dto);
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
		return list;
	}

	@Override
	public List<LOLDTO> daoAllChamp() {
		String query = "SELECT * FROM mvc_lol_tbl ORDER BY champId asc";
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LOLDTO dto = new LOLDTO();
				dto.setChampId(rs.getInt("champId"));
				dto.setChampName(rs.getString("champName"));
				dto.setqSkill(rs.getString("qSkill"));
				dto.setwSkill(rs.getString("wSkill"));
				dto.seteSkill(rs.getString("eSkill"));
				dto.setrSkill(rs.getString("rSkill"));
				dto.setMainLine(rs.getString("mainLine"));
				dto.setSubLine(rs.getString("subLine"));
				dto.setWinPc(rs.getDouble("winPc"));
				list.add(dto);
			}
		}catch(SQLException e) {
			
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public int daoAddChamp(LOLDTO dto) {
		String query = "INSERT INTO mvc_lol_tbl (champId, champName, qSkill, wSkill, eSkill, rSkill, mainLine, subLine, winPc)"
				+ " VALUES((SELECT nvl(max(champId) + 1, 1) FROM mvc_lol_tbl), ?, ?, ?, ?, ?, ?, ?, ?)";
		int success = 0;
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt= conn.prepareStatement(query);
			pstmt.setString(1,dto.getChampName());
			pstmt.setString(2, dto.getqSkill());
			pstmt.setString(3, dto.getwSkill());
			pstmt.setString(4, dto.geteSkill());
			pstmt.setString(5, dto.getrSkill());
			pstmt.setString(6, dto.getMainLine());
			pstmt.setString(7, dto.getSubLine());
			pstmt.setDouble(8, dto.getWinPc());
			
			success = pstmt.executeUpdate();
			
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
		return success;
	}

	@Override
	public int daoUpdateChamp(int champId, LOLDTO dto) {
		String query = "UPDATE mvc_lol_tbl SET champName = ?, qSkill =?, wSkill =?, eSkill =?, rSkill=?,"
				+ "mainLine = ?, subLine=?, winPc = ? WHERE champId = ?";
		int success = 0;
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, dto.getChampName());
			pstmt.setString(2, dto.getqSkill());
			pstmt.setString(3, dto.getwSkill());
			pstmt.setString(4, dto.geteSkill());
			pstmt.setString(5, dto.getrSkill());
			pstmt.setString(6, dto.getMainLine());
			pstmt.setString(7, dto.getSubLine());
			pstmt.setDouble(8, dto.getWinPc());
			pstmt.setInt(9, champId);
			success = pstmt.executeUpdate();
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
		return success;
	}

	@Override
	public int daoDeleteChamp(int champId) {
		String query = "DELETE FROM mvc_lol_tbl WHERE champId = ?";
		int success = 0;
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, champId);
			success = pstmt.executeUpdate();
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
		return success;
	}

	@Override
	public List<LOLDTO> daoMetaChamp() {
		String query = "SELECT * FROM (SELECT * FROM mvc_lol_tbl ORDER BY winPc DESC) WHERE ROWNUM <= 3";
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LOLDTO dto = new LOLDTO();
				dto.setChampId(rs.getInt("champId"));
				dto.setChampName(rs.getString("champName"));
				dto.setqSkill(rs.getString("qSkill"));
				dto.setwSkill(rs.getString("wSkill"));
				dto.seteSkill(rs.getString("eSkill"));
				dto.setrSkill(rs.getString("rSkill"));
				dto.setMainLine(rs.getString("mainLine"));
				dto.setSubLine(rs.getString("subLine"));
				dto.setWinPc(rs.getDouble("winPc"));
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally{
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}

	@Override
	public List<LOLDTO> daoCompareChamp(String champName, String champName2) {
		String query = "SELECT * FROM mvc_lol_tbl WHERE champName like ? OR champName like ?";
		List<LOLDTO> list = new ArrayList<LOLDTO>();
		try {
			conn = DriverManager.getConnection(dbUrl, dbID, dbPassword);
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+champName+"%");
			pstmt.setString(2, "%" + champName2+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LOLDTO dto = new LOLDTO();
				dto.setChampName(rs.getString("champName"));
				dto.setqSkill(rs.getString("qSkill"));
				dto.setwSkill(rs.getString("wSkill"));
				dto.seteSkill(rs.getString("eSkill"));
				dto.setrSkill(rs.getString("rSkill"));
				dto.setWinPc(rs.getDouble("winPc"));
				
				list.add(dto);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
		
	}

}
