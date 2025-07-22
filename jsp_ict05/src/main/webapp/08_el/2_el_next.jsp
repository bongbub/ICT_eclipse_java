<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식</title>
</head>
<body>
	
	<h2> 방법 1. 기존 표현식(Expression) </h2>
	
	<%
		// 한글 깨지지 않게 처리
		request.setCharacterEncoding("UTF-8");
	
		// 값 가져오기
		String strId = request.getParameter("user_id");
		String strPassword = request.getParameter("user_password");
		
	%>
	아이디 : <%=strId %> <br>
	비밀번호 : <%=strPassword %> <br>
	
	<br><hr><br>
	
	<h2> 방법 2. EL(Expression Language) 적용 => 많이 적용 </h2>
	
	아이디 : ${param.user_id}
	비밀번호 : ${param.user_password}
	
	<br><br>
	<h2> 방법 2. EL(Expression Language) 적용 => 대괄호 </h2>
	아이디 : ${param["user_id"]} <br>
	비밀번호 : ${param["user_password"]}<br>
	
</body>
</html>