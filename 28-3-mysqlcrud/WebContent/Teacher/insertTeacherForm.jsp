<!-- 2018.07.10 김지완 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>Teacher Insert Form</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/style/insertEntity.css">
</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<form action="<%= request.getContextPath() %>/Teacher/insertTeacherAction.jsp" method="post">
					<h1>Teacher Insert</h1>
					<br><br>
					<table border="1">
						<tr>
							<td>교사의 이름 : </td>
							<td><input type="text" name="teacherName"></td>
						</tr>
						<tr>
							<td>교사의 나이 : </td>
							<td><input type="text" name="teacherAge"></td>
						</tr>
						<tr>
							<td colspan="2"><button>등록</button></td>
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