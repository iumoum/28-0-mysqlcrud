<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			int no = Integer.parseInt(request.getParameter("no"));
		
			EmployeeDao employeeDao = new EmployeeDao();
			EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
			
			EmployeeAddr employeeAddr = employeeAddrDao.selectForUpdateEmployeeAddress(no);
		%>
	</body>
</html>