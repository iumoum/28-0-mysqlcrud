<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Employee Addr Form</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
					
					int employeeAddrNo = Integer.parseInt(request.getParameter("employeeAddrNo"));
					System.out.println("-----------------------------updateEmployeeAddrForm.jsp-----------------------------");
					System.out.println("employeeAddrList.jsp���� updateEmployeeAddrForm.jsp�� �Ѱ��� employeeAddrNo : " + employeeAddrNo);
				
					EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
					EmployeeAddr employeeAddr = employeeAddrDao.selectForUpdateEmployeeAddr(employeeAddrNo);
				%>
				<h1>Update Employee Addr Form</h1>
				<form action="<%= request.getContextPath() %>/Employee/updateEmployeeAddrAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>�ּ� ��ȣ : <input type="text" name="employeeAddrNo" value="<%= employeeAddr.getEmployeeAddrNo() %>" readonly><td>
						</tr>
						<tr>
							<td>���� ��ȣ : <input type="text" name="employeeNo" value="<%= employeeAddr.getEmployeeNo() %>" readonly></td>
						</tr>
						<tr>
							<td>���� �ּ� : <input type="text" name="employeeAddrContent" value="<%= employeeAddr.getEmployeeAddrContent() %>"></td>
						</tr>
						<tr>		
							<td colspan="2"><button>����</button></td>
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