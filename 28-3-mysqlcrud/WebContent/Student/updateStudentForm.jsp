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
			<form action="<%=request.getContextPath()%>/Student/updateStudentAction.jsp" method="post">
				<table>
					<tr>
						<td>번호</td>
						<td>이름</td>
						<td>나이</td>
					</tr>
					<tr>
					<%
						String studentNo = request.getParameter("studentNo");
						System.out.println(studentNo);
						Student s = null;
						StudentDao dao = new StudentDao();
						s = dao.studentUpdate(studentNo); 
					
					%>
						
						<td><input type="text" name="reNo" value="<%=s.getStudentNo()%>" readonly></td>
						<td><input type="text" name="reName" value="<%=s.getStudentName()%>"></td>
						<td><input type="text" name="reAge" value="<%=s.getStudentAge()%>"></td>
					</tr>
					<tr><td><input type="submit" value="수정"></td></tr>
				</table>
			</form>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>