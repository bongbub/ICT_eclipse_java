<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출력</title>
</head>
<body>

	<h2> 방법 1. 기존 표현식(Expression) </h2>
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 값 받아옴
		String strId = request.getParameter("user_id");
		String strPwd = request.getParameter("user_password");
	%>
	아이디 : <%=strId %><br>
	비밀번호 : <%=strPwd %><br>
	
	<hr>

	<h2> 방법 2. EL(Expression Language) 적용 => 많이 적용 </h2>
	아이디 : ${param.user_id }<br>
	비밀번호 : ${param.user_password }<br>
	
	<hr>
	
	<h2> 방법 2. EL(Expression Language) 적용 => 대괄호 </h2>
	아이디 : ${param["user_id"] }
	비밀번호 : ${param["user_password"] }
</body>
</html>