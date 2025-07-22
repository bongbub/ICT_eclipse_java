<%@page import="java.util.Date"%>
<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지 - 중요!</title>
</head>
<body>

<%
	// MemberInfo 객체 생성, 참조변수dto
	MemberInfo dto = new MemberInfo();
	// setter로 값 전달
	dto.setId("squidward");
	dto.setPassword("qlqjs");
	dto.setName("징징이");
	dto.setAddress("비키니시티 2번지");
	dto.setEmail("squid@naver.com");
	dto.setRegisterDate(new Date());
	
	// jsp로 값 전달 키 : memberInfo
	request.setAttribute("memberInfo", dto);
	
	// dispatcher
	String viewPage = "5_el_next_re.jsp";
	RequestDispatcher dis = request.getRequestDispatcher(viewPage);
	dis.forward(request, response);
%>

</body>
</html>