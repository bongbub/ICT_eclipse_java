<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 교재 176p 스크립트 요소(중요)</title>
</head>
<body>
	<h3> 스크립트 요소 </h3>
	<b> 1. 스크립트릿 - 자바코드를 삽입</b>
	-HTML태그 안에 JAVA 코드를 삽입하겠다<br><br>
	
	<%
	String name="아이유";
	int age=30;
	String id="iu";
	String password="iu_1234";
	int salary=3000;
	String email = "iu@gmail.com";
	
	out.println("[1. 실행결과(스크립트릿) ]<br>");
	out.println("name : " + name + "<br>"
			+ "age : "+age +"<br>"
			+"id : "+id +"<br>"
			+"password :" + password +"<br>"
			+ "salary :" + salary +"<br>"
			+ "email : " + email +"<br>");
	%>
	<br><hr>
	<br>
	
	<b>2. 표현식(Expression)</b><br>
	- HTML에서 값을 출력한다. 값은 변수나 메서드가 올 수 있다.<br>
	- 문장의 끝에 ';'를 붙이면 에러가 발생한다.<br>
	- 스크립트 안에서는 out.print(); 를 사용할 수 있다.<br>
	<br>
	
	[2. 실행결과(Expression)]<br>
	이름 : <%= name %>
	나이 : <%= age %>
	아이디 : <%= id %>
	비밀번호 : <%= password %>
	급여 :  <%= salary %>
	이메일 :<%= email %>
	
	<hr><br><br>
	
	<b>3. 선언부(Declaration)</b>
	- 변수, 자바메서드를 선언한다.<br>
	
	<%!
	public int divide(int num1, int num2){
		return num1/num2;
	}
	%>
	실행결과
	8/4 =  <%= divide(8,4) %>
	
	
	
</body>
</html>