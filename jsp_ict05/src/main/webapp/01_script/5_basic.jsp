<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 구구단 출력 </title>
</head>
<body>
	
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th colspan="5">구구단</th>
		</tr>



	<%
		for(int i=2; i<10; i++){
	%>	
		<tr>
			<th colspan="5"><%= i %>단</th>
		</tr>
		<tr>
			<% for(int j=1; j <= 9; j++){
				 int result = i*j;%>
			<td><%= i %></td>
			<td>*</td>
			<td><%= j %></td>
			
			<td>=</td>
			<td><%= result %></td>
		</tr>
		<%	}} %>
	</table>

</body>
</html>