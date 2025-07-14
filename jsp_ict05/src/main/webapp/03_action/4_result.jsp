<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>3page</title>
</head>
<body>
	<%
		// 한글 처리
		request.setCharacterEncoding("UTF-8");
	
		// 이전페이지로부터 값을 받아서 변수에 담기
		String name = request.getParameter("name1");
		String bcol = request.getParameter("backcolor");
		String fcol = request.getParameter("fontcolor");
		String scol = request.getParameter("shadowcolor");
		
	%>

	<!-- 표현식으로 css 속성값 출력, css 적용 -->
	<!-- <p style="속성명 : 속성값(=표현식)"> -->
	<p style="background-color : <%= bcol%>; color : <%=fcol %>; text-shadow:1px 1px <%=scol %>">
		반갑습니다, <%=name %>님!
	</p>
</body>
</html>