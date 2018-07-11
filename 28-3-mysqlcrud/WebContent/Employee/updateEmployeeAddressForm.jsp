<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Employee Address Form</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
	
			EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();		
			EmployeeAddress employeeAddress = employeeAddressDao.selectForUpdateEmployeeAddress(Integer.parseInt(request.getParameter("employeeAddressNo")));
		%>
		<form action="./updateEmployeeAddrAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Update Employee Address Form</td>
				</tr>
				<tr>
					<td>주소 번호 : <input type="text" name="employeeAddressNo" value="<%= employeeAddress.getEmployeeAddressNo() %>" readonly><td>
				</tr>
				<tr>
					<td>직원 번호 : <input type="text" name="employeeNo" value="<%= employeeAddress.getEmployeeNo() %>" readonly></td>
				</tr>
				<tr>
					<td>직원 주소 : <input type="text" name="employeeAddressContent" value="<%= employeeAddress.getEmployeeAddressContent() %>"></td>
				</tr>
				<tr>		
					<td colspan="2">
						<button>등록</button>
					</td>			
				</tr>
			</table>
		</form>	
	</body>
</html>