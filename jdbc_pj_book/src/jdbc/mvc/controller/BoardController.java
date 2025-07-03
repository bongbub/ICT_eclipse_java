package jdbc.mvc.controller;

import jdbc.mvc.dto.BoardDTO;
import jdbc.mvc.service.BoardServiceImpl;

public class BoardController {
	
	// 컨트롤러 클래스
	
	
	// BoardServiceImpl
	BoardServiceImpl service = new BoardServiceImpl();
	
	// 1. 게시글 추가
	public int boardAdd(BoardDTO dto) {
		int anum = service.boardInsert();
		
		return anum;
	}
	
	
	// 2. 게시글 수정
	public void boardEdit() {
		
	}
	
	
	// 3. 게시글 삭제
	public void boardDelete() {
		
	}
	
	
	// 4. 글번호 검색
	public void boardSelectId() {
		
	}
	
	
	// 5. 글제목 검색
	public void boardSelectTitle() {
		
	}
	
	
	// 6. 전체글 목록 보기
	public void boardSelectAll() {
		
	}
	

}
