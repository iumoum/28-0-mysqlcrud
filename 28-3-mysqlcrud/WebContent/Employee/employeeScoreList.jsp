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
			
			System.out.println(no +"<노오오");
			
			EmployeeScore employeeScore = employeeScoreDao.selectEmployeeScore(no);
		%>
		<table border="1">
			<tr>
				<td>직원 번호</td>
				<td>점수 번호</td>
				<td>점수</td>
			</tr>
			<tr>
				<td><%= employeeScore.getEmployeeNo() %></td>
				<td><%= employeeScore.getEmployeeScoreNo() %></td>
				<td><%= employeeScore.getScore() %></td>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">이전으로</a>
	</body>
</html>