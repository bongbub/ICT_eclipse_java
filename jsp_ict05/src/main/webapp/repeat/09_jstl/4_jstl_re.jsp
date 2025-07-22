<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>choose문</title>
</head>
<body>

	<!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/4_jstl.jsp?num=3 -->
     
    <!--  num이 1: 처음뵙겠습니다. 2: 두번째 뵙겠습니다. 3 : 세번째 뵙겠습니다.  그외 : 지겹네요 -->
	
	
	<c:choose >
		<c:when test="${param.num==1 }">
			<h3>처음 뵙겠습니다당^^^</h3>
		</c:when>
		<c:when test="${param.num==2 }">
			<h3>두번째 입니닷</h3>
		</c:when>
		<c:when test="${param.num==3 }">
			<h3>세번째나..</h3>
		</c:when>
		<c:when test="${param.num==4 }">
			<h3>지겨워~~~~~~~</h3>
		</c:when>
	</c:choose>
</body>
</html>