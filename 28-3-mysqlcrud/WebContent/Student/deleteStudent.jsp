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
		
		StudentDao dao = new StudentDao();
		
		dao.studentDelete(sendNo);
		
		response.sendRedirect(request.getContextPath()+"/Student/selectStudentList.jsp");
		
	%>
	</body>
</html>