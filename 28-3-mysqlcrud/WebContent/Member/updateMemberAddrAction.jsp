<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Member Address Action</title>
	</head>
	<body>
		<%
			// �ѱ�
			request.setCharacterEncoding("euc-kr");
		
			// updateMemberAddrForm.jsp�κ��� �Ѱܹ��� ���� ������ ������ ����
			int memberAddressNo = Integer.parseInt(request.getParameter("memberAddressNo"));
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberAddressContent = request.getParameter("memberAddressContent");
			
			// �� �׽�Ʈ
			System.out.println("memberAddressNo from updateMemberAddrForm, updateMemberAddrAction.jsp : " + memberAddressNo );
			System.out.println("memberNo from updateMemberAddrForm, updateMemberAddrAction.jsp : " + memberNo );
			System.out.println("memberAddressContent from updateMemberAddrForm, updateMemberAddrAction.jsp : " + memberAddressContent );
			
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			MemberAddr memberAddr = new MemberAddr();
			
			// �Ѱܹ��� ���� VO�� ����
			memberAddr.setMemberAddrNo(memberAddressNo);
			memberAddr.setMemberNo(memberNo);
			memberAddr.setMemberAddrContent(memberAddressContent);
			
			// updateMemberAddress �޼��带 ȣ���Ͽ� ������Ʈ 
			memberAddrDao.updateMemberAddress(memberAddr);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberAddrList.jsp?memberNo=" + memberNo);
		%>
	</body>
</html>