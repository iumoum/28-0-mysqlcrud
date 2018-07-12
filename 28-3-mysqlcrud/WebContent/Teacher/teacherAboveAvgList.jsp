<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Above Average List</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// 페이징 알고리즘
					int rowPerPage = 10;
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
				
					// selectScoreAboveAvg 메서드를 호출하기 위해 객체 생성
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					// selectScoreAboveAvg 메서드를 호출하고 리턴 되는 리스트의 참조 값을 arrayListScoreAboveAvg 객체참조변수에 대입
					ArrayList<TeacherAndTeacherScore> arrayListScoreAboveAvg = teacherScoreDao.selectScoreAboveAvgByPage(currentPage,rowPerPage);
					
					// findAvgScore 메서드를 호출하고 리턴 되는 평균 값을 teacherAvgScore 변수에 대입
					int teacherAvgScore = teacherScoreDao.findAvgScore();

					// 마지막 페이지
					int lastPage = teacherScoreDao.countTeacherWhoseScoreisAboveAvg() / rowPerPage;
					if ((teacherScoreDao.countTeacherWhoseScoreisAboveAvg() % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>TeacherScore Above Average</h1>
				<br><br>
				<p>평균 : <%= teacherAvgScore %></p>
				<p>평균 이상인 교사의 수 : <%= teacherScoreDao.countTeacherWhoseScoreisAboveAvg() %> 명</p>
				<br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th>교사 번호</th>
							<th>교사 이름</th>
							<th>교사 점수</th>
						</tr>
					</thead>
					<tbody>
						<%
							for(int i = 0; i < arrayListScoreAboveAvg.size(); i++){
						%>
								<tr>
									<td><%= arrayListScoreAboveAvg.get(i).getTeacher().getTeacherNo() %></td>
									<td><%= arrayListScoreAboveAvg.get(i).getTeacher().getTeacherName() %></td>
									<td><%= arrayListScoreAboveAvg.get(i).getTeacherScore().getScore() %></td>
								</tr>
						<%
							}
						%>
					</tbody>
				</table>
				<br><br>
				<div id="page">
					<span><%= currentPage %> / <%= lastPage %></span>
				</div>
				<br>
				<div id="buttonForAnotherPage">
					<%
						if(currentPage > 1){
					%>
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Teacher/teacherAboveAvgList.jsp?currentPage=<%= currentPage - 1 %>">&lt; 이전</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; 이전</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Teacher/teacherAboveAvgList.jsp?currentPage=<%= currentPage + 1 %>">다음 &gt;</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7;">다음 &gt;</span>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>