<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="2_include_file.jsp" method="get">
		<table border="1">
		
			<tr>
				<td align="right"> 이름</td>
				<td><input type="text" name="user_name" size="20"></td>
			</tr>
			<tr>
				<td align="right"> 나이</td>
				<td><input type="text" name="user_age" size="3"></td>
			</tr>
			<tr>
				<td align="right"> 모바일</td>
				<td><input type="text" name="user_hp" size="15"></td>
			</tr>
			<tr>
				<td colspan="2">
					<br><br>
					<div align="center">
						<input type="submit" value="전송">
						<input type="reset" value="취소">
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>