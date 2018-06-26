<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.student" %>
<%@ page import="service.studentDao" %>
<%@ page import="service.studentAddr" %>
<%@ page import="service.studentAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");
	
		student st = new student();
		studentAddr sa = new studentAddr();
		
	
		st.setName(request.getParameter("name"));
		st.setAge(Integer.parseInt(request.getParameter("age")));
		sa.setAddr(request.getParameter("addr"));
		
		studentDao stdao = new studentDao();
		stdao.insertStudent(st);
		
		studentAddrDao sadao = new studentAddrDao();
		sadao.insertStudentAddr(sa);
		
			
		
		
	%>
	</body>
</html>