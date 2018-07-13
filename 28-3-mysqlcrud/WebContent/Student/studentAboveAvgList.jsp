<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
 <%
	StudentScoreDao s = new StudentScoreDao();
	
	int scoreAvg = 0;
	int avgCount = 0;
	
	avgCount = s.selectStudentListAboveAvgCount();
	
	scoreAvg = s.selectScoreAvg();
	
	ArrayList<StudentScore> list = new ArrayList<StudentScore>();
	list = s.selectStudentListAboveAvg();
	%>
	<div>
		평균 :<%=scoreAvg %> <br><br> 평균을 넘는 학생 수 :<%=avgCount %> <br><br>
	</div>
	<table border="1">
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
					StudentScore sc = list.get(i);
			%>		
					<tr>
						<td><%=sc.getStudentNo() %></td>
						<td><%=sc.getStudentName() %></td>
						<td><%=sc.getScore() %></td>
					</tr>	
			<%
				}
			%>
		</tbody>
	</table> 
</body>
</html>