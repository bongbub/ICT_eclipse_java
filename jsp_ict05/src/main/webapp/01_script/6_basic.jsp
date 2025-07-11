<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현식 활용</title>
</head>
<body>

	<%
		// 현재시간 출력
	Date date = new Date();
	int hours = date.getHours();
	int min = date.getMinutes();
	int sec = date.getSeconds();
		
	// 현재시간 오후 12:51 출력
	if(hours >= 12){
		out.print("오후 ");
		
	}else{
		out.print("오전 ");
	}
	out.print(hours + "시 ");
	out.print(min+"분 ");
	out.print(sec+"초");
	%>
	
	<hr>
	
	<!-- 3항 연산자 => 결과 = (조건식) ? 참값 : 거짓값;  -->

	<%
	String hresult = (hours >= 12) ? "오후 " : "오전 ";
	out.print(hresult + "" + (hours-12)+"시 "+min + "분 "+ sec +"초");
	%>

	
	<hr>
	<%! public int getBigNumber(int a, int b){
		int result = (a > b) ? a : b;
		return result;
	}
	%>
	
	
	
	두 개의 숫자 중에 큰 숫자는? <%= getBigNumber(7,25) %>
	
	
	
</body>
</html>