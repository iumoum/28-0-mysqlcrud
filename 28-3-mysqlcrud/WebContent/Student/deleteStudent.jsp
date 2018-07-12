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
		
		String sendNo = request.getParameter("send_no");
		
		StudentAddrDao dao = new StudentAddrDao();
		
		dao.studentAddrTbDelete(sendNo);
		
		StudentScoreDao dao2 = new StudentScoreDao();
		
		dao2.studentScoreTbDelete(sendNo);
		
		StudentDao dao3 = new StudentDao();
		
		dao3.studentTbDelete(sendNo);
		
		response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		
	%>
	</body>
</html>