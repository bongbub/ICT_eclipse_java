<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>action - param</title>
</head>
<body>
	<table border="1" cellspacing="0" cellpadding="10">
		<tr>
			<th>영화제목</th>
			<td>겨울왕국</td>
		</tr>
		<tr>
			<th>상영관</th>
			<td>롯데시네마</td>
		</tr>
		<jsp:include page="3_param_next_re.jsp">
			<jsp:param value="m" name="kind"/>
			<jsp:param value="5" name="review"/>
		</jsp:include>
	</table>

</body>
</html>