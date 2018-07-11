<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
				// teacherList.jsp�� ���� �Ѱܹ��� teacherNo ���� ������ ���� �� �׽�Ʈ
				int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
				System.out.println("teacherNo from teacherList.jsp : " + teacherNo);
				
				TeacherDao teacherDao = new TeacherDao();
				TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
				
				// selectForUpdateTeacher �޼��带 ȣ���ϰ� teacher ��ü�� �������� ���� �޾� ������ ����.
				Teacher teacher = teacherDao.selectForUpdateTeacher(teacherNo);
				%>
				<h1>Update Teacher</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Teacher/updateTeacherAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>���� ��ȣ : </td>
							<td><input type="text" name="teacherNo" value="<%= teacher.getTeacherNo() %>" readonly>
						</tr>
						<tr>
							<td>���� �̸� : </td>
							<td><input type="text" name="teacherName" value="<%= teacher.getTeacherName() %>">
						</tr>
						<tr>
							<td>���� ���� : </td>
							<td><input type="text" name="teacherAge" value="<%= teacher.getTeacherAge() %>">
						</tr>
						<tr>
							<td colspan="2"><button>����</button></td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList�� �̵�</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>