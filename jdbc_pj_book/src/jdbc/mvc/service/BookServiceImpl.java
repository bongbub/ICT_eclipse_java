package jdbc.mvc.service;


import java.util.List;

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
	public int bookUpdate(int bookid, BookDTO dto) {
		System.out.println("BookServiceImpl - bookUpdate()");
		// dao에서 처리받은 값을 다시 servieceimpl을 통해 전달
		BookDAOImpl dao = new BookDAOImpl();
		int updateCnt = dao.bbookUpdate(bookid, dto);
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

	// 도서아이디로 조회
	@Override
	public BookDTO bookSelectById(int bookId) {
		System.out.println("BookServiceImpl - bookSelectById() ");
		
		// dao 호출
		BookDAOImpl dao = new BookDAOImpl();
		BookDTO book = dao.sselectBookById(bookId);
		
		return book;
	}

	// 도서타이틀로 조회
	@Override
	public BookDTO bookSelectByTitle(String title) {
		System.out.println(" <<< ServiceImpl - bookSelectByTitle >>>");
		
		BookDAOImpl dao = new BookDAOImpl();
		
		
		return null;
	}

	// 전체도서목록 조회
	@Override
	public List<BookDTO> bookSelectAll() {
		System.out.println(" <<< ServiceImpl - bookSelectAll() >>> ");
		BookDAOImpl dao = new BookDAOImpl();
		List<BookDTO> list = dao.bbookSelectAll();
//		System.out.println("서비스임포"+list);
		
		
		return list;
	}
	
	

}
