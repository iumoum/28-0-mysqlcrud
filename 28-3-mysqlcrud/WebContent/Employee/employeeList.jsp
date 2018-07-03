<!-- 2018-07-02 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAddrDao" %>
<%@ page import="service.EmployeeAddr" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.EmployeeDao" %>
<%@ page import="service.Employee" %>
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
		
		<table border="1">
			<tr>
				<td>직원 번호</td>
				<td>직원 이름</td>
				<td>직원 나이</td>
				<td>주소 입력</td>
				<td>수  정</td>
				<td>삭  제</td>
			</tr>
			<%
				for(int i=0; i<arrayListEmployee.size(); i++){
					Employee employee =  arrayListEmployee.get(i);
			%>
			<tr>
				<td><%= employee.getEmployeeNo() %></td>
				<td><a href="./employeeAddrList.jsp?no=<%= employee.getEmployeeNo() %>"><%= employee.getEmployeeName() %></a></td>
				<td><%= employee.getEmployeeAge() %></td>
			<%	
				EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
				EmployeeAddr employeeAddr = employeeAddrDao.selectEmployeeAddr(employee.getEmployeeNo());
				if(employeeAddr == null){
					
			%>
					<td><a href="./employeeAddrInsertForm.jsp?no=<%= employee.getEmployeeNo() %>">주소 입력</a></td>
			<%
				} else{
			%>
					<td></td>
			<%
				}
			%>
				<td><a href="./employeeUpdatForm.jsp?no=<%= employee.getEmployeeNo() %>">수정</a></td>
				<td><a href="./employeeDeletAction.jsp?no=<%= employee.getEmployeeNo() %>">삭제</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<div>
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage - 1 %>"> 이전</a>
			<%
				} else {
			%>
					<span>이전</span>
			<%
				}
			
				if(currentPage < lastPage) {
			%>	
					<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage + 1 %>"> 다음</a>
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