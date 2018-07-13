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
	
		int studentNo = Integer.parseInt(request.getParameter("studentNo"));
		String studentName = request.getParameter("studentName");
		int reScore = Integer.parseInt(request.getParameter("reScore"));
		
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		
		studentScoreDao.updateStudentScore(studentNo, reScore);
		
		response.sendRedirect("./studentList.jsp");
	%>
	</body>
</html>
