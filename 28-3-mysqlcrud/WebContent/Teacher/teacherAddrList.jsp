<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Address List</title>
	</head>
	<body>
		<%
			// TeacherAddrDao ��ü ����
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
		
			// teacherList.jsp�� ���� ���� ���� teacherNo ���� ������ ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			
			// teacherNo ���� ���� ���� �׽�Ʈ
			System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
			
			// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
			TeacherAddr teacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
		%>
		<h1>Teacher Address</h1>
		<table border="1">
			<tr>
				<td>�ּ� ��ȣ</td>
				<td>���� ��ȣ</td>
				<td>���� �ּ�</td>
				<td>����</td>
				<td>����</td>
			</tr>
			<tr>
				<td><%= teacherAddr.getTeacherAddrNo() %></td>
				<td><%= teacherAddr.getTeacherNo() %></td>
				<td><%= teacherAddr.getTeacherAddrContent() %></td>
				<td><a href="<%= request.getContextPath() %>/Teacher/updateTeacherAddrForm.jsp?teacherNo=<%= teacherNo %>">���� ��ư</a></td>
				<td><a href="<%= request.getContextPath() %>/Teacher/deleteTeacherAddrAction.jsp?teacherNo=<%= teacherNo %>">���� ��ư</a></td>
			</tr>
		</table>
		<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList�� �̵�</a>
	</body>
</html>