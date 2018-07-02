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
			
			// selectTeacherByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListTeacher��ü�� ������)�� ����
			ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage);
			
			// ������ ������
			int lastPage = teacherDao.countTeacherTable() / rowPerPage;
			if ((teacherDao.countTeacherTable() % rowPerPage) != 0){
				lastPage++;
			}
		%>
		
		<table border="1">
			<tr>
				<td>���� ��ȣ</td>
				<td>���� �̸�</td>
				<td>���� ����</td>
			</tr>
			<% 
				// size() �޼���� ������ �ε��� ������ ��� ������ �������ش�.
				// ex) arrayListTeacher[17] ���� �����͸� ���� ���� ��� 18�� ����
				for(int i = 0; i < arrayListTeacher.size(); i++){
					// get�޼��带 ���� ������ ��ҿ� ����� Teacher ��ü�� �ҷ��´�.
					Teacher teacher = arrayListTeacher.get(i);
			%>
					<tr>
						<td><%= teacher.getTeacherNo() %></td>
						<td><%= teacher.getTeacherName() %></td>
						<td><%= teacher.getTeacherAge() %></td>
					</tr>
			<% 
				}
			%>
		</table>
		<div>
			<%
				if(currentPage > 1){
			%>
					<a href="<%= request.getContextPath() %>/Teacher/tList/teacherList.jsp?currentPage=<%= currentPage - 1 %>">&lt; ����</a>
			<%
				} else {
			%>
					<span>&lt; ����</span>
			<%
				}
				
				if(currentPage < lastPage){
			%>
					<a href="<%= request.getContextPath() %>/Teacher/tList/teacherList.jsp?currentPage=<%= currentPage + 1 %>">���� &gt;</a>
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