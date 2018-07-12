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
					// ����¡ �˰���
					int rowPerPage = 10;
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
				
					// selectScoreAboveAvg �޼��带 ȣ���ϱ� ���� ��ü ����
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					// selectScoreAboveAvg �޼��带 ȣ���ϰ� ���� �Ǵ� ����Ʈ�� ���� ���� arrayListScoreAboveAvg ��ü���������� ����
					ArrayList<TeacherAndTeacherScore> arrayListScoreAboveAvg = teacherScoreDao.selectScoreAboveAvgByPage(currentPage,rowPerPage);
					
					// findAvgScore �޼��带 ȣ���ϰ� ���� �Ǵ� ��� ���� teacherAvgScore ������ ����
					int teacherAvgScore = teacherScoreDao.findAvgScore();

					// ������ ������
					int lastPage = teacherScoreDao.countTeacherWhoseScoreisAboveAvg() / rowPerPage;
					if ((teacherScoreDao.countTeacherWhoseScoreisAboveAvg() % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>TeacherScore Above Average</h1>
				<br><br>
				<p>��� : <%= teacherAvgScore %></p>
				<p>��� �̻��� ������ �� : <%= teacherScoreDao.countTeacherWhoseScoreisAboveAvg() %> ��</p>
				<br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th>���� ��ȣ</th>
							<th>���� �̸�</th>
							<th>���� ����</th>
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
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Teacher/teacherAboveAvgList.jsp?currentPage=<%= currentPage - 1 %>">&lt; ����</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; ����</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Teacher/teacherAboveAvgList.jsp?currentPage=<%= currentPage + 1 %>">���� &gt;</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7;">���� &gt;</span>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>