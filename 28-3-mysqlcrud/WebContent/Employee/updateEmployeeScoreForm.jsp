<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<title>Update Employee Score Form</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">	
				<%
					request.setCharacterEncoding("euc-kr");
					
					int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
					System.out.println("-----------------------------updateEmployeeScoreForm.jsp-----------------------------");
					System.out.println("employeeScoreList.jsp���� updateEmployeeScoreForm.jsp�� �Ѱ��� employeeNo : " + employeeNo);
				
					EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();		
					EmployeeScore employeeScore = employeeScoreDao.selectEmployeeScore(employeeNo);
				%>
				<h1>Update Employee Score Form</h1>
				<form action="<%= request.getContextPath() %>/Employee/updateEmployeeScoreAction.jsp" method="post">
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