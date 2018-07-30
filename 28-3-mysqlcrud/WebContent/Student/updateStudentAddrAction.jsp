<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");	
	
		StudentAddr studentAddr = new StudentAddr();
		studentAddr.setStudentAddrNo(Integer.parseInt(request.getParameter("addrNo")));
		studentAddr.setStudentNo(Integer.parseInt(request.getParameter("studentNo")));
		studentAddr.setStudentAddrContent(request.getParameter("reAddr"));
		
		StudentAddrDao studentAddrDao = new StudentAddrDao();
		
		studentAddrDao.updateStudentAddr(studentAddr);
		
		response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		
	%>
	</body>
</html>