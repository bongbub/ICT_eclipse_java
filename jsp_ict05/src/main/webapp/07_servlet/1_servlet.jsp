<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP - 서블릿 연동</title>
</head>
<body>
	<h3> JSP - 서블릿 연동 </h3>
	
	<!--  MemberServlet.java vs 07_servlet/1_servlet.jsp  -->
	<!-- 서블릿 URL : http://localhost/jsp_ict05/MemberServlet -->
	<!-- JSP URL  : http://localhost/jsp_ict05/07_servlet/1_servlet.jsp -->
	<form action="../MemberServlet" method="get">
		<table border="1" cellspacing="0" cellpadding="5">
			<tr>
				<th align="right"> 아이디 </th>
				<td><input type="text" name="userID" size="20"></td>
			</tr>
			<tr>
				<th align="right"> 이름 </th>
				<td><input type="text" name="userName" size="20"></td>
			</tr>
			<tr>
				<th align="right"> 이메일 </th>
				<td><input type="email" name="userEmail" size="20"></td>
			</tr>
			<tr>
				<td colspan="2">
					<div align="center">
						<input type="submit" value="전송">
						<input type="reset" value="취소">
					</div>
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>