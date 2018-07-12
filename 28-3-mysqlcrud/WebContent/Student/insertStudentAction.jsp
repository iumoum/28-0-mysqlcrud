<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.Student" %>
<%@ page import="service.StudentDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertStudentAction</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");
			
		Student st = new Student();
		
			
		st.setName(request.getParameter("name"));
		st.setAge(Integer.parseInt(request.getParameter("age")));
		
		StudentDao stdao = new StudentDao();
		stdao.insertStudent(st);
		response.sendRedirect(request.getContextPath() + "/Student/studentList.jsp");
	%>
	</body>
</html>