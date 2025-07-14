<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.net.URLEncoder" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 나이인증 (2Page)</title>
</head>
<body>

	<%
		//쿼리스트링 : http://localhost/jsp_ict05/02_request/4_request_send.jsp?user_age=30&user_name=%E3%85%81%E3%84%B4%E3%85%87%E3%84%B9&user_email=asd%40asd.asd

		request.setCharacterEncoding("UTF-8");		
		// 이전페이지 정보 넘겨받기
		int iAge = Integer.parseInt(request.getParameter("user_age"));
		String strName = URLEncoder.encode(request.getParameter("user_name"), "UTF-8");
		String strEmail = request.getParameter("user_email");
		
		// 2. 나이가 20살 이상이면 pass로 이동, 20살 미만이면 ng로 이동
		if(iAge >= 20){
			response.sendRedirect("4_request_pass_re.jsp?u_name="+strName+"&u_age="+iAge+"&u_email="+strEmail);
		}else{
			response.sendRedirect("4_request_ng_re.jsp?u_name="+strName+"&u_age="+iAge+"&u_email="+strEmail);
		}
	%>

</body>
</html>