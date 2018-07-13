<!-- 2018-07-13 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Employee Addr List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
					
					int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
					System.out.println("-----------------------------employeeAddrList.jsp-----------------------------");
					System.out.println("employeeList.jsp에서 employeeAddrList.jsp로 넘겨준 employeeNo : " + employeeNo);
				
					EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
					ArrayList<EmployeeAddr> arrayListEmployeeAddr = employeeAddrDao.selectEmployeeAddr(employeeNo);
				%>
				<h1>Employee Addr List</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<th style="width:70px">주소 번호</th>
							<th>직원 번호</th>
							<th>직원 주소</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>				
						<%
							System.out.println("해당 직원 번호를 가진 사람의 arrayListEmployeeAddr 행의 갯수 :" + arrayListEmployeeAddr.size());
							for(int i = 0; i < arrayListEmployeeAddr.size(); i++){
						%>
							<tr>
								<td><%= arrayListEmployeeAddr.get(i).getEmployeeAddrNo() %></td>
								<td><%= arrayListEmployeeAddr.get(i).getEmployeeNo() %></td>
								<td><%= arrayListEmployeeAddr.get(i).getEmployeeAddrContent() %></td>
								<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Employee/updateEmployeeAddrForm.jsp?employeeAddrNo=<%= arrayListEmployeeAddr.get(i).getEmployeeAddrNo() %>">UPDATE</a></td>
								<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Employee/deleteEmployeeAddrAction.jsp?employeeAddrNo=<%= arrayListEmployeeAddr.get(i).getEmployeeAddrNo() %>">DELETE</a></td>
							</tr>
						<%
							}
						%>
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