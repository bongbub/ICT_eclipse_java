<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request 객체 매중!!(매우매우중요)</title>
</head>
<body>
	<h3> 내장객체 - request 객체</h3>
	<h2> 계산기 </h2>
	<hr>
	
	<form method="post" action="1_calc_next_re.jsp">
		<input type="text" name="num1" size="10">
		<select name="opr">
			<option>+</option>
			<option>-</option>
			<option>*</option>
			<option>/</option>
		</select>
		<input type="text" name="num2" size="10">
		<input type="submit" value="실행">
	</form>

</body>
</html>