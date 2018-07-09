<!-- 2018.07.09 ������-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Score List</title>
	</head>
	<body>
		<%
			// TeacherScoreDao ��ü ����
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
		
			// teacherList.jsp�� ���� ���� ���� teacherNo ���� ������ ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			
			// teacherNo ���� ���� ���� �׽�Ʈ
			System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
			
			// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
			TeacherAndTeacherScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);		
		%>
		<h1>Teacher Address</h1>
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���� �̸�</td>
				<td>���� ����</td>
				<td>���� ��ȣ</td>
				<td>����</td>
			</tr>
			<tr>
				<td><%= teacherAndTeacherScore.getTeahcer().getTeacherNo() %></td>
				<td><%= teacherAndTeacherScore.getTeahcer().getTeacherName() %></td>
				<td><%= teacherAndTeacherScore.getTeahcer().getTeacherAge() %></td>
				<td><%= teacherAndTeacherScore.getTeacherScore().getScoreNo() %></td>
				<td><%= teacherAndTeacherScore.getTeacherScore().getScore() %></td>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList�� �̵�</a>
	</body>
</html>