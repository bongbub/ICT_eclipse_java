package jdbc.mvc.service;

import jdbc.mvc.dto.BookDTO;

public class BookServiceImpl implements BookService{

	@Override
	public int bookInsert(BookDTO dto) {
		System.out.println("BookServiceImpl - bookInsert()");
		return 0;
	}

	@Override
	public int bookUpdate(BookDTO dto) {
		System.out.println("BookServiceImpl - bookUpdate()");
		return 0;
	}

	@Override
	public int bookDelete(int bookId) {
		System.out.println("BookServiceImpl - bookDelete()");
		return 0;
	}
	
	

}
