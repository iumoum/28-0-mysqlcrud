<!-- 2018.06.26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Teacher Insert Form</title>
</head>
	<body>
		<form action="<%= request.getContextPath() %>/Teacher/insertTeacherAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Teacher</td>
				</tr>
				<tr>
					<td>������ �̸� : </td>
					<td><input type="text" name="teacherName"></td>
				</tr>
				<tr>
					<td>������ ���� : </td>
					<td><input type="text" name="teacherAge"></td>
				</tr>
				<tr>
					<td colspan="2"><button>���</button></td>
				</tr>
			</table>
		</form>
	</body>
</html>