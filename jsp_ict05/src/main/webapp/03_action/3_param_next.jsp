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
	// 이전페이지로부터 값을 받아와서 변수에 담는다
	String mName = request.getParameter("kind");
	String mReview = request.getParameter("review");
	
	// 파라미터 체크
	if(mName.equals("R")|mName.equals("r")){
		mName="로맨스";
	}else if(mName.equals("A")|mName.equals("a")){
		mName="액션";
	}else if(mName.equals("C")|mName.equals("c")){
		mName="코미디";
	}else if(mName.equals("H")|mName.equals("h")){
		mName="호러";
	}else if(mName.equals("M")|mName.equals("m")){
		mName="뮤지컬";
	}else if(mName.equals("SF")|mName.equals("sf")){
		mName="공상과학";
	}
	
	
	if( mReview.equals("1") ){
		mReview="별로";
	}else if( mReview.equals("2")){
		mReview="그저그래요";
	}
	else if(mReview.equals("3")){
		mReview="보통";
	}
	else if(mReview.equals("4")){
		mReview="좋아요";
	}
	else if(mReview.equals("5")){
		mReview="매우좋아요";
	}
%>	
	<!-- 페이지 전체를 include 해줬으니까 
	전페이지의 <tr>을 추가함 -->
	<tr>
		<td colspan="2">
			장르 : <%=mName %>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			리뷰 : <%=mReview %>
		</td>
	</tr>
	
</body>
</html>