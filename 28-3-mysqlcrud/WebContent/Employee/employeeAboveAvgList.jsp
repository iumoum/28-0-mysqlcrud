<!-- 2018-07-13 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee Above Avg List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
				
					int currentPage = 1;
					int rowPerPage = 10;
							
					if(request.getParameter("currentPage") != null) {
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
					
					EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
					int scoreAvg = employeeScoreDao.selectScoreAvg();
					
					ArrayList<EmployeeAndScore> arrayListEmployeeAndScore = new ArrayList<EmployeeAndScore>();
					arrayListEmployeeAndScore = employeeScoreDao.selectEmployeeAboveAvg(currentPage, rowPerPage);
					
					int lastPage = employeeScoreDao.countEmployeeAboveAvgTable() / rowPerPage;
					if ((employeeScoreDao.countEmployeeAboveAvgTable() % rowPerPage) != 0) {
						lastPage++;
					}
					
				%>
				<h1>Employee Above Avg List</h1>
				<br><br>
				<div>��� : <%= scoreAvg %></div>
				<div>��� �̻��� ������ �� : <%= employeeScoreDao.countEmployeeAboveAvgTable() %></div>
				<br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th style="width:120px">���� �̸�</th>
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
								<td><%= arrayListEmployeeAndScore.get(i).getEmployeeScore().getScore() %></td>
							</tr>
					<%
						}
					%>		
					</tbody>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>/Employee/insertEmployeeForm.jsp">+ EMPLOYEE</a>
				</div>
				<br><br>
				<div id="page">
					<span><%= currentPage %> / <%= lastPage %></span>
				</div>
				<br>
				<div id="buttonForAnotherPage">
					<%
						if(currentPage > 1){
					%>
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Employee/employeeAboveAvgList.jsp?currentPage=<%= currentPage - 1 %>">&lt; ����</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; ����</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Employee/employeeAboveAvgList.jsp?currentPage=<%= currentPage + 1 %>">���� &gt;</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7;">���� &gt;</span>
					<%
						}
					%>
				</div>	
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Employee/employeeList.jsp">�������</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>