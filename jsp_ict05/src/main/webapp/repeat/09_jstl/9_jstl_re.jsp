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

<h3>콤마 구분 예제</h3>
무지개색 :
<c:forTokens var="col" items="red, orange, yellow, green, blue, navy, violet" delims=",">
	${col}
</c:forTokens>

</body>
</html>