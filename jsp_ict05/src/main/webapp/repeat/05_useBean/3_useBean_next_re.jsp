<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="member" class="useBean.MemberInfo"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	
	String r_id = request.getParameter("id");
	String r_pwd = request.getParameter("password");
	String r_name = request.getParameter("name");
	String r_add = request.getParameter("address");
	String r_em = request.getParameter("email");
	
%>
<%-- <jsp:setProperty property="id" name="member" value="<%=r_id %>"/>
<jsp:setProperty property="password" name="member" value="<%=r_pwd %>"/>
<jsp:setProperty property="name" name="member" value="<%=r_name %>"/>
<jsp:setProperty property="address" name="member" value="<%=r_add %>"/>
<jsp:setProperty property="email" name="member" value="<%=r_em %>"/> --%>
<jsp:setProperty property="registerDate" name="member" value="<%=new Date() %>"/>
<jsp:setProperty property="*" name="member"/>


<table border="1" cellspacing ="0" cellpadding="10">
	<tr>
		<td align="right">아이디</td>
		<td><jsp:getProperty property="id" name="member"/></td>
	</tr>
	<tr>
		<td align="right">비밀번호</td>
		<td><jsp:getProperty property="password" name="member"/></td>
	</tr>
	<tr>
		<td align="right">이름</td>
		<td><jsp:getProperty property="name" name="member"/></td>
	</tr>
	<tr>
		<td align="right">주소</td>
		<td><jsp:getProperty property="address" name="member"/></td>
	</tr>
	<tr>
		<td align="right">이메일</td>
		<td><jsp:getProperty property="email" name="member"/></td>
	</tr>
	<tr>
		<td align="right">등록일</td>
		<td><jsp:getProperty property="registerDate" name="member"/></td>
	</tr>
</table>

</body>
</html>