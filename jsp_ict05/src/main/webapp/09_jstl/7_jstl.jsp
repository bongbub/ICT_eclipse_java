<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach - 매우 중요!!!!!!!!!!!!!!!!!!!!</title>
</head>
<body>

<%
	// MemberInfo를 가져와서 2명의 정보를 추가하고, list에 담아 출력하기
	// 작은 바구니 - dto 생성
	MemberInfo mem = new MemberInfo();
	
	
	// setter로 값을 담고
	mem.setId("test1");
	mem.setPassword("qlqjs");
	mem.setName("스폰지밥");
	mem.setAddress("비키니시티 4번지");
	mem.setEmail("sponge@naver.com");
	mem.setRegisterDate(new Date());
	
	// 큰바구니(ArrayList 즉, 전체 회원정보) 생성 후 작은바구니(개별) 추가
	List<MemberInfo> list = new ArrayList<MemberInfo>();
	list.add(mem);
	
	MemberInfo mem2 = new MemberInfo();
	mem2.setId("test2");
	mem2.setPassword("qlqjs2");
	mem2.setName("징징이");
	mem2.setAddress("비키니시티 3번지");
	mem2.setEmail("zing@naver.com");
	mem2.setRegisterDate(new Date());
	list.add(mem2);
	
	// jsp 페이지로 값 전달 - key:memberList
	request.setAttribute("memberList", list);
	
	// requestdispatcher로 forward
	String viewPage = "7_jstl_next.jsp";
	RequestDispatcher dis = request.getRequestDispatcher(viewPage);
	dis.forward(request, response);
	
%>

</body>
</html>