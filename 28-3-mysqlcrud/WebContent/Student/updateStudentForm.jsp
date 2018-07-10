<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<form action="<%=request.getContextPath()%>/Student/updateStudentAction.jsp" method="post">
			<table>
				<tr>
					<td>번호</td>
					<td>이름</td>
					<td>나이</td>
				</tr>
				<tr>
				<%
					String sendNo = request.getParameter("send_no");
					System.out.println(sendNo);
					Student s = null;
					StudentDao dao = new StudentDao();
					s = dao.studentUpdate(sendNo); 
					
					int studentNo = s.getNo();
					String studentName = s.getName();
					int studentAge = s.getAge();
				%>
					
					<td><input type="text" name="reNo" value="<%=studentNo%>" readonly></td>
					<td><input type="text" name="reName" value="<%=studentName%>"></td>
					<td><input type="text" name="reAge" value="<%=studentAge%>"></td>
				</tr>
				<tr><td><input type="submit" value="수정"></td></tr>
			</table>
		</form>
	</body>
</html>