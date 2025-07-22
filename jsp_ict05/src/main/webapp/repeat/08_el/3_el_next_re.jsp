<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과</title>
</head>
<body>
	<h2>방법 1. 기존 표현식 Expression</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("user_id");
		String[] hob = request.getParameterValues("user_hobby");
	%>
	이름 : <%=id %>
	<%
		for(int i=0; i<hob.length; i++){
	%>
	취미 : <%=hob[i] %>
	<% } 
	%>
	<hr>
	
	<h2> 방법 2. EL(Expression Language) => 많이 적용</h2>
	아이디 : ${param.user_id }
	취미 : ${paramValues.user_hobby[0] }
	취미 : ${paramValues.user_hobby[1] }
	취미 : ${paramValues.user_hobby[2] }
	취미 : ${paramValues.user_hobby[3] }

</body>
</html>