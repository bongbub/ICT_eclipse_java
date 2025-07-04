package jdbc.mvc.controller;

import java.util.List;

import jdbc.mvc.dto.BoardDTO;
import jdbc.mvc.service.BoardServiceImpl;
import jdbc.mvc.view.View;

public class BoardController {
	
	// 컨트롤러 클래스
	
	
	// BoardServiceImpl
	BoardServiceImpl service = new BoardServiceImpl();
	
	View view = new View();
	
	// 1. 게시글 추가
	public void boardAdd(BoardDTO dto) {
		int anum = service.boardInsert(dto);
		if(anum>0) {
			System.out.println("추가성공");
		}
		
	}
	
	
	// 2. 게시글 수정
	public void boardEdit(int boardNo, BoardDTO dto) {
		int anum = service.boardUpdate(boardNo, dto);
		if(anum>0) {
			System.out.println("수정성공");
		}
	}
	
	
	// 3. 게시글 삭제
	public void boardDelete(int boardNo) {
		int anum=service.boardDelete(boardNo);
		if(anum>0) {
			System.out.println("삭제성공");
		}
		else {
			
		}
	}
	
	
	// 4. 글번호 검색
	public void boardSelectId(int boardNo) {
		BoardDTO dto = service.boardSelectById(boardNo);
		if(boardNo == dto.getBoardNo()) {
			System.out.println("조회결과");
			view.boardSelect(dto);
		}else {
			view.boardErrorMsg("select");
		}
	}
	
	// 5. 글제목 검색
	public void boardSelectTitle(String boardTitle) {
		List<BoardDTO> list = service.boardSelectByTitle(boardTitle);
		
		if(!list.isEmpty()) {
			view.boardListAll(list);
		}
		else {
			view.boardErrorMsg("select");
		}
	}
	
	
	// 6. 전체글 목록 보기
	public void boardSelectAll() {
		List<BoardDTO> list = service.boardSelectAll();
		if(!list.isEmpty()) {
			view.boardListAll(list);
		}
		else {
			view.boardErrorMsg("select");
		}
	}
	

}