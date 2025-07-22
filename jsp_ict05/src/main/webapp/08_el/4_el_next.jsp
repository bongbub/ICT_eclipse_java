<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>list 출력 결과 jsp 페이지</title>
</head>
<body>
	<h2> request의 list 출력 </h2>
	
	<h4> 방법 1. 기존 표현식(Expression) </h4>
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
		// 값 받아오기
		List<String> list = (List)request.getAttribute("list");
	%>
	표현식 : 
	<%= list.get(0) %>
	<%= list.get(1) %>
	<%= list.get(2) %>
	<%= list.get(3) %>
	<%= list.get(4) %>
	<%= list.get(5) %>
	<hr>

	<h4> 방법 2. EL(Expression Language)태그 => 중요!</h4>
	EL 태그 :${list}<br>

	 <!-- 배열로 출력 -->
	 배열 :
	 ${list[0]}
	 ${list[1]}
	 ${list[2]}
	 ${list[3]}
	 ${list[4]}
	 <br>
	 
	 <!-- scope 출력 -->
	 scope : ${requestScope.list}<br>
	 
	 
</body>
</html>