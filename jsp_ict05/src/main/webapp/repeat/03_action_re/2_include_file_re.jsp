<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%@ include file="2_valiable_re.jsp" %>
날짜 : <%= date %>

	<fieldset>
		<legend>include 디렉티브</legend>
		<%
		String name = request.getParameter("user_name");
		String age = request.getParameter("user_age");
		String mobile = request.getParameter("user_hp");
		
		out.print("== 방법1. out객체로 출력하기 ==<br>");
		out.print("이름 : " +name+"<br>");
		out.print("나이 : " +age+"<br>");
		out.print("전화번호 : " +mobile+"<br>");
		 %>
		 
		 <br>
		 <hr>
		 <br>
		 == 방법2. 표현식(Expression)으로 출력하기 == <br>
		 이름 : <%=name %><br>
		 나이 : <%=age %> <br>
		 전화번호 : <%=mobile %><br>
	</fieldset>
	<%@ include file="2_footer_re.jsp" %>
</body>
</html>