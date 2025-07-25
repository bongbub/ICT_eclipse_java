package com.jsp.ajax.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JQueryAjaxController
 */
@WebServlet("*.jq")
public class JQueryAjaxController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JQueryAjaxController() {
        super();
    }

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
		// 2단계) 클라이언트 요청 분석
		
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = uri.substring(contextPath.length());
		String viewPage = "";
		
		
		// 첫 페이지
		// 1. dataType : 'text'인 경우
		if(url.equals("/basic1.jq") || url.equals("/*.jq")) {
			System.out.println(" <<< AjaxController - basic1.jq >>>");
			
			viewPage = "jquery/basic1.jsp";
		}
		
		
		// 4. 
		else if(url.equals("/basic1_next.jq")) {
			System.out.println(" <<< AjaxController - basic1_next.jq >>>");
			
			// 5.
			viewPage = "jquery/basic1_next.jsp";		// 결과를 callback 함수에 result로 전달
		}
		
		
		// 2. dataType : 'param'인 경우 -------------------------------------------------
		else if(url.equals("/basic2.jq")) {
			System.out.println(" <<< AjaxController - basic2.jq >>>");
			
			viewPage = "jquery/basic2.jsp";		// 결과를 callback 함수에 result로 전달
		}
		else if(url.equals("/basic2_next.jq")) {
			System.out.println(" <<< AjaxController - basic2_next.jq >>>");
			
			// 5.
			viewPage = "jquery/basic2_next.jsp";		// 결과를 callback 함수에 result로 전달
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
		
	}
}
