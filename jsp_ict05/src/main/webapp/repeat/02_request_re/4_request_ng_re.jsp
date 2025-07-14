<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미자(4p)</title>
</head>
<body>
	<%=request.getParameter("u_name") %>님 <%=request.getParameter("u_age") %>세이므로 미성년자입니다<br>
	주류 구매가 불가능합니다.<br>
	이메일 : <%= request.getParameter("u_email") %>
</body>
</html>