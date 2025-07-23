package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.BoardServiceImpl;

@WebServlet("*.bc")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();
    }
    
    // 1단계. 웹브라우저가 전송한 HTTP 전송을 받음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println("🚀 doGet() 진입함");
		action(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void action(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		// 2단계. 클라이언트 요청 분석
		// 한글 안깨지게 처리
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = uri.substring(contextPath.length()); // contextPath(플젝명)부터 시작해서 자르기
		String viewPage = "";
		BoardServiceImpl service = new BoardServiceImpl();
		
		
		// ---------------------------------------------------
		
		
		// [게시글 목록]
		if(url.equals("/board_list.bc")) {
			System.out.println("  <<< url  ==>  /board_list.bc  >>>");
			
			service.boardListAction(request, response);
			viewPage ="/admin/csCenter/board_list.jsp";
		}
		
		// [게시글 상세] 화면
		
		
		// [게시글 수정삭제 버튼] 클릭 시 - > 비밀번호 인증 처리
		
		
		// [게시글 수정] 처리
		
		
		// [게시글 삭제] 처리
		
		
		// [게시글 작성] 화면
		
		
		// [게시글 작성] 처리
		
		
		// [댓글 작성] 처리
		
		
		// [댓글 목록] 처리
		
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
