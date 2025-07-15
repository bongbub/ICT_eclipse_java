<%@page import="java.util.Date"%>
<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈을 이용한 객체 생성</title>
</head>
<body>
	<h2>자바빈을 이용한 객체 생성</h2>
	<%
		MemberInfo dto = new MemberInfo();
		Date date = null;
	
		// 값 전달
		dto.setId("testId");
		dto.setPassword("testPwd");
		dto.setName("홍길동");
		dto.setAddress("서울시 마포구");
		dto.setEmail("test@test.com");
		dto.setRegisterDate(new Date());
		
		// out 출력
		out.print("id : " + dto.getId()+"<br>");
		out.print("password :" +dto.getPassword()+"<br>");
		out.print("name : "+dto.getName()+"<br>");
		out.print("address : "+dto.getAddress()+"<br>");
		out.print("email : "+dto.getEmail()+"<br>");
		out.print("registerDate :" + dto.getRegisterDate()+"<br>");
		
		// setAttribute
		request.setAttribute("info", dto);
	%>
	<br><hr><br>
	<%
		MemberInfo mem = (MemberInfo)request.getAttribute("info");
	%>
	dto 내 자료 : <%=mem %>
	<hr>
	id:<%= dto.getId() %><br>
	password:<%= dto.getPassword()%><br>
	name:<%= dto.getName() %><br>
	address:<%=dto.getAddress() %><br>
	email:<%=dto.getEmail() %><br>
	registerDate : <%=dto.getRegisterDate() %><br>
</body>
</html>