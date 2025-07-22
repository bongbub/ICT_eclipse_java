<%@page import="java.util.Date"%>
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
		MemberInfo dto = (MemberInfo)request.getAttribute("memberInfo");
	%>
	아이디 : <%=dto.getId() %><br>
	비밀번호 :<%=dto.getPassword() %> <br>
	이름 : <%=dto.getName()%><br>
	주소 : <%=dto.getAddress()%><br>
	이메일 : <%=dto.getEmail() %><br>
	등록일 : <%=dto.getRegisterDate()%><br>
	
	<br><hr><br>
	
	<h2> 방법 2. EL의 멤버변수 이용 => 중요!!  </h2>
	아이디 : ${memberInfo.id }<br>
	비밀번호 : ${memberInfo.password }<br>
	이름 : ${memberInfo.name }<br>
	주소 : ${memberInfo.address }<br>
	이메일 : ${memberInfo.email }<br>
	등록일 : ${memberInfo.registerDate }<br>
	
	<br><hr><br>
	
	<h2> 방법 3. EL의 멤버 메서드 이용 => 중요! </h2>
	아이디 : ${memberInfo.getId() }<br>
	비밀번호 : ${memberInfo.getPassword() }<br>
	이름 : ${memberInfo.getName() }<br>
	주소 : ${memberInfo.getAddress() }<br>
	이메일 : ${memberInfo.getEmail() }<br>
	등록일 : ${memberInfo.getRegisterDate() }<br>
</body>
</html>