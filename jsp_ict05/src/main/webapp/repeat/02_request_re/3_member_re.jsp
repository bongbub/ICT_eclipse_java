<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내장객체 - request 객체</title>
</head>
<body>
	<h3>내장객체 - request 객체</h3>
	<form action="2_member_next_re.jsp" method="post">
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<th align="right">아이디 : </th>
				<td><input type="text" name="userId" size="30" autofocus>
				</td>
			</tr>
			<tr>
				<th align="right">비밀번호 : </th>
				<td><input type="password" name="userPwd" size="30" >
				</td>
			</tr>
			<tr>
				<th align="right">이메일 : </th>
				<td><input type="email" name="userEmail" size="30" >
				</td>
			</tr>
			<tr>
				<th align="right"> 전공</th>
				<td>
					<input type="radio" name="userMajor" value="국문과">국문과
					<input type="radio" name="userMajor" value="영문과">영문과
					<input type="radio" name="userMajor" value="컴공과">컴공과
				</td>
			</tr>
			<tr>
				<th align="right">직업</th>
				<td>
					<select name= userJob>
						<option value="">직업을 선택하세요</option>
						<option value="직장인">직장인</option>
						<option value="프리랜서/자영업자">프리랜서/자영업자</option>
						<option value="공무원">공무원</option>
						<option value="학생">학생</option>
						<option value="무직">무직</option>
						<option value="주부">주부</option>
						<option value="교사/교수">교사/교수</option>
					</select>
				</td>
			</tr>
			<tr>
				<th align="right">취미</th>
				<td>
					<input type="checkbox" value="러닝" name="userHobby">러닝
					<input type="checkbox" value="그림" name="userHobby">그림
					<input type="checkbox" value="게임" name="userHobby">게임
					<input type="checkbox" value="베이킹" name="userHobby">베이킹
					<input type="checkbox" value="축구" name="userHobby">축구
					<input type="checkbox" value="뜨개질" name="userHobby">뜨개질
					<input type="checkbox" value="넷플리스시청" name="userHobby">넷플리스시청
					<input type="checkbox" value="선택안함" name="userHobby">선택안함
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<br>
				<input type="submit" value="확인">
				<input type="reset" value="취소">
			</tr>
		</table>
	</form>
</body>
</html>