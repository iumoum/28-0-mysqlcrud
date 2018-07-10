<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%-- <%
		//StudentScoreDao s = new ''();
	
	int scoreAvg = 0;//StudentScoreDao.selectScoreAvg();
	
	ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
	list = StudentScoreDao.selectStudentListAboveAvg();
	%>
	<div>
		평균 :<%=scoreAvg %> 
		
	</div>
	<table>
		<thead>
			<tr>
				<th>Student_NO</th>
				<th>Student_NAME</th>
				<th>Student_SCORE</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<list.size(); i++){
			%>		
					<tr>
						<td><%=list.get(i).getStudent().getStudentNo() %></td>
						<td><%=list.get(i).getStudent().getStudentName() %></td>
						<td><%=list.get(i).getStudentScore().getStudentScore() %></td>
					</tr>	
			<%
				}
			%>
		</tbody>
	</table> --%>
</body>
</html>