<!-- 2018-07-13 ������ -->
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
					System.out.println("employeeList.jsp���� employeeAddrList.jsp�� �Ѱ��� employeeNo : " + employeeNo);
				
					EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
					ArrayList<EmployeeAddr> arrayListEmployeeAddr = employeeAddrDao.selectEmployeeAddr(employeeNo);
				%>
				<h1>Employee Addr List</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<th style="width:70px">�ּ� ��ȣ</th>
							<th>���� ��ȣ</th>
							<th>���� �ּ�</th>
							<th>����</th>
							<th>����</th>
						</tr>
					</thead>				
						<%
							System.out.println("�ش� ���� ��ȣ�� ���� ����� arrayListEmployeeAddr ���� ���� :" + arrayListEmployeeAddr.size());
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
					<a id="buttonToList" href="<%= request.getContextPath() %>/Employee/employeeList.jsp">�������</a>
				</div>
			</div>	
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>