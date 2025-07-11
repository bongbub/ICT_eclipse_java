<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1부터 10까지 합을 스크립트릿으로 출력</title>
</head>
<body>
	== (방법1)1부터 10까지의 합을 스크립트릿으로 출력 ==<br>
	<%
		int sum =0;
		for(int i=1; i<= 10; i++){
			sum += i;
		}
		out.println("1부터 10까지의 합 : "+ sum);
	%><br>
	<% int sums = 55; 
	
	out.println("1부터 10까지의 합 :"+ sums);
	
	%><br>
	<hr>
	== (방법2)1부터 10까지의 합을 표현식으로 출력 ==<br>
	
	1부터 10까지의 합 : <%=sums %><br>
	
	<hr>
	== (방법3)1부터 10까지의 합을 선언부로 선언 후 표현식으로 출력 ==<br> 
	
	<%!
		public int sum2(){
		int hap = 0;
			for(int i=0; i<=10; i++){
				hap = hap+i;
			}
			return hap;
		}
	%>
	1부터 10까지의 합 : <%= sum2() %><br>
	
	쌤 방법<br>
	<%!
		int sum2 = 0;
		public int add(int num1, int num2){
			for(int i=num1; i<= num2; i++){
				sum2 += i;
			}
			return sum2;
		}
	%>
	1부터 10까지의 합 : <%= add(1,10) %>
	
	
</body>
</html>