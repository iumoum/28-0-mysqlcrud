<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Teacher Score Action</title>
	</head>
	<body>
		<%
			// ���ڵ� ��� ����
			request.setCharacterEncoding("euc-kr");
		
			//TeacherScore, TeacherScoreDao ��ü ���� 
			TeacherScore teacherScore = new TeacherScore();
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			
			// insertTeacherScoreForm.jsp�� ���� �޾ƿ� teacherNo, score ���� ������ ������ ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			int score = Integer.parseInt(request.getParameter("score"));
			
			// teacherNo ���� ���� ���� �׽�Ʈ
			System.out.println("teacherNo, insertTeacherAddrForm.jsp = > insertTeacherAddrAction.jsp : " + teacherNo);
			System.out.println("score, insertTeacherScoreForm.jsp = > insertTeacherScoreAction.jsp : " + score);
			
			// TeacherScore ��ü ������ ��� ������ ������ ���� ����
			teacherScore.setTeacherNo(teacherNo);
			teacherScore.setScore(score);
			
			// insertTeacherScore �޼��带 ���� ���ڵ� ����
			teacherScoreDao.insertTeacherScore(teacherScore);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherList.jsp");
		%>
	</body>
</html>