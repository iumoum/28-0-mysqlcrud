<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Member Form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
				// memberList.jsp�� ���� �Ѱܹ��� memberNo ���� ������ ���� �� �׽�Ʈ
				int memberNo = Integer.parseInt(request.getParameter("memberNo"));
				System.out.println("memberNo from memberList.jsp : " + memberNo);
				
				MemberDao memberDao = new MemberDao();
				MemberAddrDao memberAddrDao = new MemberAddrDao();
				
				// selectForUpdateMember �޼��带 ȣ���ϰ� member ��ü�� �������� ���� �޾� ������ ����.
				Member member = memberDao.selectForUpdateMember(memberNo);
				%>
				<h1>Update Member</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Member/updateMemberAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>���� ��ȣ : </td>
							<td><input type="text" name="memberNo" value="<%= member.getMemberNo() %>" readonly>
						</tr>
						<tr>
							<td>���� �̸� : </td>
							<td><input type="text" name="memberName" value="<%= member.getMemberName() %>">
						</tr>
						<tr>
							<td>���� ���� : </td>
							<td><input type="text" name="memberAge" value="<%= member.getMemberAge() %>">
						</tr>
						<tr>
							<td colspan="2"><button>����</button></td>
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