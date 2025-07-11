<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식을 활용(배열)</title>
</head>
<body>
	<%
		String dream[] = {"차박", "연주회", "자전거일주","전시회","크루즈여행"};
	%>
	
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th>번호</th>
			<th>꿈</th>
		</tr>
		<tr>
			<% for(int i=0; i<dream.length; i++){%>
			<td><%= i+1 %></td>
			<td><%= dream[i] %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>