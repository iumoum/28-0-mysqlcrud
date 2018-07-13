<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Score</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<h1>Member Score</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Member/insertMemberScoreAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>���� : </td>
							<td><input type="text" name="score"></td>
						</tr>
						<tr>
							<td colspan="2">
								<%
									// memberList.jsp�� ���� �޾ƿ� memberNo �Ķ���� ���� �� �׽�Ʈ
									System.out.println("memberNo, memberList.jsp => insertMemberAddrForm.jsp : " + request.getParameter("memberNo"));
								%>
								<!-- memberNo ���� ���� ���� hidden type���� ���� -->
								<input type="hidden" name="memberNo" value="<%= request.getParameter("memberNo") %>">
								<input type="submit" value="���">
							</td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Member/memberList.jsp">memberList�� �̵�</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>