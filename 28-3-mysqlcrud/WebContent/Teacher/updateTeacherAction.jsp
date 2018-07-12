<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Action</title>
	</head>
	<body>
		<%
			// �ѱ�
			request.setCharacterEncoding("euc-kr");
		
			// updateTeacherForm.jsp�κ��� �Ѱܹ��� ���� ������ ������ ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherName = request.getParameter("teacherName");
			int teacherAge = Integer.parseInt(request.getParameter("teacherAge"));
			
			// �� �׽�Ʈ
			System.out.println("teacherNo from updateTeacherForm, updateTeacherAction.jsp : " + teacherNo );
			System.out.println("teacherName from updateTeacherForm, updateTeacherAction.jsp : " + teacherName );
			System.out.println("teacherAge from updateTeacherForm, updateTeacherAction.jsp : " + teacherAge );
			
			TeacherDao teacherDao = new TeacherDao();
			Teacher teacher = new Teacher();
			
			// �Ѱܹ��� ���� VO�� ����
			teacher.setTeacherNo(teacherNo);
			teacher.setTeacherName(teacherName);
			teacher.setTeacherAge(teacherAge);
			
			// updateTeacher �޼��带 ȣ���Ͽ� ������Ʈ 
			teacherDao.updateTeacher(teacher);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherList.jsp");
		%>
		
	</body>
</html>