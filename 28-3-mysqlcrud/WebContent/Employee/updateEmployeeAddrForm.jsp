<!-- 2018-07-12 서연문 -->
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
					System.out.println("employeeAddrList.jsp에서 updateEmployeeAddrForm.jsp로 넘겨준 employeeAddrNo : " + employeeAddrNo);
				
					EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
					EmployeeAddr employeeAddr = employeeAddrDao.selectForUpdateEmployeeAddr(employeeAddrNo);
				%>
				<h1>Update Employee Addr Form</h1>
				<form action="<%= request.getContextPath() %>/Employee/updateEmployeeAddrAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>주소 번호 : <input type="text" name="employeeAddrNo" value="<%= employeeAddr.getEmployeeAddrNo() %>" readonly><td>
						</tr>
						<tr>
							<td>직원 번호 : <input type="text" name="employeeNo" value="<%= employeeAddr.getEmployeeNo() %>" readonly></td>
						</tr>
						<tr>
							<td>직원 주소 : <input type="text" name="employeeAddrContent" value="<%= employeeAddr.getEmployeeAddrContent() %>"></td>
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