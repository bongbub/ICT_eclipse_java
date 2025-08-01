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
		
		
		// 첫 페이지 ------------------------------------------
		if(url.equals("/main.do")|| url.equals("/*.do")) {	// main.do로 올때도, *.do로 올때도 여길 탄다
			System.out.println(" <<< url => /main.do >>> ");
			viewPage = "/common/main.jsp";
		}
		
		// [회원가입] ------------------------------------------
		// 회원가입 페이지로 이동
		else if(url.equals("/join.do")) {
			
			viewPage = "/customer/join/join.jsp";
		}
		
		// id 중복확인 버튼 클릭 시
		else if(url.equals("/idConfirmAction.do")) {
			System.out.println("  >>> url => .idConfirmAction.do <<< ");
			// 서비스 호출
			service.idConfirmAction(request, response);
			viewPage = "/customer/join/idConfirmAction.jsp";
		}
		
		
		// 회원가입 버튼 클릭
		else if(url.equals("/joinAction.do")) {
			System.out.println(" <<< url ==> /joinAction.do >>> ");
			
			// 서비스 호출
			service.signInAction(request, response);
			viewPage = "/customer/join/joinAction.jsp";
		}
		
		
		// [로그인] ----------------------------------------------
		// 로그인 페이지로 이동
		else if(url.equals("/login.do")){
			System.out.println(" <<< url ==> /login.do >>> ");
			viewPage = "/customer/login/login.jsp";
		}
		
		// 로그인 처리 페이지
		else if(url.equals("/loginAction.do")) {
			System.out.println(" <<< url ==> /loginAction.do >>> ");
			service.loginAction(request, response);
			viewPage = "/customer/login/loginAction.jsp";
		}
		
		
		// 로그아웃 처리
		else if(url.equals("/logout.do")) {
			System.out.println(" <<< url ==> /logout.do >>> ");
			
			// 세션삭제 후 viewPage는 main으로
			request.getSession().invalidate();	// 세션삭제 명령어
			
			viewPage = "/common/main.jsp";
		}
		
		
		// [회원탈퇴] --------------------------------
		// 회원탈퇴 - 인증화면
		else if(url.equals("/deleteCustomer.do")) {
			System.out.println(" <<< url ==> /deleteCustomer.do >>> ");
			
			viewPage = "/customer/mypage/customerinfo/deleteCustomer.jsp";
		}
		
		// 회원탈퇴 처리
		else if(url.equals("/deleteCustomerAction.do")) {
			System.out.println(" <<< url ==> /deleteCustomerAction.do >>> ");
			
			service.deleteCustomerAction(request, response);
			viewPage = "/customer/mypage/customerinfo/deleteCustomerAction.jsp";
		}
		
		
		
		
		
		
		// [회원 수정] -----------------------------------------------------
		// 회원수정 - 인증화면
		else if(url.equals("/modifyCustomer.do")) {
			System.out.println(" <<< url ==> /modifyCustomer.do >>> ");
			
			viewPage = "/customer/mypage/customerinfo/modifyCustomer.jsp";
		}
		// 회원수정 - 상세페이지
		else if(url.equals("/modifyDetailAction.do")) {
			System.out.println(" <<< url ==> /modifyDetailAction.do >>> ");
			service.modifyDetailAction(request, response);
			viewPage = "/customer/mypage/customerinfo/modifyDetailAction.jsp";
			
		}
		
		// 회원수정 - 수정처리
		else if(url.equals("/modifyCustomerAction.do")) {
			System.out.println(" <<< url ==> /modifyCustomerAction.do >>> ");
			
			service.modifyCustomerAction(request, response);
			viewPage="/customer/mypage/customerinfo/modifyCustomerAction.jsp";
		}
		
		
		// RequestDispatcher :서블릿 또는 JSP 요청을 받은 후, 다른 컴포넌트로 요청을 위임하는 인터페이스
		// 	클라이언트는 이동을 모름(URL이 바뀌지 않음)
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);  // 페이지 이동을 도움
		dispatcher.forward(request, response);		// 클라의 요청을 지정한 viewPage로 포워딩(전달), 응답을 그 리소스에서 처리하게 함
													// 클라는 직접요청한 것이 아니기 때문에 URL 변경 없음
													// 현재 서블릿의 request, response 객체 그대로 전달. 
													// <-> sendRedirect()와 기능이 비슷하지만, url이 변경된다는 점, 
													// 클라이언트가 직접 요청한다는 점, req, res가 새로운 객체로 생성된다는 점이 다르다.													
	}

}
