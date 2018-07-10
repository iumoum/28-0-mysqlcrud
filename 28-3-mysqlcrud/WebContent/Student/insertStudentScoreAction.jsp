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
		StudentScore sc = new StudentScore();
		
		int sendNo = Integer.parseInt(request.getParameter("sendNo"));
		int score = Integer.parseInt(request.getParameter("score"));
		
		sc.setStudentNo(sendNo);
		sc.setScore(score);
		System.out.println(sc.getStudentNo() + "<=sendNo");
		System.out.println(sc.getScore() + "<=score");
		StudentScoreDao studentScoreDao = new StudentScoreDao();
		
		studentScoreDao.insertStudentScore(sc);
		
		response.sendRedirect(request.getContextPath()+"/Student/selectStudentList.jsp");
	%>
	</body>
</html>