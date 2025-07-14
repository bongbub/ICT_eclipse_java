<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>클라이언트 정보 및 서버 정보 읽기 </title>
</head>
<body>
	<h3>내장객체 - request 객체</h3>
	request란 내장객체로서, 자료형이 HttpServletRequest이다. <br>
	내장객체라 컴파일 시점에 객체 생성을 한다. <br>
	
	new를 해주기 위해선 아래와 같은 형식으로 객체 생성을 할 수 있다<br>
	HttpServletRequest request = new HttpServletRequest();<br>
	선언 : HttpServletRequest request = null;<br>
	클라이언트의 요청 정보를 저장한다 <br><br><br>
	
	<%
	out.print("서버 : " + request.getServerName() + "<br>");
	out.print("서버포트 :" + request.getServerPort()+"<br>");
	out.print("요청방식 : "+ request.getMethod()+"<br>");
	out.print("서버프로토콜 : " + request.getProtocol()+"<br>");
	
	/* 서버 : localhost
	서버포트 :80
	요청방식 : GET
	서버프로토콜 : HTTP/1.1  */
	

	
	// ---------------------------------------------
	
	// URL : 전체경로 
	// URI : 실질적인 경로 (프로젝트명>파일)
	
	// URL => http://localhost/jsp_ict05/02_request/1_request.jsp
	out.print("URL => " + request.getRequestURL()+"<br>");
	
	
	// URI =>				/jsp_ict05/02_request/1_request.jsp
	//						컨텍스트명   /  웹앱 하위폴더 / 파일명
	out.print("URI =>" + request.getRequestURI()+"<br>");
	
	
	
	
	// URI에서 컨텍스트패스(=프로젝트명) 가져오기 
	out.print("컨텍스트 패스 : " + request.getContextPath() + "<br>");
	// 컨텍스트 패스 : /jsp_ict05
	
	%>
	
</body>
</html>