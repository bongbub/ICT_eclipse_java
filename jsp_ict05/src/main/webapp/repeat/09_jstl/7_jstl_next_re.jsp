<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과값 출력</title>
</head>
<body>
<%
		
	//한글 처리
	request.setCharacterEncoding("UTF-8");
	MemberInfo dto = new MemberInfo();
%>
	<h2> list에서 꺼내서 dto 변수에 담아 출력</h2>
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th> 아이디 :</th>
			<th> 비밀번호 :</th>
			<th> 이름 :</th>
			<th> 주소 :</th>
			<th> 이메일 :</th>
			<th> 등록일 :</th>
		</tr>
		<c:forEach var="dto" items="${memberList}">
		<tr>
			<td>${dto.id}</td>
			<td>${dto.password}</td>
			<td>${dto.name}</td>
			<td>${dto.address}</td>
			<td>${dto.email}</td>
			<td>${dto.registerDate}</td>
			
		</tr> </c:forEach>
	</table>

</body>
</html>