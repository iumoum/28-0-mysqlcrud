<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Member Action</title>
	</head>
	<body>
		<%
			// �ѱ�
			request.setCharacterEncoding("euc-kr");
		
			// updateMemberForm.jsp�κ��� �Ѱܹ��� ���� ������ ������ ����
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberName = request.getParameter("memberName");
			int memberAge = Integer.parseInt(request.getParameter("memberAge"));
			
			// �� �׽�Ʈ
			System.out.println("memberNo from updateMemberForm, updateMemberAction.jsp : " + memberNo );
			System.out.println("memberName from updateMemberForm, updateMemberAction.jsp : " + memberName );
			System.out.println("memberAge from updateMemberForm, updateMemberAction.jsp : " + memberAge );
			
			MemberDao memberDao = new MemberDao();
			Member member = new Member();
			
			// �Ѱܹ��� ���� VO�� ����
			member.setMemberNo(memberNo);
			member.setMemberName(memberName);
			member.setMemberAge(memberAge);
			
			// updateMember �޼��带 ȣ���Ͽ� ������Ʈ 
			memberDao.updateMember(member);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
		
	</body>
</html>