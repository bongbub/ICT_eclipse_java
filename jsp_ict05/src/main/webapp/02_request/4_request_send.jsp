<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 나이 인증 (2p) </title>
</head>
<body>

	<!-- 
		//쿼리스트링 : http://localhost/jsp_ict05/02_request/4_request_send.jsp?user_age=30&user_name=%E3%85%81%E3%84%B4%E3%85%87%E3%84%B9&user_email=asd%40asd.asd
		// 																			      ( 정상적으로 인코딩된 UTF-8 문자열임      )		   (@아스키코드 %40)
		// 1. 이전 페이지에서 입력받은 나이, 이름, 이메일을 넘겨받는다.
		// 2. 나이가 20 이상이면 4_request_pass.jsp로 이동 (나이, 이름, 이메일도 같이 넘김)
		// 3. 나이가 20살 미만이면 4_request_ng.jsp 페이지로 이동 (나이, 이름, 이메일도 같이 넘김)
		// 4. 페이지 이동 방법 : submit 말고, response.sendRedirect("이동할 페이지 ? input명1=값1&input명2=값2&input명n=값n");  => get방식으로 parameter전달법
	
	 -->


	<%
		request.setCharacterEncoding("UTF-8");
		
	
		// 1. 이전 페이지에서 입력받은 나이, 이름, 이메일을 넘겨받는다.
		int iAge = Integer.parseInt(request.getParameter("user_age"));
		String strName = request.getParameter("user_name");
		String enname = URLEncoder.encode(strName, "UTF-8");
		String strEmail = request.getParameter("user_email");
/* 		String strName = URLEncoder.encode(request.getParameter("usr_name"), "UTF-8"); */

		
		
		//http://localhost/jsp_ict05/02_request/4_request_send.jsp?user_age=30&user_name=%E3%85%81%E3%84%B4%E3%85%87%E3%84%B9&user_email=asd%40asd.asd
		// 																			      ( 정상적으로 인코딩된 UTF-8 문자열임      )		   (@아스키코드 %40)
		
		if(iAge >= 20){
			response.sendRedirect("4_request_pass.jsp?u_age="+iAge+"&u_name=" + enname + "&u_email=" + strEmail);
		}
		else if(iAge < 20){
			response.sendRedirect("4_request_ng.jsp?u_age="+iAge+"&u_name="+enname+"&u_email="+strEmail);
		}
		else{
			out.print("올바른 나이를 입력해주세요 .");
		}
		
		// 4. 페이지 이동 방법 : submit 말고, response.sendRedirect("이동할 페이지?input명=값");  --> get방식으로 parameter전달법
		
		
	%>
</body>
</html>