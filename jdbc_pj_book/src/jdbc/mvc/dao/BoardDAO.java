package jdbc.mvc.dao;

import java.util.List;

import jdbc.mvc.dto.BoardDTO;

public interface BoardDAO {
	
	public int boardInsertDAO(BoardDTO dto);
	
	public int boardUpdateDAO(int boardNo, BoardDTO dto);
	
	public int boardDeleteDAO(int boardNo);
	
	public BoardDTO boardSelectByIdDAO(int boardNo);
	
	public List<BoardDTO> boardSelectByTitleDAO(String boardTitle);
	
	public List<BoardDTO> boardSelectAllDAO();

}