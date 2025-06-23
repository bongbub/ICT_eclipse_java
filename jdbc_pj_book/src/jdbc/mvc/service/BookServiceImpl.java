package jdbc.mvc.service;

import jdbc.mvc.dao.BookDAOImpl;
import jdbc.mvc.dto.BookDTO;

public class BookServiceImpl implements BookService{

	@Override
	public int bookInsert(BookDTO dto) {
		System.out.println("BookServiceImpl - bookInsert()");
		BookDAOImpl dao = new BookDAOImpl();
		int insertCnt = dao.bbookInsert(dto);
		
		return insertCnt;
	}

	@Override
	public int bookUpdate(BookDTO dto) {
		System.out.println("BookServiceImpl - bookUpdate()");
		// dao에서 처리받은 값을 다시 servieceimpl을 통해 전달
		BookDAOImpl dao = new BookDAOImpl();
		int updateCnt = dao.bbookUpdate(dto);
		System.out.println(updateCnt);
		return updateCnt;
	}

	@Override
	public int bookDelete(int bookId) {
		System.out.println("BookServiceImpl - bookDelete()");
		
		BookDAOImpl dao = new BookDAOImpl();
		int deleteCnt = dao.bbookDelete(bookId);
		//System.out.println("bbookDelete- deleteCnt"+ deleteCnt);
		return deleteCnt;
	}
	
	

}
