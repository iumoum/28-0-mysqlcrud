<!-- 2018-07-03 김정연 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<%@ page import="service.StudentAddr" %>
<%@ page import="service.StudentAddrDao" %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");
		StudentAddr sa = new StudentAddr();
		int sendNo = Integer.parseInt(request.getParameter("studentNo"));
		sa.setStudentNo(sendNo);
		sa.setAddr(request.getParameter("addr"));
		System.out.println(sendNo);
		
		StudentAddrDao adao = new StudentAddrDao();
		adao.insertStudentAddr(sa);
		
		response.sendRedirect("./studentList.jsp");
	%>
	</body>
</html>