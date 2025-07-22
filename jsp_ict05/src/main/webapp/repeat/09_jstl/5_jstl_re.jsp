<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중요! forEach</title>
</head>
<body>
	 <!-- 1~10까지 출력 -->
	<c:forEach var="i" begin="1" end="10" step="1">
		${i }
	</c:forEach>
	
	<hr>
	<!--  1 3 5 7 9 출력 -->
	<c:forEach var="i" begin="1" end="10" step="2">
		${i }
	</c:forEach>
</body>
</html>