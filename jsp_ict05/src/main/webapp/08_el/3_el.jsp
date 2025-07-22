<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request 객체( 매우 중요 ! )</title>
</head>
<body>
	
	<h3> 내장객체 - request 객체 </h3>
	
	<form action="3_el_next.jsp" method="get" name="userform">
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<th align="right"> 아이디 : </th>
				<td> <input type="text" name="user_id" size="30" autofocus></td>
			</tr>
			<tr>
				<th align="right"> 취미 : </th>
				<td> 
					<input type="checkbox" name="user_hobby" value="요리" >요리
					<input type="checkbox" name="user_hobby" value="그림" >그림
					<input type="checkbox" name="user_hobby" value="러닝" >러닝
					<input type="checkbox" name="user_hobby" value="수영" >수영
					<input type="checkbox" name="user_hobby" value="게임" >게임
					<input type="checkbox" name="user_hobby" value="베이킹" >베이킹
					<input type="checkbox" name="user_hobby" value="독서" >독서
					<input type="checkbox" name="user_hobby" value="코딩" >코딩
					<input type="checkbox" name="user_hobby" value="뜨개질" >뜨개질
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="확인">
					<input type="reset"	value="취소">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>