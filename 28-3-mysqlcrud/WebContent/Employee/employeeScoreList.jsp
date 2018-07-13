<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee Score List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
				
					int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
					System.out.println("-----------------------------employeeScoreList.jsp-----------------------------");
					System.out.println("employeeList.jsp���� employeeScoreList.jsp�� �Ѱ��� employeeNo : " + employeeNo);
				
					EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();			
					EmployeeAndScore employeeAndScore = employeeScoreDao.selectEmployeeAndScore(employeeNo);
				%>
				<h1>Employee Score List</h1>
				<br><br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th style="width:120px">���� �̸�</th>
							<th style="width:120px">����</th>
							<th style="width:120px">����</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%= employeeAndScore.getEmployee().getEmployeeNo() %></td>
							<td><%= employeeAndScore.getEmployee().getEmployeeName() %></td>
							<td><%= employeeAndScore.getEmployeeScore().getScore() %></td>
							<td><a title="���� ���� ����" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Employee/updateEmployeeScoreForm.jsp?employeeNo=<%= employeeAndScore.getEmployee().getEmployeeNo() %>">UPDATE</a></td>
						</tr>
					</tbody>	
				</table>
				<br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Employee/employeeList.jsp">�������</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>