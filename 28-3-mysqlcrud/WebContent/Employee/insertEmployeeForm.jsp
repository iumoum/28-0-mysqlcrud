<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/insertEntity.css">
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Form</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<form action="<%= request.getContextPath() %>/Employee/insertEmployeeAction.jsp" method="post">
					<h1>Insert Employee Form</h1>
					<br><br>
					<table border="1">
						<tr>
							<td>���� �̸� : <input type="text" name="employeeName"></td>
						</tr>
						<tr>
							<td>���� ���� : <input type="text" name="employeeAge"></td>
						</tr>
						<tr>
							<td colspan="2"><button>���</button></td>
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