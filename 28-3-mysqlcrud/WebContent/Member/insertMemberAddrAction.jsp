<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Address Action</title>
	</head>
	<body>
		<%
			// ���ڵ� ��� ����
			request.setCharacterEncoding("euc-kr");
		
			//MemberAddr, MemberAddrDao ��ü ���� 
			MemberAddr memberAddr = new MemberAddr();
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			
			// insertMemberAddrForm.jsp�� ���� �޾ƿ� memberNo, memberAddressContent���� ������ ������ ����
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberAddressContent = request.getParameter("memberAddressContent");
			
			// memberNo ���� ���� ���� �׽�Ʈ
			System.out.println("memberNo, insertMemberAddrForm.jsp = > insertMemberAddrAction.jsp : " + memberNo);
			System.out.println("memberAddressContent, insertMemberAddrForm.jsp = > insertMemberAddrAction.jsp : " + memberAddressContent);
			
			// memberAddr ��ü ������ ��� ������ ������ ���� ����
			memberAddr.setMemberNo(memberNo);
			memberAddr.setMemberAddrContent(memberAddressContent);
			
			// insertMemberAddress �޼��带 ���� ���ڵ� ����
			memberAddrDao.insertMemberAddress(memberAddr);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberAddrList.jsp?memberNo=" + memberNo);
		%>
	</body>
</html>