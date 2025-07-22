<%@page import="java.util.Date"%>
<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지 - 중요! </title>
</head>
<body>
	
	<%
		// MemberInfo 객체 생성, 참조변수 dto
		MemberInfo dto = new MemberInfo();
		// setter로 값 전달
		dto.setId("zing");
		dto.setPassword("dhwlddj");
		dto.setName("징징이");
		dto.setEmail("zing@naver.com");
		dto.setAddress("비키니시티 2번지");
		dto.setRegisterDate(new Date());
		
		// jsp로 값 전달 - 키:memberInfo
		request.setAttribute("dto", dto);
		
		String viewPage = "5_el_next.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	%>

</body>
</html>