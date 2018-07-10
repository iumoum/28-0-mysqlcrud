<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
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
	</body>
</html>