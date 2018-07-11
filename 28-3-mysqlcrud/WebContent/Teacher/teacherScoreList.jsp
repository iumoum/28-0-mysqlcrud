<!-- 2018.07.09 김지완-->
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
					// TeacherScoreDao 객체 생성
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
				
					// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					
					// teacherNo 변수 안의 값을 테스트
					System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
					
					// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
					TeacherAndTeacherScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacherNo);		
				%>
				<h1>Teacher Score List</h1>
				<br><br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">교사 번호</th>
							<th style="width:120px">교사 이름</th>
							<th style="width:120px">점수</th>
							<th>수정</th>
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
					<a id="buttonToList" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">목록으로</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>