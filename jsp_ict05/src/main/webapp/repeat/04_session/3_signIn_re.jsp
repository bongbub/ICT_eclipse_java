<%@page import="java.util.Date"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 페이지</title>
</head>
<body>

<%
	String strAgree = request.getParameter("agree");

	String result = "";
	if(strAgree.equals("YES")){
		String s_id = (String)session.getAttribute("session_id");
		String s_pwd = (String)session.getAttribute("session_pwd");
		String s_name = (String)session.getAttribute("session_name");
		
		out.print(" == 회원가입 정보 ==<br>");
		out.print("s_id : "+s_id +"<br>");
		out.print("s_pwd : "+s_pwd +"<br>");
		out.print("s_name : "+s_name +"<br>");
		
		// 톰캣 적기
		PrintWriter writer = null;
		try{
			String filepath = application.getRealPath("/WEB-INF/"+s_name+".txt");
			writer = new PrintWriter(filepath); //가져온 주소이름으로 적기
			
			writer.println("== 세션정보 ==");
			writer.println("세션 아이디 :" + session.getId());
			writer.println("세션 최초 생성 시각 : "+ new Date(session.getCreationTime()));
			writer.println("세션 최초 접근 시각 : "+ new Date(session.getLastAccessedTime()));
			writer.println("최초세션 유효 시간 : "+ session.getMaxInactiveInterval());
			session.setMaxInactiveInterval(10 * 60);
			writer.println("수정된 세션 유효 시간 : "+ session.getMaxInactiveInterval());
		
			if(session.isNew()){
				writer.println("새 세션이 생성되었습니다.");
			}
			writer.println("-- 가입정보 --");
			writer.println("아이디 : "+s_id);
			writer.println("비밀번호 : "+s_pwd);
			writer.println("이름 : "+s_name);
			writer.println("-----------------");
			result="SUCCESS";
		}catch(IOException e){
			result = "FAIL";
		}finally{
			try{
				writer.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}else{
		result = "FAIL";
	}
	out.print("result :" + result);
	session.invalidate();
	response.sendRedirect("./4_result_re.jsp?result="+result);
%>


</body>
</html>