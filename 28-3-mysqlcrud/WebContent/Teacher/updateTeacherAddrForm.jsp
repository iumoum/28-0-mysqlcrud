<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Address Form</title>
	</head>
	<body>
		<%
			// teacherAddrList.jsp�� ���� �Ѱܹ��� teacherNo ���� ������ ���� �� �׽�Ʈ
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			System.out.println("teacherNo from teacherAddrList.jsp : " + teacherNo);
			
			TeacherDao teacherDao = new TeacherDao();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// selectForUpdateTeacher �޼��带 ȣ���ϰ� teacher ��ü�� �������� ���� �޾� ������ ����.
			TeacherAddr teacherAddr = teacherAddrDao.selectForUpdateTeacherAddress(teacherNo);
		%>
		<h1>Update Teacher</h1>
		<form action="<%= request.getContextPath() %>/Teacher/updateTeacherAddrAction.jsp" method="post"> 
			<table border="1">
				<tr>
					<td>�ּ� ��ȣ : </td>
					<td><input type="text" name="teacherAddressNo" value="<%= teacherAddr.getTeacherAddrNo() %>" readonly>
				</tr>
				<tr>
					<td>���� ��ȣ : </td>
					<td><input type="text" name="teacherNo" value="<%= teacherAddr.getTeacherNo() %>" readonly>
				</tr>
				<tr>
					<td>�ּ� : </td>
					<td><input type="text" name="teacherAddressContent" value="<%= teacherAddr.getTeacherAddrContent() %>">
				</tr>
				<tr>
					<td colspan="2"><button>����</button></td>
				</tr>
			</table>
		</form>
	</body>
</html>