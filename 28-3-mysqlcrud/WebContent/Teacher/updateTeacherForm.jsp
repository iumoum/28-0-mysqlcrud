<!-- 2018-07-12 김지완 -->
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
				// teacherList.jsp로 부터 넘겨받은 teacherNo 값을 변수에 대입 후 테스트
				int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
				System.out.println("teacherNo from teacherList.jsp : " + teacherNo);
				
				TeacherDao teacherDao = new TeacherDao();
				TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
				
				// selectForUpdateTeacher 메서드를 호출하고 teacher 객체의 참조값을 리턴 받아 변수에 대입.
				Teacher teacher = teacherDao.selectForUpdateTeacher(teacherNo);
				%>
				<h1>Update Teacher</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Teacher/updateTeacherAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>교사 번호 : </td>
							<td><input type="text" name="teacherNo" value="<%= teacher.getTeacherNo() %>" readonly>
						</tr>
						<tr>
							<td>교사 이름 : </td>
							<td><input type="text" name="teacherName" value="<%= teacher.getTeacherName() %>">
						</tr>
						<tr>
							<td>교사 나이 : </td>
							<td><input type="text" name="teacherAge" value="<%= teacher.getTeacherAge() %>">
						</tr>
						<tr>
							<td colspan="2"><button>수정</button></td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">teacherList로 이동</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>