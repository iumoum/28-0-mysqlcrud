<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee List Above Avg</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
				
					EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
					int scoreAvg = employeeScoreDao.selectScoreAvg();
					
					ArrayList<EmployeeAndScore> arrayListEmployeeAndScore = new ArrayList<EmployeeAndScore>();
					arrayListEmployeeAndScore = employeeScoreDao.selectEmployeeListAboveAvg();
				%>
				<h1>Employee List Above Avg</h1>
				<div>��� : <%= scoreAvg %></div>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th style="width:120px">���� �̸�</th>
							<th style="width:70px">���� ��ȣ</th>
							<th style="width:120px">�� ��</th>
						</tr>
					</thead>
					<tbody>
					<%
						System.out.println("��� �̻��� ������ ���� �����  arrayListEmployeeAndScore ���� �� :" + arrayListEmployeeAndScore.size());
						for(int i=0; i<arrayListEmployeeAndScore.size(); i++) {
							EmployeeAndScore employeeAndScore = arrayListEmployeeAndScore.get(i);
					%>
							<tr>
								<td><%= arrayListEmployeeAndScore.get(i).getEmployee().getEmployeeNo() %></td>
								<td><%= arrayListEmployeeAndScore.get(i).getEmployee().getEmployeeName() %></td>
								<td><%= arrayListEmployeeAndScore.get(i).getEmployeeScore().getEmployeeScoreNo() %></td>
								<td><%= arrayListEmployeeAndScore.get(i).getEmployeeScore().getScore() %></td>
							</tr>
					<%
						}
					%>		
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