<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>이름</td>
			<td>점수</td>
			<td>점수입력</td>
		</tr>
		<%
			StudentScoreDao dao = new StudentScoreDao();
	
			ArrayList<StudentScore> get_list = dao.studentScore();
			for (int i = 0; i < get_list.size(); i++) {
				StudentScore studentScore = get_list.get(i);
			%>
				<tr>
					<td><%=studentScore.getStudentName() %></td>
					<td><%=studentScore.getScore()%></td>
					<td><a href="#">GoGo!</a></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>