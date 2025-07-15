
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

	<h2>useBean 액션태그</h2>
	
	<jsp:setProperty property="id" name="member" value="kim"/>
	<jsp:setProperty property="password" name="member" value="kin123"/>
	<jsp:setProperty property="name" name="member" value="김태희"/>
	<jsp:setProperty property="address" name="member" value="서울시 마포구"/>
	<jsp:setProperty property="email" name="member" value="kin@naver.com"/>
	<jsp:setProperty property="registerDate" name="member" value="<%= new Date() %>"/>

	<jsp:getProperty property="id" name="member"/><br>
	<jsp:getProperty property="password" name="member"/><br>
	<jsp:getProperty property="name" name="member"/><br>
	<jsp:getProperty property="address" name="member"/><br>
	<jsp:getProperty property="email" name="member"/><br>
	<jsp:getProperty property="registerDate" name="member"/><br>
	
	
</body>
</html>