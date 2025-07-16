package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


// http://localhost/jsp_ict05/MemberServlet
@WebServlet("/MemberServlet")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		System.out.println(" FirstServlet - <<< doGet() 호출 >>>");
		response.setContentType("text/html; charset=UTF-8");
		
		// 한글 안 깨지게 처리
		request.setCharacterEncoding("UTF-8");
		
		// jsp에서 넘어온 값을 읽어와, 변수에 담는다 (==>이건 나중에 서비스에서 할거임)
		String strID = request.getParameter("userID");
		String strName = request.getParameter("userName");
		String strEmail = request.getParameter("userEmail");
		
		PrintWriter out = response.getWriter();
		
		// 출력 스트림 PrintWriter의 print() 메서드를 사용하여 웹브라우저에 출력한다. 
		out.print("<html>");
		out.print("<head>");
		out.print("<title>서블릿</title>");
		out.print("</head>");
		out.print("<body>");
		out.print("<h3> 회원정보 서블릿 페이지 </h3>");
		out.print("현재시간은 ");
		out.print(new Date()+"<br>");
		out.print("ID : "+strID+"<br>");
		out.print("이름 : "+strName+"<br>");
		out.print("이메일 : "+strEmail+"<br>");
		out.print("</body>");
		out.print("</html>");
	}
		

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(" <<< doPost() >>>");
		doGet(request, response);
		
	}

}
