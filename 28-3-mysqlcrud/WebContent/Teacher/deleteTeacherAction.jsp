<!-- 2018-07-12 ������ -->
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
			System.out.println("teacherNo from teacherList.jsp : " + teacherNo);
			
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			TeacherDao teacherDao = new TeacherDao();
			
			teacherDao.deleteTeacher(teacherNo);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherList.jsp");
		%>
	</body>
</html>