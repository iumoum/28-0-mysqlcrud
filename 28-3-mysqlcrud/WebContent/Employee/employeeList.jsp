<!-- 2018-07-03 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%	
			String searchValue = "";
			if(request.getParameter("searchValue") != null) {
				searchValue = request.getParameter("searchValue");
			}
			System.out.println(searchValue +"<searchValue");
			
			int currentPage = 1;
			int rowPerPage = 5;
			if(request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
					
			EmployeeDao employeeScoreDao = new EmployeeDao();
			ArrayList<Employee> arrayListEmployee = employeeScoreDao.selectEmployeeByPage(currentPage, rowPerPage, searchValue);
			
			int lastPage = employeeScoreDao.countEmployeeTable() / rowPerPage;
			if ((employeeScoreDao.countEmployeeTable() % rowPerPage) != 0) {
				lastPage++;
			}		
		%>	
		<table border="1">
			<tr>
				<th>���� ��ȣ</th>
				<th>���� �̸�</th>
				<th>���� ����</th>
				<th>�ּ� �Է�</th>
				<th>��  ��</th>
				<th>��  ��</th>
				<th>���� �Է�</th>
				<th>���� ���� </th>
			</tr>
			<%
				for(int i=0; i<arrayListEmployee.size(); i++){
					Employee employee = arrayListEmployee.get(i);
			%>
			<tr>
				<td><%= employee.getEmployeeNo() %></td>
				<td><a href="./employeeAddrList.jsp?no=<%= employee.getEmployeeNo() %>"><%= employee.getEmployeeName() %></a></td>
				<td><%= employee.getEmployeeAge() %></td>
				<td><a href="./insertEmployeeAddrForm.jsp?no=<%= employee.getEmployeeNo() %>">�ּ� �Է�</a></td>
				<td><a href="./updateEmployeeForm.jsp?no=<%= employee.getEmployeeNo() %>">����</a></td>
				<td><a href="./deletEmployeeAction.jsp?no=<%= employee.getEmployeeNo() %>">����</a></td>
				<td><a href="./insertEmployeeScoreForm.jsp?no=<%= employee.getEmployeeNo() %>">���� �Է�</a></td>
				<td><a href="./employeeScoreList.jsp?no=<%= employee.getEmployeeNo()%>">���� ����</a></td>
			</tr>
			<%
				}
			%>
		</table>
		<div>
			<%
				if(currentPage > 1) {
			%>
					<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage - 1 %>"> ����</a>
			<%
				} else {
			%>
					<span>����</span>
			<%
				}
			
				if(currentPage < lastPage) {
			%>	
					<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage + 1 %>"> ����</a>
			<%
				} else {
			%>
					<span>����</span>
			<%
				}
			%>					
		</div>
		<div>
			<form action="<%= request.getContextPath() %>/Employee/employeeList.jsp%>" method="post">
				�̸� : <input type="text" name="searchValue">
				<button>�˻�</button>
			</form>
		</div>
	</body>
</html>