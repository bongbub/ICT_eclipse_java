<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 나이 인증(1P) </title>
</head>
<body>
	
	<h3> 나이 인증 - get방식</h3>
	<form action ="4_request_send.jsp" method="get">
			나이 : <input type ="text" name="user_age" size="3"><br>
			이름 : <input type ="text" name="user_name" size="30"><br>
			이메일 : <input type ="text" name="user_email" size="50"><br>
	
			<input type="submit" value="인증">
	</form>
</body>
</html>