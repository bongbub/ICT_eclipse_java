<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>
	<h2>회원가입 결과</h2>
	<%
		String strre = request.getParameter("result");
		if(strre.equals("SUCCESS")){
			out.print("가입 성공! ");
		}else{
			out.print("가입 실패 ㅜㅜ! ");
		}
	
	%>
</body>
</html>