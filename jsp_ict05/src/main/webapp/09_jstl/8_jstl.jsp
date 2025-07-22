<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="useBean.BookDTO"%>
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
		// BookDTO에 2개의 정보를 추가하고, list에 담아 출력하기
		BookDTO mer = new BookDTO();
		BookDTO ser = new BookDTO();	
		
		mer.setBookId(1);
		mer.setAuthor("오르카");
		mer.setTitle("어계메");
		mer.setPrice(14600);
		mer.setPubdate("20250601");
		mer.setPublisher("캐럿스튜디오");
		
		ser.setBookId(2);
		ser.setAuthor("코난");
		ser.setTitle("소년탐정김전일");
		ser.setPrice(13000);
		ser.setPubdate("19990811");
		ser.setPublisher("몰라");
		
		List<BookDTO> list = new ArrayList<BookDTO>();
		list.add(mer);
		list.add(ser);
		
		// 작은바구니(dto)생성 => 개별
		request.setAttribute("list", list);
		
		String viewPage ="8_jstl_next.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
	
	%>

</body>
</html>