<%@page import="java.util.Date"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="test.BoardCommentDTO"%>
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
		BoardCommentDTO dto = new BoardCommentDTO();
	
		dto.setC_board_num(1);
		dto.setC_comment_num(1);
		dto.setC_content("안녕하세요 선생님 안녕 친구야 인사하는 어린이 착한 어린이");
		dto.setC_writer("짱구");
		dto.setC_regDate(new Date());
	
		List<BoardCommentDTO> list = new ArrayList<BoardCommentDTO>();
		
		list.add(dto);
		out.print(dto);
		
		BoardCommentDTO dto2 = new BoardCommentDTO();
		
		dto2.setC_board_num(2);
		dto2.setC_comment_num(2);
		dto2.setC_content("동그라미땡동그라미땡완두콩에싹이나서");
		dto2.setC_writer("도라에몽");
		dto2.setC_regDate(new Date());
		
		list.add(dto2);
		out.print(dto2);
		
		request.setAttribute("list", list);
		
		String viewPage = "7_23_test_next.jsp";
		RequestDispatcher dis = request.getRequestDispatcher(viewPage);
		dis.forward(request, response);
		
	%>
	
	
	
	

	

</body>
</html>