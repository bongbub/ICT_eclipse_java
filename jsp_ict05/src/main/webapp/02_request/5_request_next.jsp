<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현재 시간 출력</title>
</head>
<body>
<% 
	// 속성 값 가져오기
	// Calendar calendar = Object타입;

	Calendar calendar = (Calendar)request.getAttribute("time");
	// Object형이므로 Calendar로 바꿔줌

%>

	현재 날짜는 <%= calendar.get(Calendar.YEAR)%>년<br>
			 <%= calendar.get(Calendar.MONTH)+1 %>월<br>  <!--  0월부터 시작 -->
			 <%= calendar.get(Calendar.DATE) %>일<br>
			 <%= calendar.get(Calendar.HOUR )%>시 
			 <%= calendar.get(Calendar.MINUTE) %>분
			 <%= calendar.get(Calendar.SECOND) %> 초
</body>
</html>