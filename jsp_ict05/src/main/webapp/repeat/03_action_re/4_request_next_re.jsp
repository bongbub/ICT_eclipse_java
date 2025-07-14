<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2p</title>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");
	String name = URLEncoder.encode(request.getParameter("user_name"));
	String backCol = request.getParameter("back_color");
	String fontCol = request.getParameter("font_color");
	String shaCol = request.getParameter("shadow_color");
	
	%>
	
	<jsp:include page="4_result_re.jsp">
		<jsp:param value="<%=name %>" name="user_name"/>
		<jsp:param value="<%=backCol %>" name="back_color"/>
		<jsp:param value="<%=fontCol %>" name="font_color"/>
		<jsp:param value="<%=shaCol %>" name="shadow_color"/>
	</jsp:include>

</body>
</html>