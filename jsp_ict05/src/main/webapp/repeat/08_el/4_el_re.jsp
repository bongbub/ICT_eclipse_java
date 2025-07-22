<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아하는 과일</title>
</head>
<body>
	<h2> 좋아하는 과일</h2>
	<%
		List<String> list = new ArrayList<String>();
		
		list.add("사과");
		list.add("오렌지");
		list.add("키위");
		list.add("배");
		list.add("패션후르츠");
		list.add("리치");
		
		request.setAttribute("fruit", list);
		
		String viewPage="4_el_next_re.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
	%>

</body>
</html>