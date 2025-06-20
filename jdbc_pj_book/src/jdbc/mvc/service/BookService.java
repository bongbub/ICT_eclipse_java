package jdbc.mvc.service;

import jdbc.mvc.dto.BookDTO;

public interface BookService {
	
	
	// 1. 도서 추가
	public int bookInsert(BookDTO dto) ;
	
	// 2. 도서 수정
	public int bookUpdate(BookDTO dto);
	
	
	// 3. 도서 삭제
	public int bookDelete(int bookId);
	
	
	// 4. 도서아이디 조회
	
	
	
	// 5. 도서목록 조회
	
	
	// 6. 전체목록 조회
	

}
