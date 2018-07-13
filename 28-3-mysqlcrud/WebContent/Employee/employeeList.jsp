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
		<title>Employee List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
						
					String searchValue = "";
					if(request.getParameter("searchValue") != null){
						searchValue = request.getParameter("searchValue");
					}
									
					int currentPage = 1;
					int rowPerPage = 5;
							
					if(request.getParameter("currentPage") != null) {
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
					
					EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
					EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();					
					EmployeeDao employeeDao = new EmployeeDao();
				
					ArrayList<Employee> arrayListEmployee = employeeDao.selectEmployeeByPage(currentPage, rowPerPage, searchValue);
					
					int lastPage = employeeDao.countEmployeeTable(searchValue) / rowPerPage;
					if ((employeeDao.countEmployeeTable(searchValue) % rowPerPage) != 0) {
						lastPage++;
					}
				%>
				<h1>Employee List</h1><br>
				<div id="buttonForSearch">
					<form action="<%=request.getContextPath()%>/Employee/employeeList.jsp" method="post">
						<label>이름 :  
							<input type="text" name="searchValue">
						</label>
					</form>
				</div>
				<br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">직원 번호</th>
							<th>직원 이름</th>
							<th>직원 나이</th>
							<th>주소 입력</th>
							<th>점수 입력</th>
							<th>점수 보기 </th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
					<%
						for(int i=0; i<arrayListEmployee.size(); i++) {
							Employee employee = arrayListEmployee.get(i);			
							ArrayList<EmployeeAddr> arrayListEmployeeAddr = employeeAddrDao.selectEmployeeAddr(employee.getEmployeeNo());
					%>
							<tbody>
								<tr>
									<td><%= employee.getEmployeeNo() %></td>
									<%
										if(arrayListEmployeeAddr.size() != 0) {
									%>
											<td><a title="주소 보기" class="buttonToShowAddress" href="./employeeAddrList.jsp?employeeNo=<%= employee.getEmployeeNo() %>"><%= employee.getEmployeeName() %></a></td>
									<%
										} else {
									%>
											<td><%= employee.getEmployeeName() %></td>
									<%
										}
									%>		
									<td><%= employee.getEmployeeAge() %></td>
									<td><a title="주소 추가" class="buttonToInsertAddress" href="./insertEmployeeAddrForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">+ ADDRESS</a></td>
									<%
										EmployeeScore employeeScore = employeeScoreDao.selectEmployeeScore(employee.getEmployeeNo());
										if(employeeScore == null) {
									%>
											<td><a title="점수 입력" class="buttonToInsertScore" href="./insertEmployeeScoreForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">+ SCORE</a></td>
											<td></td>
									<%
										} else {
									%>
											<td></td>
											<td><a title="점수 확인" class="buttonToShowScore" href="./employeeScoreList.jsp?employeeNo=<%= employee.getEmployeeNo() %>">VIEW SCORE</a></td>	
									<%
										}
									%>
									<td><a title="직원 정보 수정" class="buttonToUpdateEntity" href="./updateEmployeeForm.jsp?employeeNo=<%= employee.getEmployeeNo() %>">UPDATE</a></td>
									<td><a title="직원 정보 삭제" class="buttonToDeleteEntity" href="./deleteEmployeeAction.jsp?employeeNo=<%= employee.getEmployeeNo() %>">DELETE</a></td>			
								</tr>
							</tbody>	
					<%
						} 
					%>
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
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; 이전</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; 이전</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Employee/employeeList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">다음 &gt;</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7;">다음 &gt;</span>
					<%
						}
					%>
				</div>			
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>