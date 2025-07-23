<%@page import="test.BoardCommentDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과물요</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	BoardCommentDTO dto = new BoardCommentDTO();
%>
	
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th>글 번호</th>
			<th>댓글 번호</th>
			<th>글쓴이</th>
			<th>내용</th>
			<th>작성일</th>
		</tr>
		<c:forEach var="i" items="${list}">
		<tr>
			<td>${i.c_comment_num}</td>
			<td>${i.c_board_num }</td>
			<td>${i.c_writer }</td>
			<td>${i.c_content }</td>
			<td>${i.c_regDate }</td> 
		</tr>
		</c:forEach>
	</table>

</body>
</html>