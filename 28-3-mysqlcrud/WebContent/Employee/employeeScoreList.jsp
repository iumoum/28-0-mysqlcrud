<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee Score List</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
		
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();			
			EmployeeScore employeeScore = employeeScoreDao.selectEmployeeScore(employeeNo);
		%>
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���� ��ȣ</td>
				<td>�� ��</td>
				<td>���� ����</td>
			</tr>
			<tr>
				<td><%= employeeScore.getEmployeeNo() %></td>
				<td><%= employeeScore.getEmployeeScoreNo() %></td>
				<td><%= employeeScore.getScore() %></td>
				<td><a href="<%= request.getContextPath() %>/Employee/updateEmployeeScoreForm.jsp?employeeNo=<%= employeeScore.getEmployeeNo() %>">���� ����</a>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">��������</a>
	</body>
</html>