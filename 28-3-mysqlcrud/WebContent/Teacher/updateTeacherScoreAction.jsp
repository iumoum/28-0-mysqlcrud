<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Score Action</title>
	</head>
	<body>
		<%
			// �ѱ� �Է¹ޱ� ����
			request.setCharacterEncoding("euc-kr");
			
			// TeacherScore ��ü ����
			TeacherScore teacherScore = new TeacherScore();
			
			// TeacherScoreDao ��ü ����
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			
			// updateTeacherScoreForm���� ���� ���� ������ ������ ������ ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherName = request.getParameter("teacherName");
			int score = Integer.parseInt(request.getParameter("teacherScore"));
			
			// �� �׽�Ʈ
			System.out.println("teacherNo, updateTeacherScoreForm.jsp => updateTeacherScoreAction.jsp" + teacherNo);
			System.out.println("teacherName, updateTeacherScoreForm.jsp => updateTeacherScoreAction.jsp" + teacherName);
			System.out.println("teacherScore, updateTeacherScoreForm.jsp => updateTeacherScoreAction.jsp" + teacherScore);
			
			// teacherScore ��ü�� ��������� ������ ���� ����
			teacherScore.setTeacherNo(teacherNo);
			teacherScore.setScore(score);
			
			// updateTeacherScore �޼��带 ȣ���Ͽ� ������Ʈ
			teacherScoreDao.updateTeacherScore(teacherScore);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherScoreList.jsp?teacherNo=" + teacherNo);
		%>
	</body>
</html>