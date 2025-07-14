<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3p</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("user_name");
	String bcol = request.getParameter("back_color");
	String fcol = request.getParameter("font_color");
	String scol = request.getParameter("shadow_color");

%>

	<p style="background-color : <%=bcol %>; color:<%=fcol %>; text-shadow:2px 1px <%=scol %>">
		다시 돌아온 것을 환영합니다, <%=name %>님!
	</p>

</body>
</html>