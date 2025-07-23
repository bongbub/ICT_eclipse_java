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

<title>boardList</title>

<!-- css -->
<link rel="stylesheet" href="${path}/resources/css/common/header.css">
<link rel="stylesheet" href="${path}/resources/css/common/footer.css">
<link rel="stylesheet" href="${path}/resources/css/admin/ad_boardList.css">

<!--  js -->
<script src="https://kit.fontawesome.com/8760f92571.js" crossorigin="anonymous"></script>

<!-- (3-4). 자바스크립트 소스 연결 -->
<!-- defer : html을 다 읽은 후에 자바 스크립트를 실행해라 -> 페이지가 모두 로딩 된 후 외부 스크립트 실행 -->
<script src="${path}/resources/js/common/main.js" defer></script>
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
					<h1 align="center"> 게시판 목록 </h1>
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
							<form name="boardList" >
								<table>
									<tr>
										<th>글번호</th>
										<th>작성자</th>
										<th>글제목</th>
										<th>작성일</th>
										<th>조회수</th>
									</tr>
									
									<!-- 게시글이 있으면 -->
									<c:forEach var="dto" items="${list}">
										<tr>
											<td>${dto.b_num}</td>
											<td>${dto.b_writer}</td>
											<td>${dto.b_title}</td>
											<td>${dto.b_regDate}</td>
											<td>${dto.b_readCnt}</td>
										</tr>
									</c:forEach>
									
									<!-- 페이지 번호와 버튼 -->
									<tr>
										<td colspan="5" align="center">
											<ul class="pagination">
												<!-- 페이징 처리 -->
												<!-- 이전 버튼 활성화 -->
												
												
												<!-- 페이지 번호 처리 -->
												<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">	<!-- paging=>serviceimpl에서 넘겨준 참조변수, 의 멤버변수 호출 -->
													<li>
														
													</li>
												</c:forEach>
												
												
												<!-- 다음 버튼 활성화 -->
												
												
												
											</ul>
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
