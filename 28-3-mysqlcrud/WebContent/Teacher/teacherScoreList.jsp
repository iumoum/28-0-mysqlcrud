<!-- 2018.07.09 ������-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Score List</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// TeacherScoreDao ��ü ����
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
				
					// teacherList.jsp�� ���� ���� ���� teacherNo ���� ������ ����
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					
					// teacherNo ���� ���� ���� �׽�Ʈ
					System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
					
					// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
					TeacherAndTeacherScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);		
				%>
				<h1>Teacher Score List</h1>
				<br><br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th style="width:120px">���� �̸�</th>
							<th style="width:120px">����</th>
							<th>����</th>
						</tr>
					</thead>
					<tr>
						<td><%= teacherAndTeacherScore.getTeahcer().getTeacherNo() %></td>
						<td><%= teacherAndTeacherScore.getTeahcer().getTeacherName() %></td>
						<td><%= teacherAndTeacherScore.getTeacherScore().getScore() %></td>
						<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Teacher/updateTeacherScoreForm.jsp?teacherNo=<%= teacherAndTeacherScore.getTeahcer().getTeacherNo() %>">UPDATE</a>
					</tr>
				</table>
				<br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">�������</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>