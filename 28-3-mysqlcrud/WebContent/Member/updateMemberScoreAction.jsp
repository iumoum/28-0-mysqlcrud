<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Member Score Action</title>
	</head>
	<body>
		<%
			// �ѱ� �Է¹ޱ� ����
			request.setCharacterEncoding("euc-kr");
			
			// MemberScore ��ü ����
			MemberScore memberScore = new MemberScore();
			
			// MemberScoreDao ��ü ����
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			
			// updateMemberScoreForm���� ���� ���� ������ ������ ������ ����
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberName = request.getParameter("memberName");
			int score = Integer.parseInt(request.getParameter("memberScore"));
			
			// �� �׽�Ʈ
			System.out.println("memberNo, updateMemberScoreForm.jsp => updateMemberScoreAction.jsp" + memberNo);
			System.out.println("memberName, updateMemberScoreForm.jsp => updateMemberScoreAction.jsp" + memberName);
			System.out.println("memberScore, updateMemberScoreForm.jsp => updateMemberScoreAction.jsp" + memberScore);
			
			// memberScore ��ü�� ��������� ������ ���� ����
			memberScore.setMemberNo(memberNo);
			memberScore.setScore(score);
			
			// updateMemberScore �޼��带 ȣ���Ͽ� ������Ʈ
			memberScoreDao.updateMemberScore(memberScore);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberScoreList.jsp?memberNo=" + memberNo);
		%>
	</body>
</html>