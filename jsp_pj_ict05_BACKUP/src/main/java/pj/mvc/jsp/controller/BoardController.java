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
		if(url.equals("/board_detailAction.bc")) {
			System.out.println("  <<< url  ==>  /board_detail.bc  >>>");
			
			service.boardDetailAction(request, response);
			viewPage="/admin/csCenter/board_detailAction.jsp";
		}
		
		
		// [게시글 수정삭제 버튼] 클릭 시 - > 비밀번호 인증 처리
		if(url.equals("/password_chkAction.bc")){
			System.out.println("  <<< url  ==>  /password_chkAction.bc  >>>");
			
			// int로 돌려받는 이유 : 컨트롤러에서 핸들링하기 위해
			int result = service.password_chkAction(request, response);
			
			// 문제가 없으면 수정/삭제 상세페이지로 이동
			if(result != 0) {
				viewPage = "/admin/csCenter/board_edit.jsp";
			}
			// 문제가 있으면(인증실패) =>  페이지 이동X 
			else {
				System.out.println("----비밀번호 인증 실패-----");
				// 현재 내 페이지로 이동
				int num = Integer.parseInt(request.getParameter("hidden_b_num")); // b_num들고오기
				
				// 페이지로 이동할 때 글번호와 에러메세지 들고가기
				viewPage = request.getContextPath()+"/board_detailAction.bc?b_num="+num+"&message=error";
				response.sendRedirect(viewPage);		// forward 말고 sendRedirect로 보냄
				return;				// 아래의 forward 를 타지 않기 위해 
			}
			
		}
		
		
		// [게시글 수정] 처리
		if(url.equals("/board_updateAction.bc")){
			System.out.println("  <<< url  ==>  /board_updateAction.bc  >>>");
			
			int num = service.boardUpdateAction(request, response);
			viewPage = request.getContextPath()+"/board_detailAction.bc?b_num="+ num;
			response.sendRedirect(viewPage);
			return;
		}
		
		// [게시글 삭제] 처리
		if(url.equals("/board_deleteAction.bc")) {
			System.out.println("  <<< url  ==>  /board_deleteAction.bc  >>>");
			
			service.boardDeleteAction(request, response);
			viewPage = request.getContextPath()+"/board_list.bc";
			response.sendRedirect(viewPage);
			return;
		}
		
		// [게시글 작성] 화면
		if(url.equals("/board_insert.bc")) {
			System.out.println("  <<< url  ==>  /board_insert.bc  >>>");
			
			viewPage = "/admin/csCenter/board_insert.jsp";
		}
		
		
		// [게시글 작성] 처리 
		if(url.equals("/board_insertAction.bc")) {
			System.out.println("  <<< url  ==>  /board_insertAction.bc  >>>");
			
			int b_num = service.boardInsertAction(request, response);  
			viewPage = request.getContextPath()+"/board_detailAction.bc?b_num="+b_num;
			
			response.sendRedirect(viewPage);
			return;
		}
		
		
		
		// [댓글 작성] 처리(4)
		if(url.equals("/comment_insert.bc")) {
			System.out.println("  <<< url  ==>  /comment_insert.bc  >>>");
			
			service.commentAddAction(request, response);  // (5)
			
			// viewPage 필요 없음 ==> 전체적인 화면 이동x --> 아래 뿌려주는 jsp만 변경되므로
			// viewPage = "/admin/csCenter/comment_insert.jsp"로 이동안함
			// board_detailAction.jsp의 comment_add()로 복귀 => $.ajax의 콜백함수로 리턴
		}
		
		
		// [댓글 목록] 처리  (10)
		if(url.equals("/comment_list.bc")) {
			System.out.println("  <<< url  ==>  /comment_list.bc  >>>");
			
			service.commentListAction(request, response); 		// (11)
			viewPage = "admin/csCenter/comment_list.jsp";		//  (12) 결과페이지이며, $.ajax 콜백함수(success)의 result
			// board_detailAction.jsp의 comment_list()로 복귀 => $.ajax의 콜백함수로 리턴
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
