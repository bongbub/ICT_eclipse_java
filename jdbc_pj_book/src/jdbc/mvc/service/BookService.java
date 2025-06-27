package jdbc.mvc.service;

import java.util.List;

import jdbc.mvc.dto.BookDTO;

public interface BookService {
	
	
	// 1. 도서 추가
	public int bookInsert(BookDTO dto) ;
	
	// 2. 도서 수정
	public int bookUpdate(int bookid, BookDTO dto);
	
	
	// 3. 도서 삭제
	public int bookDelete(int bookId);
	
	
	// 4. 도서아이디 조회
	public BookDTO bookSelectById(int bookId);
	
	
	// 5. 도서타이틀 조회
	public BookDTO bookSelectByTitle(String title);
	
	// 6. 전체목록 조회
	public List<BookDTO> bookSelectAll();
	// 받아온 정보를 하나하나의 DTO에 담고,
	// 각각의 DTO를 list에 담는다
}