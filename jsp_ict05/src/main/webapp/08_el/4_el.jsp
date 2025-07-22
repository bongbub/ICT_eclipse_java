<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 과일(중요)</title>
</head>
<body>
	<h3> 좋아하는 과일 (중요) </h3>
	
	<%
		// list 생성, 과일들 추가(add 메서드) 
		// List<자료형> list = new ArrayList<자료형>();
		List<String> list = new ArrayList<String>();
		
		// 속성값을 jsp로 전달
		list.add("사과");
		list.add("오렌지");
		list.add("키위");
		list.add("배");
		list.add("패션후르츠");
		list.add("망고");
		list.add("리치");
		list.add("수박");
		list.add("바나나");
		
		// 속성값을 JSP로 전달
		request.setAttribute("list", list);
		
		String viewPage = "4_el_next.jsp";
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	%>
	
</body>
</html>