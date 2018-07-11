<!-- 2018-07-02 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<title>Employee Address List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					request.setCharacterEncoding("euc-kr");
				
					EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
					ArrayList<EmployeeAddress> arrayListEmployeeAddress = employeeAddressDao.selectEmployeeAddress(Integer.parseInt(request.getParameter("employeeNo")));
					
				%>
				<h1>Employee Address</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<td>주소 번호</td>
							<td>직원 번호</td>
							<td>직원 주소</td>
							<td>수  정</td>
							<td>삭  제</td>
						</tr>
					</thead>				
						<%
							System.out.println(arrayListEmployeeAddress.size() + "<== size");
							for(int i = 0; i < arrayListEmployeeAddress.size(); i++){
						%>
							<tr>
								<td><%= arrayListEmployeeAddress.get(i).getEmployeeAddressNo() %></td>
								<td><%= arrayListEmployeeAddress.get(i).getEmployeeNo() %></td>
								<td><%= arrayListEmployeeAddress.get(i).getEmployeeAddressContent() %></td>
								<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Teacher/updateTeacherAddrForm.jsp?teacherAddressNo=<%= arrayListEmployeeAddress.get(i).getEmployeeAddressNo() %>">UPDATE</a></td>
								<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Teacher/deleteTeacherAddrAction.jsp?teacherAddressNo=<%= arrayListEmployeeAddress.get(i).getEmployeeAddressNo() %>">DELETE</a></td>
							</tr>
						<%
							}
						%>
				</table>
				<br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">목록으로</a>
				</div>
			</div>	
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>