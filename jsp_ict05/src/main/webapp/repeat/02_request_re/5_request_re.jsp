<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attribute 예제- 중요!</title>
</head>
<body>
	<%
	
		Calendar calendar = Calendar.getInstance();
		request.setAttribute("time", calendar);
	%>
	<jsp:forward page="5_request_next_re.jsp"/>
</body>
</html>