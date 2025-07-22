<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출력결과</title>
</head>
<body>
	<h2>list 출력 결과</h2>
	<h4> 방법 1. 기존 표현식(Expression) </h4>
	<%
		request.setCharacterEncoding("UTF-8");
		List<String> list = (List)request.getAttribute("fruit");
	%>
	좋아하는 과일 : 
	<%=list.get(0) %><br>
	<%=list.get(1) %><br>
	<%=list.get(2) %><br>
	<%=list.get(3) %><br>
	<%=list.get(4) %><br>
	<br><hr><br>
	
	<h4> 방법 2. EL(Expression Language)태그 => 중요 ! </h4>
	EL태그 : ${fruit}
	<br>
	<h4> 배열로 출력 </h4>
	배열 : 
	${fruit[0]}
	${fruit[1]}
	${fruit[2]}
	${fruit[3]}
	${fruit[4]}
	<br>
	<h4> scope 출력 </h4>
	scope : ${requestScope.fruit }
	
</body>
</html>