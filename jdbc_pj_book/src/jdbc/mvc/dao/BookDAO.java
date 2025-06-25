package jdbc.mvc.dao;

import jdbc.mvc.dto.BookDTO;

public interface BookDAO {
	
	
	// 1. 도서추가
	public int bbookInsert(BookDTO dto);
	// 1번이면 성공, 0번이면 실패 -> 1인지 0인지 이므로 int 타입
	
	
	// 2. 도서수정
	public int bbookUpdate(int bookid, BookDTO dto); // 수정한 값들을 담아야하므로 dto가져옴
	
	
	// 3. 도서삭제
	// bookID가 같을 때만 삭제해야하므로 매개변수로 가져와야함
	public int bbookDelete(int bookId);
	
	// 4. 도서아이디 조회
	public BookDTO sselectBookById(int bookId);
	
	// 5. 도서타이틀 조회
	

	// 6. 전체목록 조회
	
	
	
	
}
