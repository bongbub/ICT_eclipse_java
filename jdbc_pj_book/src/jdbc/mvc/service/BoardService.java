package jdbc.mvc.service;

import java.util.List;

import jdbc.mvc.dto.BoardDTO;

public interface BoardService {
	
	public int boardInsert(BoardDTO dto);
	
	
	public int boardUpdate(int boardNo, BoardDTO dto);
	
	public int boardDelete(int boardNo);
	
	public BoardDTO boardSelectById(int boardNo);
	
	public List<BoardDTO> boardSelectByTitle(String boardTitle);
	
	public List<BoardDTO> boardSelectAll();

}