<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Teacher Score</title>
	</head>
	<body>
		<h1>Teacher Score</h1>
		<form action="<%= request.getContextPath() %>/Teacher/insertTeacherScoreAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>���� : </td>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td colspan="2">
						<%
							// teacherList.jsp�� ���� �޾ƿ� teacherNo �Ķ���� ���� �� �׽�Ʈ
							System.out.println("teacherNo, teacherList.jsp => insertTeacherAddrForm.jsp : " + request.getParameter("teacherNo"));
						%>
						<!-- teacherNo ���� ���� ���� hidden type���� ���� -->
						<input type="hidden" name="teacherNo" value="<%= request.getParameter("teacherNo") %>">
						<input type="submit" value="���">
					</td>
				</tr>
			</table>
		</form>
		<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList�� �̵�</a>
	</body>
</html>