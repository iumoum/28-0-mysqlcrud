<!-- 2018-07-12 서연문 -->
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
							<td>직원 이름 : <input type="text" name="employeeName"></td>
						</tr>
						<tr>
							<td>직원 나이 : <input type="text" name="employeeAge"></td>
						</tr>
						<tr>
							<td colspan="2"><button>등록</button></td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Employee/employeeList.jsp">목록으로</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>		
	</body>
</html>