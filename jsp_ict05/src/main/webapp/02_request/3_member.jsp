<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 내장객체 - request 객체</title>
</head>
<body>
	<h3> 내장객체 - request 객체 </h3>
	<form action="3_member_next.jsp" method="post">
		<table border="1" cellspacing="0" cellpadding="10">
			<tr>
				<th align="right"> 아이디 : </th>
				<td><input type="text" name="userId" size="30" autofocus></td>			
			</tr>		
			<tr>
				<th align="right"> 비밀번호 : </th>
				<td><input type="password" name="userPwd" size="30"></td>			
			</tr>
			<tr>
				<th align="right"> 이메일 : </th>
				<td><input type="email" name="userEmail" size="30"></td>			
			</tr>
			<tr>
				<td align="right">전공 : </td>
				<td>
					<input type="radio" name="userMajor" value="kor"> 국문과
					<input type="radio" name="userMajor" value="eng"> 영문과
					<input type="radio" name="userMajor" value="com"> 컴공과
				</td>
			</tr>
			<tr>
				<td align="right">직업</td>
				<td>
					<select name="userJob">
						<option value="">직업을 선택하세요.</option>
						<option value="프리랜서/자영업">프리랜서/자영업</option>
						<option value="직장인">직장인</option>
						<option value="주부">주부</option>
						<option value="공무원">공무원</option>
						<option value="교사/교수">교사/교수</option>
						<option value="무직">무직</option>
						<option value="학생">학생</option>
					</select>
				</td>
			</tr>
			<tr>
				<td align="right">취미</td>
				<td>
					<input type="checkbox" name="userHobby" value="readbook">독서
					<input type="checkbox" name="userHobby" value="running">러닝
					<input type="checkbox" name="userHobby" value="art">그림
					<input type="checkbox" name="userHobby" value="game">게임
					<input type="checkbox" name="userHobby" value="baking">베이킹
					<input type="checkbox" name="userHobby" value="yarn">뜨개질
					<input type="checkbox" name="userHobby" value="null">선택안함
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
				<br><br>
				<div align="center">
					<input type="submit" value="확인">
					<input type="reset" value="취소">
				</div>
				</td>
			</tr>
		</table>
	</form>
	
	
	
</body>
</html>