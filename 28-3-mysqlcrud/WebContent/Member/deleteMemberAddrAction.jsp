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
			int memberAddressNo = Integer.parseInt(request.getParameter("memberAddressNo"));
			System.out.println("memberAddressNo from memberAddrList.jsp : " + memberAddressNo);
			
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			
			// member_address ���̺��� member ���̺��� �����ϴ� �����̱� ������ taecher_address ���̺� ���� ���õ� ������ ���� �����ؾ��Ѵ�.
			memberAddrDao.deleteMemberAddress(memberAddressNo);
			
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>