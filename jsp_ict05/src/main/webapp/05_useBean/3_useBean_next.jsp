<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- 1. useBean 액션태그를 이용해서 객체 생성  -->    
<%-- <jsp:useBean id="자바빈이름" class="패키지명.클래스명"/> --%> <!--  자바(클래스명 참조변수 = new 클래스명();)과 같다 (객체생셩)-->
<jsp:useBean id="member" class="useBean.MemberInfo"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Date date = null;
	// 한글 깨지지 않게 처리
	request.setCharacterEncoding("UTF-8");
	
	// 이전화면에서 넘어온 값을 변수에 담으세요
	String r_id = request.getParameter("id");
	String r_pwd = request.getParameter("password");
	String r_name = request.getParameter("name");
	String r_address = request.getParameter("address");
	String r_email = request.getParameter("email");
	

%>

	<!-- 2. setProperty => java의 setter와 같다. -->
	<%-- <jsp:setProperty property="멤버변수명" name="id명(참조변수)" value="값 or 표현식"/> --%>
	<%-- <jsp:setProperty property="id" name="member" value="<%=r_id %>"/>
	<jsp:setProperty property="password" name="member" value="<%=r_pwd %>"/>
	<jsp:setProperty property="name" name="member" value="<%=r_name %>"/>
	<jsp:setProperty property="address" name="member" value="<%=r_address %>"/>
	<jsp:setProperty property="email" name="member" value="<%=r_email %>"/>
	<jsp:setProperty property="registerDate" name="member" value="<%= new Date() %> "/>--%>
	<jsp:setProperty property="*" name="member"/>  <!-- 세터 하나하나 안 줘도 * 모든것으로 퉁 칠수있음 -->
	<jsp:setProperty property="registerDate" name="member" value="<%= new Date()%>" />
	
	
	<!-- 3. getProperty => java의 getter와 같다. -->
	<%-- <jsp:getProperty property="멤버변수명" name="id명(참조변수)"/> --%>
	<%-- <jsp:getProperty property="id" name="member"/> <br>
	<jsp:getProperty property="password" name="member"/><br>
	<jsp:getProperty property="name" name="member"/><br>
	<jsp:getProperty property="address" name="member"/><br>
	<jsp:getProperty property="email" name="member"/><br> 
	<jsp:getProperty property="registerDate" name="member"/>--%>
	
	
	<table border = "1" cellspacing="0" cellpadding="10">
		<tr>
			<td align="right"> 아이디 </td>
			<td><jsp:getProperty property="id" name="member"/></td>
		</tr>
		<tr>
			<td align="right"> 패스워드 </td>
			<td><jsp:getProperty property="password" name="member"/></td>
		</tr>
		<tr>
			<td align="right"> 이름 </td>
			<td><jsp:getProperty property="name" name="member"/><br></td>
		</tr>
		<tr>
			<td align="right"> 주소 </td>
			<td><jsp:getProperty property="address" name="member"/></td>
		</tr>
		<tr>
			<td align="right"> 이메일 </td>
			<td><jsp:getProperty property="email" name="member"/></td>
		</tr>
		<tr>
			<td align="right"> 등록일 </td>
			<td><jsp:getProperty property="registerDate" name="member"/></td>
		</tr>
	</table>


</body>
</html>