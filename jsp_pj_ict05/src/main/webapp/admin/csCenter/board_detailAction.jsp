<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/common/setting.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>상세페이지</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/admin/ad_board_detailAction.css">
<link rel="stylesheet" href="${path}/resources/css/admin/ad_leftMenu.css">

<!--  js -->
<script src="https://kit.fontawesome.com/8760f92571.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바 스크립트를 실행해라 -> 페이지가 모두 로딩 된 후 외부 스크립트 실행 -->
<script src="${path}/resources/js/common/main.js" defer></script>

<script>
	$(function(){
		// <게시글목록> 버튼 클릭할 때 -> 컨트롤러의 목록으로 이동
		$('#btnList').click(function(){
			location.href="${path}/board_list.bc";
		});
		
		
		// <게시글 수정/삭제> 버튼 클릭 시 -> 게시글 수정삭제 화면으로 이동(컨트롤러에서 패스워드 체크 후)
		$('#btnEdit').click(function(){
			document.detailForm.action="${path}/password_chkAction.bc";		// 이 페이지로 이동후 
			document.detailForm.submit();	// submit 하라.
		});
		
	});

</script>


</head>
<body>

	<div class="wrap">
		<!-- header 시작 -->
		<%@ include file="/common/header.jsp" %>
		<!-- header 끝 -->
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<!-- 상단 중앙 1 시작 -->
				<div>
					<h1 align="center"> 게시판 상세페이지 </h1>
				</div>
				<!-- 상단 중앙 1 끝 -->
				
				<!-- 상단 중앙 2 시작 -->
				<div id="section2">
					<!-- 좌측 메뉴 시작 -->
					<%@ include file="/admin/common/leftMenu.jsp" %>
					<!-- 좌측 메뉴 끝 -->
					
					<!-- 우측 화면 시작 -->
					<div id="right">
						<div class="table_div">
							<form name="detailForm" method="post" >
								<table>
									<tr>
										<th>글번호</th>
										<td>${dto.b_num}</td>
										<th>조회수</th>
										<td>${dto.b_readCnt}</td>
										
									</tr>
									<tr>
										<th>작성자</th>
										<td>${dto.b_writer}</td>
										<th>비밀번호</th>
										<td>
											<input type="password" class="input" name="b_password"
												id="b_password" size="4" placeholder="비밀번호 4자리 입력" required>
												
												<c:if test="${param.message == 'error' }">
													<br> <span id="not_pwd">비밀번호 불일치</span> 
												</c:if>
										</td>
									</tr>
									<tr>
										<th> 글제목 </th>
										<td colspan="3"> ${dto.b_title } </td>
									</tr>
									<tr>
										<!-- 글 내용  -->
										<td colspan="4" id="content_box" style="height:500px">
											<div class="content_box">
												${dto.b_content}
											</div>
										</td>
									</tr>
									<tr>
										<th>작성일</th>
										<td colspan="3">${dto.b_regDate }</td>
									</tr>
									<tr>
										<td colspan="4">
											<!-- 게시글번호 hidden 추가 : 다음 처리에서 인증에 필요하지만, 넘겨줄 값을 받는 input이 없으므로 (게시글 번호는 입력받지 않기 때문에) -->
											<input type="hidden" name="hidden_b_num" value="${dto.b_num}">
											<input type="button" class="inputButton" value="수정/삭제" id="btnEdit">
											<input type="button" class="inputButton" value="목록" id="btnList">
										</td>
									</tr>
									
								</table>
							</form>
						</div>
					</div>
					<!-- 우측 화면 끝 -->
				</div>
				<!-- 상단 중앙 2 끝 -->
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		
		
		<!-- footer 시작 -->
		<%@ include file="/common/footer.jsp" %>
		<!-- footer 끝 -->
		
	</div>

</body>
