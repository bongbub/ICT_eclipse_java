package useBean;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// http://localhost/컨텍스트명/서블릿명
// http://localhost/jsp_ict05/FirstSevlet  --> 진입루트
@WebServlet("/FirstSevlet")		
public class FirstServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FirstServlet() {
        super();
    }
    
    // HttpServletRequest => 클라이언트의 요청정보 저장
    // HttpServletResponse => 응답정보를 저장한다.
    // 기본은 doGet()
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {	// 상위Exception으로 예외를 던져 처리함
		
		System.out.println(" FirstServlet - <<< doGet() 호출 >>>");
		response.setContentType("text/html; charset=UTF-8");
		
		/*
		 * PrintWriter : 웹브라우저에 HTML로 출력하기 위한 출력 스트림
		 * 서블릿은 자바파일이기 때문에, 응답을 위한 HTML 코드가 없음.
		 * PrintWriter라는 출력스트림을 만들어서 HTML 코드를 작성한다.
		 */
		
		PrintWriter out = response.getWriter();
		
		// 출력 스트림 PrintWriter의 print() 메서드를 사용하여 웹브라우저에 출력한다. 
		out.print("<html>");
		out.print("<head>");
		out.print("<title>서블릿</title>");
		out.print("/head");
		out.print("<body>");
		out.print("<h3> 회원정보 서블릿 페이지 </h3>");
		out.print("현재시간은 ");
		out.print(new Date());
		out.print("</body>");
		out.print("</html>");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		System.out.println(" FirstServlet - <<< doPost() 호출 >>>");
		doGet(request, response);
		

	}

}
