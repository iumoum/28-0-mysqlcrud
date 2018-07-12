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
		<title>Employee Address List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
					
					int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
					System.out.println("-----------------------------employeeAddressList.jsp-----------------------------");
					System.out.println("employeeList.jsp에서 employeeAddressList.jsp로 넘겨준 employeeNo : " + employeeNo);
				
					EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
					ArrayList<EmployeeAddress> arrayListEmployeeAddress = employeeAddressDao.selectEmployeeAddress(employeeNo);
				%>
				<h1>Employee Address List</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<th style="width:70px">주소 번호</th>
							<th>직원 번호</th>
							<th>직원 주소</th>
							<th>주소 수정</th>
							<th>주소 삭제</th>
						</tr>
					</thead>				
						<%
							System.out.println("해당 직원 번호를 가진 사람의 arrayListEmployeeAddress 행의 갯수 :" + arrayListEmployeeAddress.size());
							for(int i = 0; i < arrayListEmployeeAddress.size(); i++){
						%>
							<tr>
								<td><%= arrayListEmployeeAddress.get(i).getEmployeeAddressNo() %></td>
								<td><%= arrayListEmployeeAddress.get(i).getEmployeeNo() %></td>
								<td><%= arrayListEmployeeAddress.get(i).getEmployeeAddressContent() %></td>
								<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Employee/updateEmployeeAddressForm.jsp?employeeAddressNo=<%= arrayListEmployeeAddress.get(i).getEmployeeAddressNo() %>">UPDATE</a></td>
								<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Employee/deleteEmployeeAddressAction.jsp?employeeAddressNo=<%= arrayListEmployeeAddress.get(i).getEmployeeAddressNo() %>">DELETE</a></td>
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