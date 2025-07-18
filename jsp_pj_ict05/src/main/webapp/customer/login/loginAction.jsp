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
<link rel="stylesheet" href="/jsp_pj_ict05/resources/css/customer/login.css">

<!--  js -->
<script src="https://kit.fontawesome.com/8760f92571.js" crossorigin="anonymous"></script>

<script src="/jsp_pj_ict05/resources/js/customer/login.js" defer></script>
</head>
<body>
	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="../../common/header.jsp" %> 
		<!-- header 끝 -->
		 
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙 1 시작-->
				<div id="section1">
					<h1 align="center"> 로그인 </h1>
				</div>
				
				<!-- 상단 중앙 2 시작 -->
				<div id="section2">
					<div id="s2_inner">
						<div class="join">
							<form name="loginform" action="loginAction.do" method="post"
								onsubmit="return loginCheck()">
								
								<%
									String sessionID = (String)request.getSession().getAttribute("sessionID");
									
									// 세션이 없는 경우 : 로그인 실패
									if(sessionID == null){
								%>
										<script type="text/javascript">
										 	alert("◜  아이디 또는 비밀번호가 일치하지 않습니다.   ◝ \n ◟                                 ◞  ");
										 </script>
										 <table>
											<tr>
												<th> * 아이디 </th>
												<td>
													<input type="text" class="input" name="user_id" size="20" placeholder="공백없이 20자 이내" required autofocus>
													<input type="button" name="dubChk" value="중복확인" style="margin-left:10px" onclick="confirmId()">
												</td>
											</tr>
											<tr>
												<th> * 비밀번호 </th>
												<td>
													<input type="password" class="input" name="user_password" size="20" placeholder="공백없이 20자 이내" required>
												</td>
											</tr>
											<tr>
												<td colspan="2" style="border-bottom:none">
													<br>
													<div align="right">
														<input class="inputButton" type="submit" value="로그인">
														<input class="inputButton" type="reset" value="초기화">
														<input class="inputButton" type="button" value="회원가입" onclick="window.location='join.do'">
													</div>
												</td>
											</tr>
										</table>
										 
								<% 	}
									else{		// 세션이 있는 경우
									%>
										<table>
												<tr>
													<th colspan="2" align="center">
														<span style="color:black"><b> <%=sessionID %> 님, 돌아오신 것을 환영합니다!</b></span>
													</th>
												</tr>
												<tr>
													<td colspan="2" style="border-bottom:none">
														<br>
														<div align="right">
															<input class="inputButton" type="button" value="회원수정" onclick="window.location='/jsp_pj_ict05/modifyCustomer.do'">       
															<input class="inputButton" type="button" value="회원탈퇴" onclick="window.location='/jsp_pj_ict05/deleteCustomer.do'">
															<input class="inputButton" type="button" value="로그아웃" onclick="window.location='/jsp_pj_ict05/logout.do'">
														</div>
													</td>
												</tr>
											</table>
										<script type="text/javascript">
											alert("◜              로그인 성공!          ◝ \n ◟                                  ◞  ");
										</script>
								<% 
									}
								%>
								
								
							</form>
						</div>	<!-- join -->
					</div>
				</div>
				<!-- 상단 중앙 2 끝 -->
				
			</div>		
		</div>
		<!-- 컨텐츠 끝 -->
		
		
		<!-- footer 시작 -->
		<%@ include file="../../common/footer.jsp" %>
		<!-- footer 끝 -->
		
	</div>

</body>
</html>