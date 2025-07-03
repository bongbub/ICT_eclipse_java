package jdbc.mvc.service;

import jdbc.mvc.dao.BoardDAOImpl;

public class BoardServiceImpl implements BoardService {

	
	// BoardDAOImpl
	BoardDAOImpl dao = new BoardDAOImpl();
	
	@Override
	public int boardInsert() {
		//int anum = dao.boardInsertDAO();
		return 0;
	}

	@Override
	public int boardUpdate() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardDelete() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardSelectById() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardSelectByTitle() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int boardSelectAll() {
		// TODO Auto-generated method stub
		return 0;
	}

}
