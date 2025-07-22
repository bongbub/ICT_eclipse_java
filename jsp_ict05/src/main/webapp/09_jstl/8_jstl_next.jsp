<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th>책번호 </th>
			<th>책이름 </th>
			<th>저자 </th>
			<th>출판사 </th>
			<th>출판일 </th>
			<th>가격 </th>
		</tr>
		<c:forEach var="book" items="${list}">
		<tr>
			<td>${book.bookId}</td>
			<td>${book.title}</td>
			<td>${book.author}</td>
			<td>${book.publisher}</td>
			<td>${book.pubdate}</td>
			<td>${book.price}</td>
		</tr>		
		</c:forEach>
	</table>

</body>
</html>