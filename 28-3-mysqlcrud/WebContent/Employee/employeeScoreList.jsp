<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			
			int no = Integer.parseInt(request.getParameter("no"));
			
			System.out.println(no +"<�����");
			
			EmployeeScore employeeScore = employeeScoreDao.selectEmployeeScore(no);
		%>
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���� ��ȣ</td>
				<td>����</td>
			</tr>
			<tr>
				<td><%= employeeScore.getEmployeeNo() %></td>
				<td><%= employeeScore.getEmployeeScoreNo() %></td>
				<td><%= employeeScore.getScore() %></td>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">��������</a>
	</body>
</html>