<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.Student" %>
<%@ page import="service.StudentDao" %>
<%@ page import="service.StudentAddr" %>
<%@ page import="service.StudentAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");
			
		Student st = new Student();
		StudentAddr sa = new StudentAddr();
		
			
		st.setName(request.getParameter("name"));
		st.setAge(Integer.parseInt(request.getParameter("age")));
		sa.setAddr(request.getParameter("addr"));
		
		StudentDao stdao = new StudentDao();
		stdao.insertStudent(st);
		
		StudentAddrDao sadao = new StudentAddrDao();
		sadao.insertStudentAddr(sa);
	%>
	</body>
</html>