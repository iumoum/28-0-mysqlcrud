<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Employee Address Form</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
					
					int employeeAddressNo = Integer.parseInt(request.getParameter("employeeAddressNo"));
					System.out.println("-----------------------------updateEmployeeAddressForm.jsp-----------------------------");
					System.out.println("employeeAddressList.jsp���� updateEmployeeAddressForm.jsp�� �Ѱ��� employeeAddressNo : " + employeeAddressNo);
				
					EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();		
					EmployeeAddress employeeAddress = employeeAddressDao.selectForUpdateEmployeeAddress(employeeAddressNo);
				%>
				<h1>Update Employee Address Form</h1>
				<form action="<%= request.getContextPath() %>/Employee/updateEmployeeAddressAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>�ּ� ��ȣ : <input type="text" name="employeeAddressNo" value="<%= employeeAddress.getEmployeeAddressNo() %>" readonly><td>
						</tr>
						<tr>
							<td>���� ��ȣ : <input type="text" name="employeeNo" value="<%= employeeAddress.getEmployeeNo() %>" readonly></td>
						</tr>
						<tr>
							<td>���� �ּ� : <input type="text" name="employeeAddressContent" value="<%= employeeAddress.getEmployeeAddressContent() %>"></td>
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