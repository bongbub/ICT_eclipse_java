<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트</title>
</head>
<body>
<%
	String name = "아이유";
	int age = 30;
	String id = "iu";
	String password = "iu_1234";
	String email = "iu@naver.com";
%>

	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<td>이름</td>
			<td><%= name %></td>
		</tr>
		<tr>
			<td>나이</td>
			<td><%= age %></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><%= id %></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><%= password %></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%= email %></td>
		</tr>
	</table>

</body>
</html>