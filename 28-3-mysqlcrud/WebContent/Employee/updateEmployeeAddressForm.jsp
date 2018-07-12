<!-- 2018-07-12 서연문 -->
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
					System.out.println("employeeAddressList.jsp에서 updateEmployeeAddressForm.jsp로 넘겨준 employeeAddressNo : " + employeeAddressNo);
				
					EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();		
					EmployeeAddress employeeAddress = employeeAddressDao.selectForUpdateEmployeeAddress(employeeAddressNo);
				%>
				<h1>Update Employee Address Form</h1>
				<form action="<%= request.getContextPath() %>/Employee/updateEmployeeAddressAction.jsp" method="post">
					<table border="1">
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
							<td colspan="2"><button>수정</button></td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">목록으로</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>