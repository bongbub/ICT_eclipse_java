<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>main</title>

<!-- css -->
<link rel="stylesheet" href="/jsp_pj_ict05/resources/css/common/header.css">
<link rel="stylesheet" href="/jsp_pj_ict05/resources/css/common/footer.css">
<link rel="stylesheet" href="/jsp_pj_ict05/resources/css/customer/join.css">

<!--  js -->
<script src="https://kit.fontawesome.com/8760f92571.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바 스크립트를 실행해라 -> 페이지가 모두 로딩 된 후 외부 스크립트 실행 -->
<script src="/jsp_pj_ict05/resources/js/common/main.js" defer></script>
</head>
<body>
	<div class="wrap"> 
		<!-- header 시작 -->
		<%@ include file="../../../common/header.jsp" %>	<!--  mypage/customer/webapp/common/header.jsp -->
		<!-- header 끝 -->
		 
		<!-- 컨텐츠 시작 -->
		<%
			int deleteCnt = (Integer)request.getAttribute("deleteCnt");
			int selectCnt = (Integer)request.getAttribute("selectCnt");
			out.print("test :"+selectCnt);
			
			if(deleteCnt == 1){
		%>
			<script type="text/javascript">
				alert("회원탈퇴 성공!");
				window.location="/jsp_pj_ict05/main.do";
			</script>
		<%		
			}
			else {
				if(selectCnt == 0){
				%>	
					<script type="text/javascript">
						alert("회원인증 실패");
						window.location = "/jsp_pj_ict05/deleteCustomer.do";
					</script>
			
				<%	
				}else if(deleteCnt == 0){
				%>
					<script type="text/javascript">
					alert("회원탈퇴 실패");
					window.location = "/jsp_pj_ict05/deleteCustomer.do";
					</script>
			<%
				}
			}
			
		%>
		<!-- 컨텐츠 끝 -->
		
		
		<!-- footer 시작 -->
		<%@ include file="../../../common/footer.jsp" %>
		<!-- footer 끝 -->
	</div>
</body>
</html>