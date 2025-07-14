<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>액션태그 - include</title>
</head>
<body>
	<h3> 액션태그 - include </h3>
	action 태그란, jsp 페이지에서 어떤 동작을 하도록 지시하는 태그이다. <br><br>
	
	<%-- 문법 : <jsp:액션태그/>
	ex) <jsp:include page="포함할 페이지" /> --%>
	
	액션태그 종류 : forward, include, useBean, param, ... <br><br>
	
	<table width="600px" border="1" cellspacing="0" cellpadding="10">
		<!-- header -->
		<tr>
			<td colspan="2" align="center">
				<jsp:include page="1_header.jsp"/>
			</td>
		</tr>
		<!-- left -->
		<tr>
			<td>
				<jsp:include page="1_left.jsp"/>
			</td>
			<!-- main -->
			<td width="300px" valign="top">
				메인 레이아웃 <br><br>
				로그인<br>
				<img src="./images/pic3.jpg" width="400px">
			</td>
		</tr>
		<!-- footer -->
		<tr>
			<td colspan="2" align="center">
				<jsp:include page="1_footer.jsp"/>
			</td>
		</tr>
	
	</table>
	
</body>
</html>