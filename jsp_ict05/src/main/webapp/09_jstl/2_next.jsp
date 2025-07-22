<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품정보</title>
</head>
<body>

	<h3>상품정보</h3>
	<%
		// 한글 안 깨지게 처리
		request.setCharacterEncoding("UTF-8");
	%>
	
	상품코드 : ${p_code}
	상품명 : ${p_name }
	상품가격 : ${p_price }
</body>
</html>