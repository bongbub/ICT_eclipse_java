package jdbc.mvc.controller;


import java.util.List;

import jdbc.mvc.dto.BookDTO;
import jdbc.mvc.service.BookServiceImpl;
import jdbc.mvc.view.BookView;

/*
 *   작성일 : 2025.6.18
 *   작성자 : 조현빈
 *   설명   : 컨트롤러 클래스.
 *   		고객의 요구사항(비즈니스 로직)에 대한 흐름제어를 담당
 *   		Book 정보에 대한 추가, 수정, 삭제, 조회 
 *   		, 도서아이디조회, 도서목록조회, 전체목록조회 메뉴의 흐름제어
 *   
 *   데이터 흐름 : BookController -> BookServiceImpl -> BookDAOImpl
 */


public class BookController {
	
	BookServiceImpl service = new BookServiceImpl();
	BookView bv = new BookView();
	
	
	// 1. 도서 추가
	public void bookAdd(BookDTO dto) {
		System.out.println(" -- bookInsert() --");
		System.out.println(dto.toString());
		
		int biNum = service.bookInsert(dto);  // BookServiceImpl의 return 값이 1인지 0인지
		if(biNum > 0) {  // 0보다 크면, 즉 1이면
			System.out.println(" == 추가성공 ==");
		}
		else {
			bv.bookErrorMsg("insert");
		}
	}
	
	// 2. 도서 수정(내가한방법)
//	public void bookedit(BookDTO dto) {
//		System.out.println(" -- bookedit -- ");
//		System.out.println(dto.toString());
//		
//		int biNum = service.bookUpdate(dto);
//		if(biNum > 0) {  // 0보다 크면, 즉 1이면
//			System.out.println(" == 수정성공 ==");
//		}
//		else {
//			bv.bookErrorMsg("update");
//		}
//	}
	// 2. 도서 수정	(쌤이한방법)
	public void bookedit2(int bookid, BookDTO dto) {
		System.out.println(" -- bookedit -- ");
		System.out.println(dto.toString());
		
		int biNum = service.bookUpdate(bookid, dto);
		if(biNum > 0) {  // 0보다 크면, 즉 1이면
			System.out.println(" == 수정성공 ==");
		}
		else {
			bv.bookErrorMsg("update");
		}
	}
	
	
	// 3. 도서 삭제
	public void bookDelete(int bookid) {
		int biNum = service.bookDelete(bookid);
		//System.out.println(biNum);
		if(biNum > 0) {
			System.out.println( " == 삭제성공 == ");
		}
		else {
			bv.bookErrorMsg("delete");
		}
	}
	
	
	// 4. 도서아이디 조회
	public void bookSelectId(int bookid) {
		System.out.println("<<< bookSelectId() >>>");
		BookDTO dto = service.bookSelectById(bookid);
		if(bookid == dto.getBookId()) {
			System.out.println("-- 조회결과 --");
			bv.bookSelect(dto);
		}
		else {
			bv.bookErrorMsg("select");
		}
	}
	
	
	// 5. 도서목록타이틀 조회
	public void bookSelectTitle(String bookTitle) {
		System.out.println("<<< bookSelectTitle() >>>");
		
		
		
	}
	
	
	// 6. 전체목록 조회
	public void bookSelectAll() {
		System.out.println("<<< bookSelectAll() >>>");
		
		List<BookDTO> list = service.bookSelectAll();
		
		if(!list.isEmpty()) {
			bv.bookListAll(list);
		}
		else {
			bv.bookErrorMsg("select");
		}
	}
	

}
