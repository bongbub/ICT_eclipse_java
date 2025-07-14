<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 결과 페이지</title>
</head>
<body>
<%
	// 한글 깨지지 않게 처리
	request.setCharacterEncoding("UTF-8");
	
	//String 변수 = request.getParameter("input name");
	// String[] 배열명 = request.getParameterValues("input name");

	String strId = request.getParameter("userId");
	String strPwd = request.getParameter("userPwd");
	String strEmail = request.getParameter("userEmail");
	String strMajor = request.getParameter("userMajor");
	String strJob = request.getParameter("userJob");
	String[] strHobby = request.getParameterValues("userHobby");
	
	
	out.println("아이디 :" + strId +"<br>");
	out.println("비밀번호 :" + strPwd +"<br>");
	out.println("이메일 :" + strEmail+"<br>");
	out.println("전공 :" + strMajor+"<br>");
	out.println("직업 :" + strJob+"<br>");
	out.print("취미 : ");
	if(strHobby != null){
		for(int i=0; i<strHobby.length; i++){
			out.println( strHobby[i]);	
		}
	}
	else{
		out.println("취미 없음");
	}
	
%>
<hr>

아이디 : <%= strId %><br> 
비밀번호 :<%= strPwd %><br> 
이메일 : <%= strEmail %><br>
전공 : <%= strMajor %><br>
직업 :<%= strJob %><br>
취미 : <%= (strHobby != null) ? Arrays.toString(strHobby) : "취미없음" %><br>


</body>
</html>