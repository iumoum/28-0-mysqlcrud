<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Score Action</title>
	</head>
	<body>
		<%
			// ���ڵ� ��� ����
			request.setCharacterEncoding("euc-kr");
		
			//MemberScore, MemberScoreDao ��ü ���� 
			MemberScore memberScore = new MemberScore();
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			
			// insertMemberScoreForm.jsp�� ���� �޾ƿ� memberNo, score ���� ������ ������ ����
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			int score = Integer.parseInt(request.getParameter("score"));
			
			// memberNo ���� ���� ���� �׽�Ʈ
			System.out.println("memberNo, insertMemberAddrForm.jsp = > insertMemberAddrAction.jsp : " + memberNo);
			System.out.println("score, insertMemberScoreForm.jsp = > insertMemberScoreAction.jsp : " + score);
			
			// MemberScore ��ü ������ ��� ������ ������ ���� ����
			memberScore.setMemberNo(memberNo);
			memberScore.setScore(score);
			
			// insertMemberScore �޼��带 ���� ���ڵ� ����
			memberScoreDao.insertMemberScore(memberScore);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>