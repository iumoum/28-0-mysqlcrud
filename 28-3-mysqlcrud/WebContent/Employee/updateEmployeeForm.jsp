<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Employee Form</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
				
					int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
					System.out.println("-----------------------------updateEmployeeForm.jsp-----------------------------");
					System.out.println("employeeList.jsp���� updateEmployeeForm.jsp�� �Ѱ��� employeeNo : " + employeeNo);
							
					EmployeeDao employeeDao = new EmployeeDao();
					Employee employee = employeeDao.selectForUpdateEmployee(employeeNo);			
				%>
				<h1>Update Employee Form</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Employee/updateEmployeeAction.jsp" method="post">
					<table border="1">
						<tr>
							<td colspan="2">Update Employee Form</td>
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
				<br>
				<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">�������</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>	
	</body>
</html>