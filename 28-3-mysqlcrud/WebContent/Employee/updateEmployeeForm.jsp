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
			int no = Integer.parseInt(request.getParameter("no"));
					
			EmployeeDao employeeDao = new EmployeeDao();
			Employee employee = employeeDao.selectForUpdateEmployee(no);			
		%>
		<form action="./updateEmployeeAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Employee</td>
				</tr>
				<tr>
					<td>���� ��ȣ : <input type="text" name="employeeNo" value="<%= employee.getEmployeeNo() %>" readonly></td>
				</tr>
				<tr>
					<td>���� �̸� : <input type="text" name="employeeName" value="<%= employee.getEmployeeName() %>"></td>
				</tr>
				<tr>
					<td>���� ���� : <input type="text" name="employeeAge" value="<%= employee.getEmployeeAge() %>"></td>
				</tr>
				<tr>
					<td colspan="2"><button>���</button></td>
				</tr>
			</table>
		</form>	
	
	</body>
</html>