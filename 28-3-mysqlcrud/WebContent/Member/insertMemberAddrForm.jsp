<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Form To Insert Member Address</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<h1>Member Address</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Member/insertMemberAddrAction.jsp" method="post">
					<table border="1">
						<tr>
							<td>주소 : </td>
							<td><input type="text" name="memberAddressContent"></td>
						</tr>
						<tr>
							<td colspan="2">
								<%
									// memberList.jsp로 부터 받아온 memberNo 파라미터 안의 값 테스트
									System.out.println("memberNo, memberList.jsp => insertMemberAddrForm.jsp : " + request.getParameter("memberNo"));
								%>
								<!-- memberNo 변수 안의 값을 hidden type으로 전송 -->
								<input type="hidden" name="memberNo" value="<%= request.getParameter("memberNo") %>">
								<input type="submit" value="등록">
							</td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Member/memberList.jsp">memberList로 이동</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>