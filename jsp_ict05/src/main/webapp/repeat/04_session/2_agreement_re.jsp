<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>약관 동의 화면</title>
<style>
	fieldset{
		max-width:400px;
		margin:15px 10px;
	}
	legend{
		ffont-size : 18px;
		font-weight = bold;
		color : grren;
	}
</style>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String strId = request.getParameter("user_id");
	String strPwd = request.getParameter("user_pwd");
	String strName = request.getParameter("user_name");
	
	// out으로 출력
	out.print("아이디 : "+strId+"<br>");
	out.print("비밀번호 : "+strPwd+"<br>");
	out.print("이름 : "+strName+"<br>");
	
	// 세션에 값 저장
	session.setAttribute("session_id", strId);
	session.setAttribute("session_pwd", strPwd);
	session.setAttribute("session_name", strName);
%>
	<form action="3_signIn_re.jsp" method="post">
		<fieldset>
			<legend> 회원 약관 </legend>
			=============================================<br>
			1. 회원정보는 웹사이트의 운영 정보를 위해서만 사용됩니다.<br>
			2. 웹사이트의 정상 운영을 방해하는 회원은 탈퇴처리 됩니다. <br>
			=============================================<br>
			위 약관에 동의하시겠습니까?
			
			<input type="radio" name="agree" value="YES">동의함
			<input type="radio" name="agree" value="NO">동의안함
			<input type="submit" value="확인">
		</fieldset>
	</form>

</body>
</html>