<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Teacher Action</title>
	</head>
	<body>
		<%
			// teacherList.jsp�� ���� �Ѱܹ��� teacherNo ���� ������ ���� �� �׽�Ʈ
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			System.out.println("teacherNo from teacherAddrList.jsp : " + teacherNo);
			
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// teacher_address ���̺��� teacher ���̺��� �����ϴ� �����̱� ������ taecher_address ���̺� ���� ���õ� ������ ���� �����ؾ��Ѵ�.
			teacherAddrDao.deleteTeacherAddress(teacherNo);
			
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherList.jsp");
		%>
	</body>
</html>