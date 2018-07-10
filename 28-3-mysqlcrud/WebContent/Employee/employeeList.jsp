<!-- 2018-07-03 서연문 -->
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
				<th>직원 번호</th>
				<th>직원 이름</th>
				<th>직원 나이</th>
				<th>주소 입력</th>
				<th>수  정</th>
				<th>삭  제</th>
				<th>점수 입력</th>
				<th>점수 보기 </th>
			</tr>
			<%
				for(int i=0; i<arrayListEmployee.size(); i++){
					Employee employee = arrayListEmployee.get(i);
			%>
			<tr>
				<td><%= employee.getEmployeeNo() %></td>
				<td><a href="./employeeAddrList.jsp?no=<%= employee.getEmployeeNo() %>"><%= employee.getEmployeeName() %></a></td>
				<td><%= employee.getEmployeeAge() %></td>
				<td><a href="./insertEmployeeAddrForm.jsp?no=<%= employee.getEmployeeNo() %>">주소 입력</a></td>
				<td><a href="./updateEmployeeForm.jsp?no=<%= employee.getEmployeeNo() %>">수정</a></td>
				<td><a href="./deletEmployeeAction.jsp?no=<%= employee.getEmployeeNo() %>">삭제</a></td>
				<td><a href="./insertEmployeeScoreForm.jsp?no=<%= employee.getEmployeeNo() %>">점수 입력</a></td>
				<td><a href="./employeeScoreList.jsp?no=<%= employee.getEmployeeNo()%>">점수 보기</a></td>
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
		<div>
			<form action="<%= request.getContextPath() %>/Employee/employeeList.jsp%>" method="post">
				이름 : <input type="text" name="searchValue">
				<button>검색</button>
			</form>
		</div>
	</body>
</html>