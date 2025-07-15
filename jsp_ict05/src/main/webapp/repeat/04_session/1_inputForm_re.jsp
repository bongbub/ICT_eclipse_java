<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 화면</title>
<style>
	fieldset{
		max-width: 400px;
		margin:15px 10px;
	}
	legend{
		font-size:18px;
		font-weight:bold;
		color:green;
	}
</style>
</head>
<body>

	<form action="2_agreement_re.jsp" method="post">
		<fieldset>
			<legend> 회원가입 </legend>
			<table border="1" cellspacing="0" cellpadding="10">
				<tr>
					<td align="right"> 아이디 </td>
					<td><input type="text" name="user_id" size="30" autofocus required placeholder="아이디를 입력하세요"></td>
				</tr>
				<tr>
					<td align="right">비밀번호</td>
					<td><input type="text" name="user_pwd" size="30" required placeholder="비밀번호를 입력하세요"></td>
				</tr>
				<tr>
					<td align="right">이름</td>
					<td><input type="text" name="user_name" size="30" required placeholder="이름을 입력하세요"></td>
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