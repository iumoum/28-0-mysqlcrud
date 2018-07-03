<!-- 2018-07-02 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAddr" %>
<%@ page import="service.EmployeeAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
			EmployeeAddr employeeAddr = employeeAddrDao.selectEmployeeAddr(Integer.parseInt(request.getParameter("no")));
		%>
		<div>
			<table border="1">
				<tr>
					<td>주소 번호</td>
					<td>직원 번호</td>
					<td>상세 주소</td>
					<td>수  정</td>
					<td>삭  제</td>
				</tr>			
				<tr>
					<td><%= employeeAddr.getEmployeeAddrNo() %></td>
					<td><%= employeeAddr.getEmployeeNo() %></td>
					<td><%= employeeAddr.getEmployeeContent() %></td>
					<td><a href="./employeeAddrUpdatForm.jsp?no=<%= employeeAddr.getEmployeeNo() %>">수정</a></td>
					<td><a href="./employeeAddrDeletAction.jsp?no=<%= employeeAddr.getEmployeeNo() %>">삭제</a></td>
				</tr>		
			</table>	
		</div>
	</body>
</html>