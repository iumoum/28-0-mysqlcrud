<!-- 18.07.10 28�� ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>28-3 INDEX</title>
	<link href="<%= request.getContextPath() %>/style/indexCss.css" rel="stylesheet">
</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article" style="margin: 0; padding:0">
				<img src="<%= request.getContextPath() %>/img/teemo.png">
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>