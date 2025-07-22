<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach</title>
</head>
<body>

	<%
		String[] arr = {"오이", "호박","사과","고추","깻잎","싱추"};
		request.setAttribute("menu", arr);
		String viewPage = "6_jstl_next_re.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
	%>
</body>
</html>