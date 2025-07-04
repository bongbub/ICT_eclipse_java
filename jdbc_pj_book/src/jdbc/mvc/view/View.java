package jdbc.mvc.view;


import java.util.Iterator;
import java.util.List;

import jdbc.mvc.dto.BoardDTO;
import jdbc.mvc.dto.BookDTO;

/*
 * 뷰 - 결과화면
 * 		Book에 정보 출력, Book 에러메세지, Book 결과 조회
 */

public class View {

	
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
			System.out.println(" -- error : 도서 데이터가 존재하지 않습니다. -- ");
			break;
		default : 
			System.out.println("ERROR - bookErrorMsg() ");
		}
	}
	public void boardErrorMsg(String msg) {
		switch(msg) {
		case "insert" :
			System.out.println(" -- 글 작성 실패 -- ");
			break;
		case "update" : 
			System.out.println(" -- 글 수정 실패 -- ");
			break;
		case "delete" : 
			System.out.println(" -- 글 삭제 실패 -- ");
			break;
		case "select" : 
			System.out.println(" -- error : 글 데이터가 존재하지 않습니다. -- ");
			break;
		default : 
			System.out.println("ERROR - boardErrorMsg() ");
		}
	}
	
	// 전체 도서목록
	public void bookListAll(List<BookDTO> list) {
		// 방법1. 향상된 for문 조회
		for(BookDTO dto :list) {
			System.out.println("도서ID : " + dto.getBookId());
			System.out.println("도서제목 : " + dto.getTitle());
			System.out.println("도서저자 : " + dto.getAuthor());
			System.out.println("도서출판사 : " + dto.getPublisher());
			System.out.println("도서가격 : " + dto.getPrice());
			System.out.println("출판일 : " + dto.getPubdate());
//			System.out.println(dto.toString());
			System.out.println("");
		}
		
		// 방법2. Iterator 조회
		Iterator<BookDTO> ite = list.iterator();
		BookDTO dto = new BookDTO();
		while(ite.hasNext()) {		// 값이 존재하는 동안 반복
			dto = ite.next();
			System.out.println("도서ID : " + dto.getBookId());
			System.out.println("도서제목 : " + dto.getTitle());
			System.out.println("도서저자 : " + dto.getAuthor());
			System.out.println("도서출판사 : " + dto.getPublisher());
			System.out.println("도서가격 : " + dto.getPrice());
			System.out.println("출판일 : " + dto.getPubdate());
			System.out.println();
		}
	}
	
	// 1건 데이터 조회
	public void bookSelect(BookDTO dto) {
		System.out.println("도서ID : " + dto.getBookId());
		System.out.println("도서제목 : " + dto.getTitle());
		System.out.println("도서저자 : " + dto.getAuthor());
		System.out.println("도서출판사 : " + dto.getPublisher());
		System.out.println("도서가격 : " + dto.getPrice());
	}
	
	public void boardSelect(BoardDTO dto) {
		System.out.println("글번호 : "+dto.getBoardNo());
		System.out.println("글제목 : "+dto.getBoardTitle());
		System.out.println("글내용 : "+ dto.getBoardContent());
		System.out.println("글쓴이 : "+dto.getBoardId());
		System.out.println("작성일 : "+dto.getBoardRegDate());
	}
	public void boardListAll(List<BoardDTO> list) {
		// 방법1. 향상된 for문 조회
		for(BoardDTO dto :list) {
			System.out.println("글번호 : "+dto.getBoardNo());
			System.out.println("글제목 : "+dto.getBoardTitle());
			System.out.println("글내용 : "+ dto.getBoardContent());
			System.out.println("글쓴이 : "+dto.getBoardId());
			System.out.println("작성일 : "+dto.getBoardRegDate());
			System.out.println("");
		}
		
		// 방법2. Iterator 조회
		Iterator<BoardDTO> ite = list.iterator();
		BoardDTO dto = new BoardDTO();
		while(ite.hasNext()) {		// 값이 존재하는 동안 반복
			dto = ite.next();
			System.out.println("글번호 : "+dto.getBoardNo());
			System.out.println("글제목 : "+dto.getBoardTitle());
			System.out.println("글내용 : "+ dto.getBoardContent());
			System.out.println("글쓴이 : "+dto.getBoardId());
			System.out.println("작성일 : "+dto.getBoardRegDate());
			System.out.println();
		}
	}
	
	
	// 
	
}