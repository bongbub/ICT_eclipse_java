package pj.mvc.jsp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pj.mvc.jsp.service.CustomerServiceImpl;

@WebServlet("*.do")	// 진입점
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerController() {
        super();
    }
    
    
    // 1단계. 웹브라우저가 전송한 HTTP 전송을 받음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
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
		
		
		// url => http://localhost/jsp_pj_ict05/*.do
		// uri => 				  /jsp_pj_ict05/*.do
		// contextPath => 		  /jsp_pj_ict05
		// 최종 url => 						   /*.do
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();		// 플젝명
		String url = uri.substring(contextPath.length());	// uri.substring(시작위치);
		String viewPage = "";		// 이동할 JSP 페이지
		
		// ServiceImpl
		CustomerServiceImpl service = new CustomerServiceImpl();
		
		
		// 첫 페이지
		if(url.equals("/main.do") || (url.equals("/*.do"))) {	// main.do로 올때도, *.do로 올때도 여길 탄다
			System.out.println(" <<< url => /main.do >>> ");
			viewPage = "/common/main.jsp";
		}
		// [회원가입]
		// 회원가입 페이지로 이동
		else if(url.equals("/join.do")) {
			
			viewPage = "/customer/join/join.jsp";
		}
		// 회원가입 버튼 클릭
		else if(url.equals("/joinAction.do")) {
			System.out.println(" <<< url ==> /joinAction.do >>> ");
			
			viewPage = "/customer/join/joinAction.jsp";
			
			service.signInAction(request, response);
		}
		// [로그인]
		else if(url.equals("/login.do")){
			viewPage = "";
		}
		
		
		// RequestDispatcher :서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 클래스
		// 	클라이언트는 이동을 모름(URL이 바뀌지 않음)
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);  // 페이지 이동을 도움
		dispatcher.forward(request, response);		// 클라의 요청을 지정한 viewPage로 포워딩(전달)
													// 클라는 직접요청한 것이 아니기 때문에 URL 변경 없음
													// 현재 서블릿의 request, response 객체 그대로 전달. 
		
	}

}
