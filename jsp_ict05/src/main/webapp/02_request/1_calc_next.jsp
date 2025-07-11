<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 페이지</title>
</head>
<body>

<%
	int ival1 = Integer.parseInt(request.getParameter("num1"));
	int ival2 = Integer.parseInt(request.getParameter("num2"));
	int result = 0;
	
	switch(request.getParameter("opr")){
	case "+" : result = ival1 + ival2;
	break;
	case "-" : result = ival1 - ival2;
	break;
	case "*" : result = ival1 * ival2;
	break;
	case "/" : result = ival1 / ival2;
	break;
	}
	%>
	
ival1 => <%= ival1 %><br>
ival2 => <%= ival2 %><br>
result => <%= result %><br>



</body>
</html>