package pj.mvc.jsp.service;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.dao.BoardDAO;
import pj.mvc.jsp.dao.BoardDAOImpl;
import pj.mvc.jsp.dto.BoardDTO;
import pj.mvc.jsp.page.Paging;

public class BoardServiceImpl implements BoardService{
	
	// 게시글 목록
	@Override
	public void boardListAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println(" @@@  BoardServiceImpl   -   boardListAction()  @@@");
		
		// 3단계 - 화면에서 입력받은 값 가져오기
		String pageNum = request.getParameter("pageNum");
		
		// 4단계 - 싱글톤 방식으로 DAO 객체 생성 다형성 적용
		BoardDAO dao = BoardDAOImpl.getInstance();
		
		// 5-1단계 - 전체 게시글 갯수 카운트
		Paging paging = new Paging(pageNum);
		int total = dao.boardCnt();
		System.out.println("total :" + total);
		
		paging.setTotalCount(total);
		
		
		// 5단계 - 게시글 목록 조회
		int start = paging.getStartRow();
		int end = paging.getEndRow();
		
		
		List<BoardDTO> list = dao.boardList(start, end);
		System.out.println("list : "+ list);
		
		// 6단계 - jsp로 처리 결과 전달
		request.setAttribute("list", list);
		request.setAttribute("paging", paging);
	}

	// 게시글 상세 처리
	@Override
	public void boardDetailAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	// 게시글 수정삭제 버튼 클릭 시 - > 비밀번호 인증 처리
	@Override
	public int password_cheAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		return 0;
	}

	// 게시글 수정 처리
	@Override
	public void boardUpdateAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	// 게시글 삭제 처리
	@Override
	public void boardDeleteAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	// 게시글 작성 처리
	@Override
	public void boardInsertAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	// 댓글 작성 처리
	@Override
	public void commentAddAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

	// 댓글 목록 처리
	@Override
	public void commentListAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
	}

}
