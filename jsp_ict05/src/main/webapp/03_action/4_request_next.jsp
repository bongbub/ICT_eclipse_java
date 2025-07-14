<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2Page</title>
</head>
<body>
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		// 이전페이지로부터 값을 받아서 변수에 담기
		String name = URLEncoder.encode(request.getParameter("user_name"));
		String bkcl =request.getParameter("back_color");
		String ftcl = request.getParameter("font_color");
		String shcl = request.getParameter("shadow_color");
		
	%>
	
	<!-- include, param을 통해 위 변수에 들어있는 값 전달 -->
	<jsp:include page ="4_result.jsp">
		<jsp:param name="name1" value="<%=name %>"/>  
		<jsp:param name="backcolor" value="<%=bkcl %>"/>  
		<jsp:param name="fontcolor" value="<%= ftcl %>"/>  
		<jsp:param name="shadowcolor" value="<%=shcl %>"/>  
	</jsp:include>
</body>
</html>