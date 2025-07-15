<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- 1. useBean 액션태그를 이용해서 객체 생성  -->    
<%-- <jsp:useBean id="자바빈이름" class="패키지명.클래스명"/> --%> <!--  자바(클래스명 참조변수 = new 클래스명();)과 같다 (객체생셩)-->
<jsp:useBean id="member" class="useBean.MemberInfo" />
<!--  member이라는 id로,  내의 MemberInfo클래스의  Bean:DTO를, use:사용하겟다  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>useBean</title>
</head>
<body>
	
	<h2> useBean 액션태그 </h2>
	
	
	<!-- 2. setProperty => java의 setter와 같다. -->
	<%-- <jsp:setProperty property="멤버변수명" name="id명(참조변수)" value="값 or 표현식"/> --%>
	<jsp:setProperty property="id" name="member" value="kim"/>
	<jsp:setProperty property="password" name="member" value="kim1234"/>
	<jsp:setProperty property="name" name="member" value="김태희"/>
	<jsp:setProperty property="address" name="member" value="서울시 강남구"/>
	<jsp:setProperty property="email" name="member" value="kimth@gmail.com"/>
	<jsp:setProperty property="registerDate" name="member" value="<%=new Date() %>"/>
	
	<!-- 3. getProperty => java의 getter와 같다. -->
	<%-- <jsp:getProperty property="멤버변수명" name="id명(참조변수)"/> --%>
	<jsp:getProperty property="id" name="member"/><br>
	<jsp:getProperty property="password" name="member"/><br>
	<jsp:getProperty property="name" name="member"/><br>
	<jsp:getProperty property="address" name="member"/><br>
	<jsp:getProperty property="email" name="member"/><br>
	<jsp:getProperty property="registerDate" name="member"/><br>
	<br>
</body>
</html>