<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Member Address Form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// memberAddrList.jsp�� ���� �Ѱܹ��� memberNo ���� ������ ���� �� �׽�Ʈ
					int memberAddressNo = Integer.parseInt(request.getParameter("memberAddressNo"));
					System.out.println("memberAddressNo from memberAddrList.jsp : " + memberAddressNo);
					
					MemberDao memberDao = new MemberDao();
					MemberAddrDao memberAddrDao = new MemberAddrDao();
					
					// selectForUpdateMember �޼��带 ȣ���ϰ� member ��ü�� �������� ���� �޾� ������ ����.
					MemberAddr memberAddr = memberAddrDao.selectForUpdateMemberAddress(memberAddressNo);
				%>
				<h1>Update Member</h1>
				<form action="<%= request.getContextPath() %>/Member/updateMemberAddrAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>�ּ� ��ȣ : </td>
							<td><input type="text" name="memberAddressNo" value="<%= memberAddr.getMemberAddrNo() %>" readonly>
						</tr>
						<tr>
							<td>���� ��ȣ : </td>
							<td><input type="text" name="memberNo" value="<%= memberAddr.getMemberNo() %>" readonly>
						</tr>
						<tr>
							<td>�ּ� : </td>
							<td><input type="text" name="memberAddressContent" value="<%= memberAddr.getMemberAddrContent() %>">
						</tr>
						<tr>
							<td colspan="2"><button>����</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>