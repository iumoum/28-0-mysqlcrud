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
		</tr>
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
					</tr>
		<%
				}else{
				
		%>
					<tr>
						<td><%=studentScore.getStudentName() %></td>
						<td><%=studentScore.getScore()%></td>	
					</tr>
		<%
				}
			}
		%>
	</table>
</body>
</html>