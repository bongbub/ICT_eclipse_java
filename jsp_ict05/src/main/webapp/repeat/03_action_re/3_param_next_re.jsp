<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	String genre = request.getParameter("kind");
	String review = request.getParameter("review");
	
	if(genre.equals("R")|genre.equals("r")){
		genre = "로맨스";
	}else if(genre.equals("A")|genre.equals("a")){
		genre = "액션";
	}else if(genre.equals("C")|genre.equals("c")){
		genre = "코미디";
	}else if(genre.equals("H")|genre.equals("h")){
		genre = "호러";
	}else if(genre.equals("M")|genre.equals("m")){
		genre = "뮤지컬";
	}
	else if(genre.equals("SF")|genre.equals("sf")){
		genre = "공상과학";
	}
	
	if(review.equals("1")){
		review="별로";
	}else if(review.equals("2")){
		review="그저그래요";
	}else if(review.equals("3")){
		review="보통";
	}
	else if (review.equals("4")){
		review="좋아요";
	}
	else if(review.equals("5")){
		review="매우좋아요";
	}
%>
<tr>
	<td colspan="2">
		장르 : <%=genre %><br>
	</td>
</tr>
<tr>
	<td colspan="2">
		리뷰 : <%=review %><br>
	</td>
</tr>
</body>
</html>