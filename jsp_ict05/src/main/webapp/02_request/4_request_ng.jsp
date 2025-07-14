<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>미성년자인 경우(4p)</title>
</head>
<body>
	<!--  나이, 이름, 이메일을 받아온 후 메세지 출력
		  ~님(메일) ~세 이므로 미성년자입니다. 주류 구매가 불		````````가능합니다. 
		  이메일 : ~
		  <a href = "xxx">처음으로 이동 </a> -->
	<%=request.getParameter("u_name") %>님 <%=request.getParameter("u_age") %>세 이므로 미성년자입니다. 주류 구매가 불가능합니다. <br>
		  이메일 : <%= request.getParameter("u_email") %><br>
	<a href="4_request.jsp">처음으로 이동</a>
	
	
</body>
</html>