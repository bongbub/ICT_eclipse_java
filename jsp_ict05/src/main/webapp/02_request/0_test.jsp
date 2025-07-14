<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험</title>
</head>
<body>
   <h3> 내장객체 - request 객체 </h3>
   <form action="0_test_next.jsp" method="post">
      <table border="1" cellspacing="0" cellpadding="10">
         <tr>
            <th align="right"> 아이디 : </th>
            <td><input type="text" name="m_id" size="30" autofocus></td>
         </tr>
         
         <tr>
            <th align="right"> 비밀번호 : </th>
            <td><input type="password" name="m_pwd" size="30"></td>
         </tr>
      
         <tr>
            <th align="right"> 이메일 : </th>
            <td><input type="email" name="m_email" size="50"></td>
         </tr>
         
         <tr>
            <th align="right"> 전공 : </th>
            <td>
               <input type="radio" name="m_major" value="국문과"> 국문과
               <input type="radio" name="m_major" value="영문과"> 영문과
               <input type="radio" name="m_major" value="컴공과"> 컴공과
            </td>
         </tr>
         
         <tr>
            <th align="right"> 직업 : </th>
            <td>
               <select name="m_job">
                  <option value=""> 직업선택 </option>
                  <option value="programmer"> 프로그래머 </option>
                  <option value="chef"> 요리사 </option>
                  <option value="ceo"> CEO </option>
                  <option value="barista"> 바리스타 </option>
               </select>
            </td>
         </tr>
         
         <tr>
            <th align="right"> 취미 : </th>
            <td>
               <input type="checkbox" name="m_hobby" value="cook">요리
               <input type="checkbox" name="m_hobby" value="swimming">수영
               <input type="checkbox" name="m_hobby" value="reading">독서
               <input type="checkbox" name="m_hobby" value="coding">코딩
            </td>
         </tr>
         
         <tr>
            <td colspan="2">
               <br><br>
               <div align="center">
                  <input type="submit" value="전송">
                  <input type="reset" value="취소">
               </div>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>