<!-- ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.Student" %>
<%@ page import="service.StudentDao" %>

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
		//������ Ŭ�������� �ּҰ����� ��ü���������� �Ҵ�.
	
		st.setName(request.getParameter("name"));
		st.setAge(Integer.parseInt(request.getParameter("age")));
		//form action ���� �Ѱܹ��� ������ student Ŭ������ ����.
		
		StudentDao stdao = new StudentDao();
		stdao.insertStudent(st);
	
		
		//dao Ŭ�������� �ּҰ����� �Ҵ���� ��ü���������� �̿��Ͽ� �޼ҵ带 ȣ���Ѵ�.
		
		
	%>
	</body>
</html>