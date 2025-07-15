<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과페이지</title>
</head>
<body>
	<h3>회원가입 결과</h3>
	<%
		// result 결과 읽어오기
		String strResult = request.getParameter("result");
		
		if(strResult.equals("SUCCESS")){
			out.print("=== 가입 성공 === <br>");
		}
		else{
			out.print("=== 가입 실패 === <br>");
		}
	%>

	
</body>
</html>