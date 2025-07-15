<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  input명과 멤버변수명과 테이블의 컬럼명은 동일해야한다 -->
	<form action="3_useBean_next.jsp" method="post">
		<fieldset>
			<legend> 회원가입 </legend>
			<table border = "1" cellspacing="0" cellpadding="10">
				<tr>
					<td align="right"> 아이디 </td>
					<td><input type="text" name="id" size="30" autofocus required placeholder="아이디 입력"></td>
				</tr>
				<tr>
					<td align="right"> 패스워드 </td>
					<td><input type="password" name="password" size="30" required placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td align="right"> 이름 </td>
					<td><input type="text" name="name" size="30"  required placeholder="이름 입력"></td>
				</tr>
				<tr>
					<td align="right"> 주소 </td>
					<td><input type="text" name="address" size="50"  required placeholder="주소 입력"></td>
				</tr>
				<tr>
					<td align="right"> 이메일 </td>
					<td><input type="text" name="email" size="50"  required placeholder="이메일 입력"></td>
				</tr>
				<tr>
					<td colspan="2">
						<div align="center">
							<input type="submit" value="전송">
							<input type="reset" value="취소">
						</div>
					</td>
				</tr>
			</table>
		</fieldset>
	</form>
</body>
</html>