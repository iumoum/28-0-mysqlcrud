<!-- 2018-07-12 ������ -->
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
					System.out.println("employeeList.jsp���� employeeAddressList.jsp�� �Ѱ��� employeeNo : " + employeeNo);
				
					EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
					ArrayList<EmployeeAddress> arrayListEmployeeAddress = employeeAddressDao.selectEmployeeAddress(employeeNo);
				%>
				<h1>Employee Address List</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<th style="width:70px">�ּ� ��ȣ</th>
							<th>���� ��ȣ</th>
							<th>���� �ּ�</th>
							<th>�ּ� ����</th>
							<th>�ּ� ����</th>
						</tr>
					</thead>				
						<%
							System.out.println("�ش� ���� ��ȣ�� ���� ����� arrayListEmployeeAddress ���� ���� :" + arrayListEmployeeAddress.size());
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
					<a id="buttonToList" href="<%= request.getContextPath() %>/Employee/employeeList.jsp">�������</a>
				</div>
			</div>	
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>