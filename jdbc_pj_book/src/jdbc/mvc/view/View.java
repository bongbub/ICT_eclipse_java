package jdbc.mvc.view;


import java.util.Iterator;
import java.util.List;

import jdbc.mvc.dto.BoardDTO;
import jdbc.mvc.dto.BookDTO;
import jdbc.mvc.dto.LOLDTO;

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
	public void lolErrorMsg(String msg) {
		switch(msg) {
		case "insert" :
			System.out.println(" -- 챔피언 추가 실패 -- ");
			break;
		case "update" : 
			System.out.println(" -- 챔피언 정보 수정 실패 -- ");
			break;
		case "delete" : 
			System.out.println(" -- 챔피언 삭제 실패 -- ");
			break;
		case "select" : 
			System.out.println(" -- error : 챔피언 데이터가 존재하지 않습니다. -- ");
			break;
		default : 
			System.out.println("ERROR -  lolErrorMsg() ");
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
	
	//-------------------------------------------------
	public void lolListAll(List<LOLDTO> list) {
		for(LOLDTO dto : list) {
			System.out.println("⊳ " + dto.getChampId());
			System.out.println("⊳ " + dto.getChampName());
			System.out.println("⊳ Q :"+ dto.getqSkill());
			System.out.println("⊳ W :"+ dto.getwSkill());
			System.out.println("⊳ E :"+ dto.geteSkill());
			System.out.println("⊳ R :"+ dto.getrSkill());
			System.out.println("⊳ 주라인 : " + dto.getMainLine());
			System.out.println("⊳ 서브라인 : " + dto.getSubLine());
			System.out.println("⊳ 승률 : " + dto.getWinPc() +"%");
			System.out.println(" - - - - - - - - - - - - - - - -");
		}
	}
	public void comparechamp(List<LOLDTO> list) {
		System.out.println("챔피언비교");
		for(LOLDTO dto : list) {
			System.out.println("⊳ ------------------------------");
			System.out.println("⊳ " + dto.getChampName());
			System.out.println("⊳ Q :"+ dto.getqSkill());
			System.out.println("⊳ W :"+ dto.getwSkill());
			System.out.println("⊳ E :"+ dto.geteSkill());
			System.out.println("⊳ R :"+ dto.getrSkill());
			System.out.println("⊳ 승률 : " + dto.getWinPc() +"%");
		}
		if(list.size() == 2) {
			LOLDTO ch1 = list.get(0);
			LOLDTO ch2 = list.get(1);
			
			double win1 = ch1.getWinPc();
			double win2 = ch2.getWinPc();
			System.out.println("------승률 비교 ------");
			if(win1>win2) {
				System.out.println(" ==================================      ");
				System.out.println("현재 승률이 더 높은 챔피언은 ▶▶["+ ch1.getChampName()+"]◀◀ 입니다!");
				System.out.println(" ==================================      ");
			}
			else if(win1<win2) {
				System.out.println(" ==================================      ");
				System.out.println("현재 승률이 더 높은 챔피언은 ▶▶["+ ch2.getChampName()+"]◀◀ 입니다!");
				System.out.println(" ==================================      ");
			}
		}else {
			System.out.println("-- error : 챔피언 수 오류 --");
		}
	}
}