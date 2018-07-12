<!-- 2018-07-12 서연문 -->
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
					System.out.println("employeeScoreList.jsp에서 updateEmployeeScoreForm.jsp로 넘겨준 employeeNo : " + employeeNo);
				
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
							<td>점수 번호 : <input type="text" name="employeeScoreNo" value="<%= employeeScore.getEmployeeScoreNo() %>" readonly><td>
						</tr>
						<tr>
							<td>직원 번호 : <input type="text" name="employeeNo" value="<%= employeeScore.getEmployeeNo() %>" readonly></td>
						</tr>
						<tr>
							<td>직원 점수 : <input type="text" name="Score" value="<%= employeeScore.getScore() %>"></td>
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