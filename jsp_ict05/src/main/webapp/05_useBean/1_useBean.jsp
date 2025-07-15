<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="useBean.MemberInfo" %>
<%@ page import = "java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바빈을 이용한 객체 생성</title>
</head>
<body>
	<h3> 자바빈을 이용한 객체 생성 </h3>
	<%  
		// 1. MemberInfo 클래스 인스턴스 생성
		// 클래스명 참조변수 = new 클래스명();
		MemberInfo dto = new MemberInfo();
		Date date = new Date();
	
		// 2. setter로 값 전달(멤버변수로 값 전달하기 위함)
		dto.setId("exid");
		dto.setPassword("expwd");
		dto.setName("홍길동");
		dto.setEmail("hong@gmail.com");
		dto.setAddress("서울 마포구");
		dto.setRegisterDate(date);
		// dto.setRegisterDate(new Date()); // 이것도 같은 방법.
		
		// 3. 출력 => 방법1. out 객체를 이용해서 getter로 출력
		out.print("id :"+ dto.getId()+"<br>");
		out.print("pwd :"+ dto.getPassword()+"<br>");
		out.print("name :"+ dto.getName()+"<br>");
		out.print("email :"+ dto.getEmail()+"<br>");
		out.print("address :"+ dto.getAddress()+"<br>");
		out.print("regitDate :"+ dto.getRegisterDate()+"<br>");
		
		// request.setAttribute("속성명", 속성값) => 속성명지정 : info
		request.setAttribute("info", dto);
				
	%>
	<br><hr><br>
	<%
		// 4. getAttribute()로 속성값을 전달받아 표현식을 이용해 getter 출력
		MemberInfo mem = (MemberInfo)request.getAttribute("info");
	%>
	dto 자료들 : <%= mem %>	
	
	<br><hr><br>
	<!--  출력 => 방법2. 표현식을 이용해서 getter로 출력 -->
	id : <%= dto.getId() %>
	pwd : <%= dto.getPassword() %>
	name :<%= dto.getName() %>
	email : <%=dto.getEmail() %>
	address : <%= dto.getAddress() %>
	registerDate : <%= dto.getRegisterDate() %>
	
</body>
</html>