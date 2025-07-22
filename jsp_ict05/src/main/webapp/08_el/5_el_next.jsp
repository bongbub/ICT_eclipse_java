<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DTO 출력 결과</title>
</head>
<body>

	<h2> 방법 1. 기존 Expression  이용 </h2>
	<%
		MemberInfo dto = (MemberInfo)request.getAttribute("dto");
	%>
	아이디 : <%=dto.getId() %><br>
	비밀번호 : <%=dto.getPassword() %><br>
	이름 : <%= dto.getName() %><br>
	주소 : <%=dto.getAddress() %><br>
	이메일 : <%= dto.getEmail()%><br>
	등록일 : <%= dto.getRegisterDate() %><br>
	
	<hr>
	<h2> 방법 2. EL의 멤버변수 이용 => 중요!!  </h2>
	아이디 : ${dto.id} <br>
	비밀번호 :${dto.password}<br>
	이름 :${dto.name}<br>
	주소 : ${dto.address}<br>
	이메일 : ${dto.email}<br>
	등록일 : ${dto.registerDate}<br>
	<hr>
	
	<h2> 방법 3. EL의 멤버 메서드 이용 => 중요! </h2>
	아이디 : ${dto.getId() }<br>
	비밀번호 :${dto.getPassword() }<br>
	이름 :${dto.getName() }<br>
	주소 : ${dto.getAddress() }<br>
	이메일 : ${dto.getEmail() }<br>
	등록일 : 
</body>
</html>