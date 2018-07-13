<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	<h1>Student Score List</h1>
	<br><br><br>
	<table id="entityListTable">
		<thead>
			<tr>
				<th style="width:70px">학생 번호</th>
				<th style="width:120px">학생 이름</th>
				<th style="width:120px">점수</th>
				<th style="width:120px">수정</th>
			</tr>
		</thead>
		<%
			request.setCharacterEncoding("euc-kr");
		
			String sendNo = request.getParameter("send_no");
		
			StudentScoreDao dao = new StudentScoreDao();
			
			ArrayList<StudentScore> get_list = dao.studentScore(sendNo);
			
			for (int i = 0; i < get_list.size(); i++) {
				StudentScore studentScore = get_list.get(i);
				if(studentScore.getScoreCheck()!=null){
		%>
					<tr>
						<td>-</td>
						<td>-</td>
						<td>-</td>
						<td>-</td>
					</tr>
		<%
				}else{
				
		%>
					<tr>
						<td><%=studentScore.getStudentNo() %></td>
						<td><%=studentScore.getStudentName() %></td>
						<td><%=studentScore.getScore()%></td>
						<td><a class="buttonToUpdateEntity" href="<%=request.getContextPath() %>/Student/updateStudentScoreForm.jsp?send_no=<%=sendNo%>">수정</a></td>	
					</tr>
		<%
				}
			}
		%>
	</table>
	<br>
	<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Student/studentList.jsp">목록으로</a>
				</div>
	</div>
</div>
<%@ include file="/module/footer.jsp" %>
</body>
</html>