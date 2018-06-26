<!-- 2018.06.26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Insert Action</title>
	</head>
	<body>
		<%
			// �ѱ��� �ޱ� ����
			request.setCharacterEncoding("euc-kr");
		
			// DTO ���� �� ��ü���������� ������ �Ҵ�
			Teacher teacher = new Teacher();
			TeacherAddr teacherAddr = new TeacherAddr();
			
			// DAO ���� �� ��ü���������� ������ �Ҵ�
			TeacherDao teacherDao = new TeacherDao();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// teacherInsertForm.jsp �κ��� �Ѱܹ��� ��			
			int teacherAge = Integer.parseInt(request.getParameter("teacherAge"));
			String teacherName = request.getParameter("teacherName");
			String teacherAddress = request.getParameter("teacherAddress");
			
			// teacherInsertForm.jsp �κ��� �Ѱܹ��� �� ��� (�׽�Ʈ)
			System.out.println("teacherName from teacherInsertForm.jsp : " + teacherName );
			System.out.println("teacherAge from teacherInsertForm.jsp : " + teacherAge );
			System.out.println("teacherAddress from teacherInsertForm.jsp : " + teacherAddress );
			
			// teacher DTO ���� ��������� set�޼��带 ���Ͽ� ���� ����
			// !!!!!! teacherNo��  teacherDAO ������ �޼��忡�� ����(�ڵ����� �ɼ��� �ڹٷ� ����) !!!!!!
			teacher.setTeacherName(teacherName);
			teacher.setTeacherAge(teacherAge);
			
			// teacher DTO ���� ����������� �� ��� (�׽�Ʈ)
			System.out.println("teacherName from teacherDTO : " + teacher.getTeacherName() );
			System.out.println("teacherAge from teacherDTO : " + teacher.getTeacherAge() );
		
			// teacherDAO ������ insert �޼��� ȣ��
			// �Ű������� teacher ��ü�� ���� �� ����
			teacherDao.insertTeacher(teacher);
			
			// teacherInsertForm.jsp ȭ������ �̵�
			response.sendRedirect(request.getContextPath() + "/teacher/teacherInsertForm.jsp");
		%>
	</body>
</html>