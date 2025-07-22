<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 출력</title>
</head>
<body>

	<!-- 전체메뉴 출력 -->
	<c:forEach var="i" items="${menu }">
		${i }
	</c:forEach>
	
	<hr>
	<!-- 2번째, 3번째 메뉴만 출력 -->
	<c:forEach var="i" items="${menu }" begin="2" end="3">
		${i }
	</c:forEach>
	
</body>
</html>