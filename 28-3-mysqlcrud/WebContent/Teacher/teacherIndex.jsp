<!-- 2018.06.26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>mIndex Page</title>
</head>
	<body>
		<table border="1">
			<tr>
				<td colspan="2"><a href="../index.jsp">28�� 3�� ��������Ʈ</a></td>
			</tr>
			<tr>
				<td colspan="2">Teacher Page</td>
			</tr>
			<tr>
				<td rowspan="2">Teacher</td> 
				<td><a href="<%= request.getContextPath() %>/Teacher/insertTeacherForm.jsp">insertTeacherForm���� �̵�</a></td>
			</tr>
			<tr>
				<td><a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList�� �̵�</a></td>
			</tr>
		</table>
	</body>
</html>