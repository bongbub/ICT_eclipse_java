<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="useBean.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>forEach 매우매우매우매ㅐ우 중요</title>
</head>
<body>
<%
	// MemberInfo를 가져와서 2명의 정보를 추가하고, list에 담아 출력하기
	// 작은 바구니 - dto 생성
	MemberInfo dto = new MemberInfo();
	
	// setter로 값담기
	dto.setAddress("집게리아");
	dto.setEmail("money@gmail.com");
	dto.setId("money");
	dto.setName("집게사장");
	dto.setPassword("ehswntpdy");
	dto.setRegisterDate(new Date());
	
	// 큰바구니(ArrayList 즉, 전체 회원정보) 생성 후 작은바구니(개별) 추가
		List<MemberInfo> list = new ArrayList<MemberInfo>();
	list.add(dto);
	MemberInfo dto2 = new MemberInfo();
	dto2.setAddress("네모레스토랑");
	dto2.setEmail("hhh@gmail.com");
	dto2.setId("plpl");
	dto2.setName("플랑크톤");
	dto2.setPassword("vmffkdzmxhs");
	dto2.setRegisterDate(new Date());
	
	
	list.add(dto2);
	// jsp 페이지로 값 전달 - key:memberList
	request.setAttribute("memberList",list);
	
	// requestdispatcher로 forward
	String viewPage = "7_jstl_next_re.jsp";
	RequestDispatcher dis = request.getRequestDispatcher(viewPage);
	dis.forward(request, response);
 %>
</body>
</html>