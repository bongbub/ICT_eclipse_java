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
    
    <c:if test="${true}">
    	조건식이 true이므로 무조건 실행.
    </c:if>
    
    <br>
    <c:if test="${false}">
    	조건식이 false이므로 무조건 실행 안 함
    </c:if>
    
    
     <!-- 
     	쿼리스트링 : get방식의 URL
     	쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=30&kind=soju 
      	쿼리스트링으로 URL 실행 => <!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=30&kind=soju 
      -->
	
	<!-- 위의 URL을 주소에 붙여넣어 실행해야 함! -->
	<b>[ 방법1) 표현식 출력 ]</b><br>
    <%
    	String name = request.getParameter("name");
    	int age = Integer.parseInt(request.getParameter("age"));
    	String kind = request.getParameter("kind");
    %>
    
    <!-- 퀴즈 : hong을 출력 -->
    이름 : <%= name %> <br>
    <!-- 퀴즈 : 30을 출력 -->
    나이 : <%= age %><br>
    <!-- 퀴즈 : soju을 출력 -->
    종목 : <%= kind %><br>

	<hr>

    <b>[ 방법2) EL태그 + core라이브러리 if문]</b><br>
    <!-- 퀴즈 : hong을 출력 -->
    <c:if test="${param.name == 'hong'}" >
    	이름 : ${param.name }
    </c:if><br>
    <!-- 퀴즈 : 30을 출력 -->
    <c:if test="${param.age == 30 }" >
    	나이 : ${param.age }
    </c:if><br>
    <!-- 퀴즈 : soju을 출력 -->
	<c:if test="${param.kind == 'soju' }" >
    	종목 : ${param.kind }
    </c:if><br>
    
    <br><hr><br>
    
	<!-- hong은 15세이므로 bear를 살수 없습니다.-->
	<!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=15&kind=bear -->
	<!-- 쿼리스트링 => http://localhost/jsp_ict05/09_jstl/3_jstl.jsp?name=hong&age=11&kind=bear -->
	<b>[ 방법1) 표현식 출력 ]</b><br>
    <%
    	String name1 = request.getParameter("name");
    	int age1 = Integer.parseInt(request.getParameter("age"));
    	String kind1 = request.getParameter("kind");
    	if(age1 >= 15) {
	%>
    <%=name1 %>은 <%=age %>세 이므로 <%=kind %>를 살 수 없습니다.
    <%
    	}else{
    		
    %>
    <%=name1 %>은 <%=age %>세 이므로 <%=kind %>를 살 수 있습니다.
    <%
    	}
    %>
    <br><br>
    <b>[ 방법2) EL태그 + core라이브러리 if문]</b><br>
    <c:if test="${param.age >= 15 }">
    	${param.name }은 ${param.age }세 이므로, ${param.kind }를 살 수 없습니다. 
    </c:if>
    <c:if test="${param.age < 15 }">
    	${param.name }은 ${param.age }세 이므로, ${param.kind }를 살 수 있습니다.
    </c:if>
    
    
</body>
</html>