<!-- 18.07.03 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao" %>
<%@ page import="service.MemberAddr" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberAddrInsertAction Page</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("euc-kr");  
		MemberAddr insertMemberAddr = new MemberAddr();
		// MeberAddr Ŭ����Ÿ���� insertMemberAddr������ �����ڸ޼���� ��ü�� ���� �ּҰ��� ����� �� �ּҰ��� �Ҵ��Ѵ�
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		// memberNo������ memberAddrInsertForm.jsp���� �Ѿ�� memberNo���� int������ �ٲٰ� ��´�.
		String memberAddrContent = request.getParameter("memberAddrContent");
		// memberAddrContent������ memberAddrInsertForm.jsp���� �Ѿ�� memberAddrContent���� ��´�.
		insertMemberAddr.setMemberNo(memberNo);
		insertMemberAddr.setMemberAddrContent(memberAddrContent);
		// insertMemberAddr������ ��� �ּҰ��� �ִ� set�޼��带 �Էº����� ��� ���� �̿��Ͽ� �����Ѵ�.
		MemberAddrDao memberAddrdao = new MemberAddrDao();
		// MemberAddrDao Ŭ����Ÿ���� memberAddrdao������ �����ڸ޼���� ��ü�� ���� �ּҰ��� ����� �� �ּҰ��� �Ҵ��Ѵ�.
		memberAddrdao.insertMemberAddr(insertMemberAddr);
		// memberAddrdao�ּҿ� �ִ� insertMemberAddr�޼��带 insertMemberAddr�ּҿ� �ִ� memberAddrŬ������ ����Ͽ� �����Ѵ�.
		response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		// memberList.jsp�� �������� �̵��Ѵ�.
	%>
</body>
</html>