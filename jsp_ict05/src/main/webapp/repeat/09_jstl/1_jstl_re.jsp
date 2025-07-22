<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
	<h3>JSTL(JSP Standard Tag Library) - core 라이브러리 - 변수지원 태그</h3>
	<pre>
      JSP의 경우 HTML 태그와 같이 사용하므로, 전체적인 코드의 가독성이 떨어지므로,
      이 단점을 보완하기 위해 태그라이브러리인 JSTL을 이용한다.
      jstl.jar, standard.jar를 WEB-INF/lib 폴더에 추가해야 한다.
   </pre>
    <br><br>
     <%--
      변수지원 태그 - <c:set var="변수명"  value="값" /> 태그
      var : 값을 지정할 EL 변수명을 지정한다.
      value : 변수의 값을 지정한다.
            1) 표현식 : <%= value %>
            2) EL : ${변수}  |  ${key} |  ${key.value}
            3) 정적인 문자열 : "문자열"
    --%>

</body>
</html>