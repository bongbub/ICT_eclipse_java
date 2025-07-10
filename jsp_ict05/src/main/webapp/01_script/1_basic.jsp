<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp교재 176p 스크립트 요소★★★★</title>
</head>
<body>

	<h3> 스크립트 요소 </h3>
	<b> 1. 스크립트릿 - 자바코드를 삽입</b><br>
	
	
	-HTML 태그 안에 JAVA 코드를 삽입하겠다 <br><br>
	
	<%-- 주석 주의 (( !-- HTML 주석과 주의 -->))
						HTML을 주석처리하면 안됨. 
		<%
			자바코드1;
			자바코드2;
		%>	
	--%>
	
	
	<%
	String name = "아이유";
	int age = 30; 
	String id = "iu";
	String password = "iu_1234";
	int salary = 3000;
	String email = "iu@naver.com";
	
	// System.out.println("name :" + name); -> 이렇게 하면 콘솔로 나옴 System을 내장객체로 인식
	// out : 내장객체로서, 서블릿으로 변환시 컴파일 시점에 자동으로 객체 생성함
	out.print("[ 1. 실행결과(스크립트릿) ]" + "<br>");
	out.println("name :" + name + "<br>");
	out.println("name : " + name + "<br>" 
					+ "age :" + age +"<br>"
					+ "id : " + id + "<br>"
					+ "password :" + password +"<br>"
					+ "salary : " + salary + "<br>"
					+ "email :" + email +"<br>");
	 %>
	 
	 <br><br>
	 <hr>
	 <br><br>
	 <b> 2. 표현식(Expression) </b><br>
	 - HTML에서 값을 출력한다. 값은 변수나 메서드가 올 수 있다. <br>
	 - 문장의 끝에 ';'을 붙이면 에러가 발생한다. <br>
	 - 스크립트 안에서는 out.print(); 를 사용 가능하다. 
	 
	 <%-- <%= 변수 %> --%>
	 <br><br>
	 [2. 실행결과(Expression)]<br>
	 이름 : <%=name%>  <br>
	 나이 : <%= age %> <br>
	 아이디 : <%= id %> <br>
	 비밀번호 : <%= password%> <br>
	 급여 : <%= salary %> <br>
	 이메일 : <%=email %> <br>
	 
</body>
</html>