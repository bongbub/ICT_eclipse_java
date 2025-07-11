<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- 
			스크립트릿에서 변수에 값 대입,  table의 td에 결과값 출력
		String name = "아이유";
		int age = 30;
		String id = "iu";
		String password = "iu_1234";
	 -->
	 
	 <%
	 	String name = "아이유";
	 	int age = 30;
	 	String id = "iu";
	 	String password = "iu_1234";
	 %>
	 
	 <table border="1" cellspacing="0" cellpadding="10">
	 	<tr>
	 		<td>이름</td>
	 		<td><%=name %></td>
	 	</tr>
	 	<tr>
	 		<td>나이</td>
	 		<td><%= age %></td>
	 	</tr>
	 	<tr>
	 		<td>아이디</td>
	 		<td><%= id %></td>
	 	</tr>
	 	<tr>
	 		<td>비밀번호</td>
	 		<td><%= password %></td>
	 	</tr>
	 </table>


</body>
</html>