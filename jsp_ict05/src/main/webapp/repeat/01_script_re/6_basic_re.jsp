<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
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
		int hour = date.getHours();
		int min = date.getMinutes();
		int sec = date.getSeconds();
		
		// 현재시간 오후 4시 38분 출력
		if(hour >= 12){
			out.print("오후");
		}
		else{
			out.print("오전");
		}
		out.println(hour + "시");
		out.println(min + "분");
		out.println(sec + "초");
	%>
	<br><br>
	<%
		String result = (hour >= 12) ? "오후" : "오전";
		out.println("현재 : " + result + "<br>");
		out.println("현재 시각 : "+result +"" + (hour-12)+"시 "+min +"분 "+sec + "초");
	%>
	
	<hr>
	
	<%! public int getBigNumber(int a, int b){
		int result = (a>b) ? a: b;
		return result;
	}
	%>
	
	두 개의 숫자 중에 큰 숫자는 ? <%= getBigNumber(3, 8) %>
	
</body>
</html>