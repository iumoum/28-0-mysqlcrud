<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
	<% 
				request.setCharacterEncoding("euc-kr");
			
				String sendNo = request.getParameter("send_no");
				
				StudentScoreDao studentScoreDao = new StudentScoreDao();
				
				StudentDao studentDao = new StudentDao();
				
				String studentName =  studentDao.selectStudentName(sendNo);
				
				StudentScore studentScore = studentScoreDao.updateStudentScoreSelect(sendNo);
	%>	
				<h1>StudentScore update</h1>
						<br><br><br>
				<table id="entityListTable">
					<form action="<%=request.getContextPath() %>/Student/updateStudentScoreAction.jsp" method="post">
						<thead>
							<tr>
								<th>학생 번호</th>
								<th>학생 이름</th>
								<th>점수</th>
								<th>수정</th>
							</tr>
						</thead>
							<tr>
								<td><input type="text" name="studentNo" value="<%=studentScore.getStudentNo() %>" readonly></td>
								<td><input type="text" name="studentName" value="<%=studentName %>" readonly></td>
								<td><input type="text" name="reScore" value="<%=studentScore.getScore() %>"></td>
								<td><input type="submit" value="수정 완료"></td>
							</tr>
					</form>
				</table>
				<br><br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Student/studentList.jsp">목록으로</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>