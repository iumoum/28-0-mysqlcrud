<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee List Above Avg</title>
	</head>
	<body>
		<h1>Employee List Above Avg</h1>
		<%
			request.setCharacterEncoding("euc-kr");
		
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			int scoreAvg = employeeScoreDao.selectScoreAvg();
			
			ArrayList<EmployeeAndScore> arrayListEmployeeAndScore = new ArrayList<EmployeeAndScore>();
			arrayListEmployeeAndScore = employeeScoreDao.selectEmployeeListAboveAvg();
			System.out.println(arrayListEmployeeAndScore + "<<<<-----");
		%>
		<div>
			��� : <%= scoreAvg %>
		</div>
		<table>
			<thead>
				<tr>
					<th>���� ��ȣ</th>
					<th>���� �̸�</th>
					<th>���� ��ȣ</th>
					<th>����</th>
				</tr>
			</thead>
			<tbody>
				<%
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
	</body>
</html>