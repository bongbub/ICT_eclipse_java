package jdbc.mvc.view;

import jdbc.mvc.dto.BookDTO;

/*
 * 뷰 - 결과화면
 * 		Book에 정보 출력, Book 에러메세지, Book 결과 조회
 */

public class BookView {

	
	// 에러메세지
	public void bookErrorMsg(String msg) {
		switch(msg) {
		case "insert" :
			System.out.println(" -- 도서 추가 실패 -- ");
			break;
		case "update" : 
			System.out.println(" -- 도서 수정 실패 -- ");
			break;
		case "delete" : 
			System.out.println(" -- 도서 삭제 실패 -- ");
			break;
		case "select" : 
			System.out.println(" -- 도서 조회 실패 -- ");
			break;
		default : 
			System.out.println("ERROR - bookErrorMsg() ");
		}
	}
	
	// 전체 도서목록
	public void bookListAll() {
		// 방법1. 향상된 for문 조회
		
		// 방법2. Iterator 조회
	}
	
	// 1건 데이터 조회
	public void bookSelect(BookDTO dto) {
		System.out.println("도서ID : " + dto.getBookId());
		System.out.println("도서제목 : " + dto.getTitle());
		System.out.println("도서저자 : " + dto.getAuthor());
		System.out.println("도서출판사 : " + dto.getPublisher());
		System.out.println("도서가격 : " + dto.getPrice());
	}
	
	
	// 
	
}
