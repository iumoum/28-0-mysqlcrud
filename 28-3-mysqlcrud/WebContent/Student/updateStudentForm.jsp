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
		<form action="<%=request.getContextPath()%>/updateStudentAction.jsp" method="post">
			<table>
				<tr>
					<td>��ȣ</td>
					<td>�̸�</td>
					<td>����</td>
				</tr>
				<tr>
				<%
					String sendNo = request.getParameter("sendNo");
					StudentDao dao = new StudentDao();
					Student s = dao.studentUpdate(sendNo); 
				%>
					<td><input type="text" name="reNo" value="<%=s.getNo()%>" readonly></td>
					<td><input type="text" name="reName" value="<%=s.getName()%>"></td>
					<td><input type="text" name="reAge" value="<%=s.getAge()%>"><input type="hidden" name="studentNo" value= "<%=request.getParameter("send_no")%>"></td></td>
				</tr>
				<tr><td><input type="submit" value="����"></td></tr>
			</table>
		</form>
	</body>
</html>