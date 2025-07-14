<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>0_test_next</title>
</head>
<body>
	
	
	<h3>[방법1. out 으로 출력 ]</h3>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("m_id");
	String pwd = request.getParameter("m_pwd");
	String email = request.getParameter("m_email");
	String major = request.getParameter("m_major");
	String job = request.getParameter("m_job");
	String[] hobby = request.getParameterValues("m_hobby");
	
	
	out.println("아이디 : "+id + "<br>");
	out.println("비밀번호 : "+pwd + "<br>");
	out.println("이메일 : "+email+ "<br>");
	out.println("전공 : "+major+ "<br>");
	out.println("직업 : "+job+ "<br>");
	for(int i=0; i<hobby.length; i++){
		if(hobby[i] != null){
			out.println("취미 : "+hobby[i]+ "<br>");
		}
		else{
			out.println("취미 없음");
		}
	}
	
	
	%>
	
	<h3>[방법2. 표현식으로 출력]</h3>
	아이디 : <%= id %><br>
	비밀번호 : <%= pwd %><br> 
	이메일 : <%= email %> <br>
	전공 : <%= major %> <br>
	직업 : <%= job %> <br>
	취미 :
	<% for(int i=0; i<hobby.length; i++){
			if(hobby[i] != null){%>
			 <%= hobby[i] %>	
			<% }
			else{
				out.println("취미없음");
			}
	
		}
	%>
		
	
	
	
</body>
</html>