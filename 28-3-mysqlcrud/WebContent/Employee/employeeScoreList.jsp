<!-- 2018-07-12 서연문 -->
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
					System.out.println("employeeList.jsp에서 employeeScoreList.jsp로 넘겨준 employeeNo : " + employeeNo);
				
					EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();			
					EmployeeAndScore employeeAndScore = employeeScoreDao.selectEmployeeAndScore(employeeNo);
				%>
				<h1>Employee Score List</h1>
				<br><br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">직원 번호</th>
							<th style="width:120px">직원 이름</th>
							<th style="width:120px">점수</th>
							<th style="width:120px">수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><%= employeeAndScore.getEmployee().getEmployeeNo() %></td>
							<td><%= employeeAndScore.getEmployee().getEmployeeName() %></td>
							<td><%= employeeAndScore.getEmployeeScore().getScore() %></td>
							<td><a title="점수 정보 수정" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Employee/updateEmployeeScoreForm.jsp?employeeNo=<%= employeeAndScore.getEmployee().getEmployeeNo() %>">UPDATE</a></td>
						</tr>
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