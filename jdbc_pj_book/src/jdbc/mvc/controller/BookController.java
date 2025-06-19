package jdbc.mvc.controller;

import jdbc.mvc.dto.BookDTO;
import jdbc.mvc.service.BookServiceImpl;

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
	
	BookServiceImpl sevice = new BookServiceImpl();
	
	// 1. 도서 추가
	public void bookAdd(BookDTO dto) {
		System.out.println(" -- bookInsert() --");
		sevice.bookInsert(dto);
		System.out.println(dto.toString());
	}
	
	// 2. 도서 수정
	
	
	// 3. 도서 삭제
	
	
	// 4. 도서아이디 조회
	
	
	// 5. 도서목록 조회
	
	
	// 6. 전체목록 조회
	
	

}
