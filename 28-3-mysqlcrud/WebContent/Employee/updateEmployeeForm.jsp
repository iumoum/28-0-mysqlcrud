<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Employee Form</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
					
			EmployeeDao employeeDao = new EmployeeDao();
			Employee employee = employeeDao.selectForUpdateEmployee(employeeNo);			
		%>
		<form action="./updateEmployeeAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Update Employee Form</td>
				</tr>
				<tr>
					<td>직원 번호 : <input type="text" name="employeeNo" value="<%= employee.getEmployeeNo() %>" readonly></td>
				</tr>
				<tr>
					<td>직원 이름 : <input type="text" name="employeeName" value="<%= employee.getEmployeeName() %>"></td>
				</tr>
				<tr>
					<td>직원 나이 : <input type="text" name="employeeAge" value="<%= employee.getEmployeeAge() %>"></td>
				</tr>
				<tr>
					<td colspan="2"><button>등록</button></td>
				</tr>
			</table>
		</form>		
	</body>
</html>