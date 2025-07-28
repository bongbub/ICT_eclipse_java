package pj.mvc.jsp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.do")
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CustomerController() {
        super();
    }

    // 1단계 - 웹브라우저가 전송한 HTTP 전송을 받음
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		action(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doGet(request, response);
	}

	public void action(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// 2단계 - 클라이언트 요청 분석
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();				// 		/re_jsp_pj_ict05/*.do
		String contextPath = request.getContextPath();		// 		/re_jsp_pj_ict_05
		String url = uri.substring(contextPath.length());	//						/*.do
	}
}
