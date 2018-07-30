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
		Student s = new Student();
		request.setCharacterEncoding("euc-kr");
		s.setStudentNo(Integer.parseInt(request.getParameter("reNo")));
		s.setStudentName(request.getParameter("reName"));
		s.setStudentAge(Integer.parseInt(request.getParameter("reAge")));
		
		StudentDao dao = new StudentDao();
		
		String xtest = dao.studentUpdateAction(s);
		
		response.sendRedirect(request.getContextPath()+"/Student/studentList.jsp");
		
		
	%>
	</body>
</html>