<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
		<form action="<%=request.getContextPath() %>/Student/insertStudentScoreAction.jsp" method="post">
		<%
			request.setCharacterEncoding("euc-kr");
			String sendNo = request.getParameter("send_no");
			System.out.println(sendNo + "<=sendNo");
		%>
			<h3>점수 입력 : <input type="text" name="score"></h3>
			<input type="hidden" name="sendNo" value="<%=sendNo %>">
			<div><input type="submit" value="확인"></div>
		</form>
		</div>
	</div>
	<%@ include file="/module/footer.jsp" %>
	</body>
</html>