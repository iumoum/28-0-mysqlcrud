<!-- 2018-07-02 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Employee" %>
<%@ page import="service.EmployeeDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int currentPage = 1;
			int pagePerRow = 5;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
					
			EmployeeDao employeeDao = new EmployeeDao();
			ArrayList<Employee> arrayListEmployee = employeeDao.selectEmployeeByPage(currentPage, pagePerRow);
			
			int lastPage = employeeDao.countEmployeeTable() / pagePerRow;
			if ((employeeDao.countEmployeeTable() % pagePerRow) != 0) {
				lastPage++;
			}
		%>
		
		<table>
			<tr>
				<td>직원 번호</td>
				<td>직원 이름</td>
				<td>직원 나이</td>
			</tr>
			<%
				for(int i=0; i<arrayListEmployee.size(); i++){
					Employee employee =  arrayListEmployee.get(i);
			%>
			<tr>
				<td><%= employee.getEmployeeNo() %></td>
				<td><%= employee.getEmployeeName() %></td>
				<td><%= employee.getEmployeeAge() %></td>
			</tr>
			<%
				}
			%>
		</table>
		<div>
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/Employee/eList//employeeList.jsp?currentPage=<%= currentPage - 1 %>"> 이전</a>
			<%
				} else {
			%>
					<span>이전</span>
			<%
				}
			
				if(currentPage < lastPage) {
			%>	
					<a href="<%= request.getContextPath() %>/Employee/eList/employeeList.jsp?currentPage=<%= currentPage + 1 %>"> 다음</a>
			<%
				} else {
			%>
					<span>다음</span>
			<%
				}
			%>					
		</div>
	</body>
</html>