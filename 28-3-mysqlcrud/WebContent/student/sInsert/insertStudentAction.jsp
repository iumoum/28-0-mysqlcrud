<!-- 김정연 -->
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
		//각각의 클래스들의 주소값들을 객체참조변수에 할당.
	
		st.setName(request.getParameter("name"));
		st.setAge(Integer.parseInt(request.getParameter("age")));
		//form action 으로 넘겨받은 값들을 student 클래스에 셋팅.
		
		StudentDao stdao = new StudentDao();
		stdao.insertStudent(st);
	
		
		//dao 클래스들의 주소값들을 할당받은 객체참조변수를 이용하여 메소드를 호출한다.
		
		
	%>
	</body>
</html>