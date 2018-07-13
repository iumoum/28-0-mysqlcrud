<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
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
			// 인코딩 방식 설정
			request.setCharacterEncoding("euc-kr");
		
			//MemberScore, MemberScoreDao 객체 생성 
			MemberScore memberScore = new MemberScore();
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			
			// insertMemberScoreForm.jsp로 부터 받아온 memberNo, score 값을 각각의 변수에 대입
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			int score = Integer.parseInt(request.getParameter("score"));
			
			// memberNo 변수 안의 값을 테스트
			System.out.println("memberNo, insertMemberAddrForm.jsp = > insertMemberAddrAction.jsp : " + memberNo);
			System.out.println("score, insertMemberScoreForm.jsp = > insertMemberScoreAction.jsp : " + score);
			
			// MemberScore 객체 내부의 멤버 변수에 각각의 값을 셋팅
			memberScore.setMemberNo(memberNo);
			memberScore.setScore(score);
			
			// insertMemberScore 메서드를 통해 레코드 삽입
			memberScoreDao.insertMemberScore(memberScore);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>