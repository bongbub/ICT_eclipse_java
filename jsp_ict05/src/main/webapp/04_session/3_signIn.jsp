<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import ="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 처리 페이지</title>
</head>
<body>
	
<%
	String strAgree = request.getParameter("agree");
	//out.print("strAgree = " + strAgree + "<br>"); 
	
	
	String result = "";
	// 동의한 경우
	if(strAgree.equals("YES")){
		// 세션에서 입력한 값들을 받아온다.
		// 세션값 읽기 : session.getAttribute("속성");  // 리턴타입이 Object
		String s_id = (String)session.getAttribute("session_id");	// 다운캐스팅
		String s_pwd = (String)session.getAttribute("session_pwd");
		String s_name = (String)session.getAttribute("session_name");
		
		// out 으로 출력
		out.print(" == 회원가입 정보 == <br>" );
		out.print("s_id :" + s_id +"<br>");
		out.print("s_pwd :" + s_pwd +"<br>");
		out.print("s_name :" + s_name +"<br>");
		
		// 톰캣 기본 경로 : C:\apache-tomcat-9.0.97 \wtpwebapps
       	// 나머지 세션 저장 경로 : \jsp_ict05\WEB-INF\저장한 이름.txt
       	// C:\apache-tomcat-9.0.97\wtpwebapps\jsp_ict05\WEB-INF
         
       	/*
        1) 톰캣환경 설정(톰캣 더블클릭) : Server Locations > 2번째 옵션 선택
        Server Options > 2,3번째 옵션이 선택되어 있어야 위 경로로 설정됨
        server path ==>  C:\apache-tomcat-9.0.97      deploy path ==> wtpwebapps
       */
        // cf) 톰캣 기본경로 :D:\Dev\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp번호
		
		// 서버에 저장 
		PrintWriter writer = null;
        
		try{
			String filepath = application.getRealPath("/WEB-INF/" + s_name + ".txt");
			writer = new PrintWriter(filepath);  // new 시점에 매개변수로 경로를 들고온다. 해당 파일에 작성한다는 뜻
			
			writer.println("=== 세션 정보 ===");
			writer.println("세션 아이디 : " + session.getId());
			writer.println("세션 최초 생성 시각 :" + new Date(session.getCreationTime()));
			writer.println("세션 최초 접근 시각 : " + new Date(session.getLastAccessedTime()));
			writer.println("최초 세션 유효 시간 : " + session.getMaxInactiveInterval());	// 1800초
			session.setMaxInactiveInterval(10 * 60);		// 세션의 유효시간을 10분으로 재설정
			writer.println("수정된 세션 유효 시간 : " + session.getMaxInactiveInterval());	// 1800초

			
			if(session.isNew()){
				writer.println(" 새 세션이 생성되었습니다. ");
			}
			writer.println("== 가입정보 == ");
			writer.println("아이디 : "+ s_id);
			writer.println("비밀번호 : "+ s_pwd);
			writer.println("이름 : "+ s_name);
			writer.println("------------------");
			
			result = "SUCCESS";
			// 여기까지 파일에 작성한 것임.
			
		}catch(IOException e){
			result = "FAIL";
		}finally{
			try{
				writer.close();		// 닫아줘야 writer 작업이 끝남 -> 닫지 않으면 파일만 생성되고 내용은 안 생김
			}
			catch(Exception e){
				e.printStackTrace();
			}
		}
	}
	// 동의안함의 경우
	else{
		result = "FAIL";
	}
	
	out.print("result :"+ result);
	
	
	// 세션 종료
	session.invalidate();
	
	// result 값을 갖고, 4_result.jsp로 이동해라
	response.sendRedirect("./4_result.jsp?result="+ result);
%>

</body>
</html>