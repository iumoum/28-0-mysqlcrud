<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Member Action</title>
	</head>
	<body>
		<%
			// memberList.jsp�� ���� �Ѱܹ��� memberNo ���� ������ ���� �� �׽�Ʈ
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			System.out.println("memberNo from memberList.jsp : " + memberNo);
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			MemberDao memberDao = new MemberDao();
			
			memberDao.deleteMember(memberNo);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>