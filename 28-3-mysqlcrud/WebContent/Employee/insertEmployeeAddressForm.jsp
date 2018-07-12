<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Address Form</title>
	</head>
	<body>
		<%	
			System.out.println("-----------------------------insertEmployeeAddressForm.jsp-----------------------------");
			System.out.println("employeeList.jsp���� insertEmployeeAddressForm.jsp�� �Ѱ��� employeeNo : "+request.getParameter("employeeNo"));
		%>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<h1>Insert Employee Address Form</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Employee/insertEmployeeAddressAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>�ּ� : </td>
							<td><input type="text" name="employeeAddressContent"></td>
						</tr>
						<tr>		
							<td colspan="2">
								<input type="hidden" name="employeeNo" value="<%= request.getParameter("employeeNo") %>">
								<input type="submit" value="���">
							</td>			
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">�������</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>