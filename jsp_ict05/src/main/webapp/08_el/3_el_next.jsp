<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>el태그 출력</title>
</head>
<body>
	<h2> 방법 1. 기존 표현식(Expression) </h2>
	<%
		// 한글 안 깨지게 처리
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("user_id");
		String[] hobby = request.getParameterValues("user_hobby");
		
	%>
	아이디 : <%=id %><br>
	<%
		for (int i=0; i<hobby.length; i++){
	%>
	취미 : <%=hobby[i] %><br>
	<%
		}
	%>
	
	<br><hr><br>
	
	
	<h2> 방법 2. EL(Expression Language) 적용 => 많이 적용 </h2>
	아이디 :${param.user_id}<br>
	취미 : 
	${paramValues.user_hobby[0]}
	${paramValues.user_hobby[1]}
	${paramValues.user_hobby[2]}
	${paramValues.user_hobby[3]}
	<hr>
	
	
</body>
</html>