package jdbc.mvc.service;

import java.util.List;

import jdbc.mvc.dao.BoardDAOImpl;
import jdbc.mvc.dto.BoardDTO;

public class BoardServiceImpl implements BoardService {

	
	// BoardDAOImpl
	BoardDAOImpl dao = BoardDAOImpl.getInstance();
	
	@Override
	public int boardInsert(BoardDTO dto) {
		int anum = dao.boardInsertDAO(dto);
		return anum;
	}

	@Override
	public int boardUpdate(int boardNo, BoardDTO dto) {
		int anum = dao.boardUpdateDAO(boardNo, dto);
		
		return anum;
	}

	@Override
	public int boardDelete(int boardNo) {
		int anum = dao.boardDeleteDAO(boardNo);
		return anum;
	}

	@Override
	public BoardDTO boardSelectById(int boardNo) {
		BoardDTO dto = dao.boardSelectByIdDAO(boardNo);
		return dto;
	}

	@Override
	public List<BoardDTO> boardSelectByTitle(String boardTitle) {
		List<BoardDTO> list = dao.boardSelectByTitleDAO(boardTitle);
		return list;
	}

	@Override
	public List<BoardDTO> boardSelectAll() {
		List<BoardDTO> list = dao.boardSelectAllDAO();
		return list;
	}

}