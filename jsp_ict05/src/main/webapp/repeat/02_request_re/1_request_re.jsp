<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 정보 및 서버 정보 읽기</title>
</head>
<body>
	<h3> 내장객체 - request 객체</h3>
	request란, 내장객체로서, 자료형이 HttpServletRequest이다.<br>
	내장객체라 컴파일 시점에 객체를 생성한다<br>
	선언 : HttpServletRequest request = null; <br>
	클라이언트의 요청 정보를 저장한다 <br><br><br><br>
	
	<% out.print("서버 : " + request.getServerName()+"<br>");
		out.print("서버포트 :"+ request.getServerPort());
		out.print("요청방식 : "+ request.getMethod());
		out.print("서버프로토콜 :"+request.getProtocol());
	
	out.print("URL :" + request.getRequestURL()+"<br>");
	out.print("URI : "+ request.getRequestURI()+"<br>");
	out.print("컨텍스트패스 : " + request.getContextPath());
	%>
</body>
</html>