<!-- 2018.07.02 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher List</title>
	</head>
	<body>
		<%
			// ����¡ �˰���
			int rowPerPage = 5;
			int currentPage = 1;
			if(request.getParameter("currentPage") != null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// TeacherDao ��ü ����
			TeacherDao teacherDao = new TeacherDao();
			
			// teacherAddrDao ��ü ����
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// selectTeacherByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListTeacher��ü�� ������)�� ����
			ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage);
			
			// ������ ������
			int lastPage = teacherDao.countWholeRecordFromTeacher() / rowPerPage;
			if ((teacherDao.countWholeRecordFromTeacher() % rowPerPage) != 0){
				lastPage++;
			}
		%>
		<h1>Teacher</h1>
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���� �̸�</td>
				<td>���� ����</td>
				<td>�ּ� �Է�</td>
				<td>�� ��</td>
				<td>�� ��</td>
			</tr>
			<% 
				// size() �޼���� ������ �ε��� ������ ��� ������ �������ش�.
				// ex) arrayListTeacher[17] ���� �����͸� ���� ���� ��� 18�� ����
				for(int i = 0; i < arrayListTeacher.size(); i++){
					// get�޼��带 ���� ������ ��ҿ� ����� Teacher ��ü�� �ҷ��´�.
					Teacher teacher = arrayListTeacher.get(i);
					
					// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
					TeacherAddr teacherAddr = teacherAddrDao.selectTeacherAddress(teacher.getTeacherNo());
			%>
					<tr>
						<td><%= teacher.getTeacherNo() %></td>
						<%
							// �ش� ������ �ּ� ������ �����Ѵٸ�
							if(teacherAddr != null){
						%>
								<td><a href="<%= request.getContextPath() %>/Teacher/teacherAddrList.jsp?teacherNo=<%= teacher.getTeacherNo() %>"><%= teacher.getTeacherName() %></a></td>
						<%	
							// �� ��
							} else {
						%>
								<td><%= teacher.getTeacherName() %></td>
						<%
							}
						%>
						<td><%= teacher.getTeacherAge() %></td>
						<%
							// �ش� ������ �ּ� ������ ���ٸ�
							if(teacherAddr == null){
						%>
								<td><a href="<%= request.getContextPath() %>/Teacher/insertTeacherAddrForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">�ּ� �Է�</a></td>
						<%
							// �� ��
							} else {
						%>
								<td></td>
						<%
							}
						%>
						<td><a href="<%= request.getContextPath() %>/Teacher/updateTeacherForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">���� ��ư</a></td>
						<td><a href="<%= request.getContextPath() %>/Teacher/deleteTeacherAction.jsp?teacherNo=<%= teacher.getTeacherNo() %>">���� ��ư</a></td>
					</tr>
			<% 
				}
			%>
		</table>
		<div>
			<%
				if(currentPage > 1){
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%= currentPage - 1 %>">&lt; ����</a>
			<%
				} else {
			%>
					<span>&lt; ����</span>
			<%
				}
				
				if(currentPage < lastPage){
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%= currentPage + 1 %>">���� &gt;</a>
			<%
				} else {
			%>
					<span>���� &gt;</span>
			<%
				}
			%>
		</div>
	</body>
</html>