<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>JSTL(JSP Standard Tag Library) - core 태그 - 변수지원 태그 set</h3>
	
	<%--
		! core태그를 선언하지 않으면 true false가 정상 작동 되지 않는다.
		
      <c:if test="조건"  var="변수명"   [scope="범위"]>
       ..
       </c:if>
       
       if(true) {}와 동일
    --%>
    <c:if test="${true }">
    	조건식이 true -> 무조건 실행
    </c:if>
    <c:if test="${false }">
    	조건식이 false -> 무조건 실행
    </c:if>
    
    <!-- 
     	쿼리스트링 : get방식의 URL
     	쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=30&kind=soju 
      	쿼리스트링으로 URL 실행 => <!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=30&kind=soju 
      -->
    
    <b>[ 방법1) 표현식 출력 ]</b><br>
    <%
    	String name = request.getParameter("name");
    	int age = Integer.parseInt(request.getParameter("age"));
    	String kind = request.getParameter("kind");
    %>
    이름 : <%=name %>
    나이 : <%=age %>
    종목 : <%=kind %>
    <br><hr><br>
    <b>[ 방법2) EL태그 + core라이브러리 if문]</b><br>
    <c:if test="${param.name=='hong'}">
    	${param.name }
    </c:if>
    <c:if test="${param.age==30}">
    	${param.age }
    </c:if>
    <c:if test="${param.kind=='kind'}">
    	${param.kind }
    </c:if>
    
    <!-- hong은 15세이므로 bear를 살수 없습니다.-->
	<!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=15&kind=bear -->
	<!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=11&kind=bear -->
    <b>[ 방법1) 표현식 출력 ]</b><br>
    <%
    	String na = request.getParameter("name");
    	int ag = Integer.parseInt(request.getParameter("age"));
    	String ki = request.getParameter("kind");
    	if(ag >= 15){
    %>
    <%=na %>님은 <%=ag %>살이라 <%= ki %>를 살 수 없습니다.
    <%
    	}
    	else{
    %>
    <%=na %>님은 <%=ag %>살이라 <%= ki %>를 살 수 있습니다.
    <%} %>
    
    
    <b>[ 방법2) EL태그 + core라이브러리 if문]</b><br>
    <c:if test="${param.age >= 15 }" >
    	${param.name }님은 ${param.age }살이므로 ${param.kind }를 살 수 없습니다.
    </c:if>
    <c:if test="${param.age <= 15}">
    	${param.name } 님은 ${param.age }살이라 ${param.kind }를 살 수 있습니다.
    </c:if>
    
    

</body>
</html>