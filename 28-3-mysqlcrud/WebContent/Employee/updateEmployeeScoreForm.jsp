<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Employee Score Form</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
				
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();		
			EmployeeScore employeeScore = employeeScoreDao.selectEmployeeScore(Integer.parseInt(request.getParameter("employeeNo")));
		%>
		<form action="./updateEmployeeScoreAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Update Employee Score Form</td>
				</tr>
				<tr>
					<td>���� ��ȣ : <input type="text" name="employeeScoreNo" value="<%= employeeScore.getEmployeeScoreNo() %>" readonly><td>
				</tr>
				<tr>
					<td>���� ��ȣ : <input type="text" name="employeeNo" value="<%= employeeScore.getEmployeeNo() %>" readonly></td>
				</tr>
				<tr>
					<td>���� ���� : <input type="text" name="Score" value="<%= employeeScore.getScore() %>"></td>
				</tr>
				<tr>		
					<td colspan="2">
						<button>���</button>
					</td>			
				</tr>
			</table>
		</form>	
	</body>
</html>