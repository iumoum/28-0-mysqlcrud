<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentForm</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
	<%@ include file="/module/header.jsp" %>
	<div id="container">
		<%@ include file="/module/nav.jsp" %>
		<div id="article">
		<form action="./insertStudentAddrAction.jsp" method="post">
			<h3>Student</h3>
			<table border="1">
				<tr>
					<td>주소  : </td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"><input type="hidden" name="studentNo" value= "<%=request.getParameter("studentNo")%>"></td>
				</tr>	
			</table>
		</form>
		<div id="listButton">
			<a id="buttonToList" href="<%= request.getContextPath() %>/Student/studentList.jsp">목록으로</a>
		</div>
		</div>
	</div>
		<%@ include file="/module/footer.jsp" %>
	</body>	
</html>