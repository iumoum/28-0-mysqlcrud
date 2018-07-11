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
				<td>직원 번호</td>
				<td>점수 번호</td>
				<td>점 수</td>
				<td>점수 수정</td>
			</tr>
			<tr>
				<td><%= employeeScore.getEmployeeNo() %></td>
				<td><%= employeeScore.getEmployeeScoreNo() %></td>
				<td><%= employeeScore.getScore() %></td>
				<td><a href="<%= request.getContextPath() %>/Employee/updateEmployeeScoreForm.jsp?employeeNo=<%= employeeScore.getEmployeeNo() %>">점수 수정</a>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">이전으로</a>
	</body>
</html>