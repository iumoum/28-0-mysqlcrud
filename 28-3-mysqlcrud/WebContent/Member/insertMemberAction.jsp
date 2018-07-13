<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Insert Action</title>
	</head>
	<body>
		<%
			// �ѱ��� �ޱ� ����
			request.setCharacterEncoding("euc-kr");
		
			// DTO ���� �� ��ü���������� ������ �Ҵ�
			Member member = new Member();
			MemberAddr memberAddr = new MemberAddr();
			
			// DAO ���� �� ��ü���������� ������ �Ҵ�
			MemberDao memberDao = new MemberDao();
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			
			// memberInsertForm.jsp �κ��� �Ѱܹ��� ��			
			int memberAge = Integer.parseInt(request.getParameter("memberAge"));
			String memberName = request.getParameter("memberName");
			
			// memberInsertForm.jsp �κ��� �Ѱܹ��� �� ��� (�׽�Ʈ)
			System.out.println("memberName from memberInsertForm.jsp : " + memberName );
			System.out.println("memberAge from memberInsertForm.jsp : " + memberAge );
			
			// member DTO ���� ��������� set�޼��带 ���Ͽ� ���� ����
			member.setMemberName(memberName);
			member.setMemberAge(memberAge);
			
			// member DTO ���� ����������� �� ��� (�׽�Ʈ)
			System.out.println("memberName from memberDTO : " + member.getMemberName() );
			System.out.println("memberAge from memberDTO : " + member.getMemberAge() );
		
			// memberDAO ������ insert �޼��� ȣ��
			// �Ű������� member ��ü�� ���� �� ����
			memberDao.insertMember(member);
			
			// memberInsertForm.jsp ȭ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>