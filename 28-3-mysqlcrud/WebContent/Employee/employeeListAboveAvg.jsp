<!-- 2018-07-12 서연문 -->
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
				<div>평균 : <%= scoreAvg %></div>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">직원 번호</th>
							<th style="width:120px">직원 이름</th>
							<th style="width:70px">점수 번호</th>
							<th style="width:120px">점 수</th>
						</tr>
					</thead>
					<tbody>
					<%
						System.out.println("평균 이상의 점수를 가진 사람의  arrayListEmployeeAndScore 행의 수 :" + arrayListEmployeeAndScore.size());
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
					<a id="buttonToList" href="<%= request.getContextPath() %>/Employee/employeeList.jsp">목록으로</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>