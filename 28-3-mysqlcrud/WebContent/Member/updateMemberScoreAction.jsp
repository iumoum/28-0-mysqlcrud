<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
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
			// 한글 입력받기 위함
			request.setCharacterEncoding("euc-kr");
			
			// MemberScore 객체 생성
			MemberScore memberScore = new MemberScore();
			
			// MemberScoreDao 객체 생성
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			
			// updateMemberScoreForm으로 부터 받은 값들을 각각의 변수에 대입
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberName = request.getParameter("memberName");
			int score = Integer.parseInt(request.getParameter("memberScore"));
			
			// 값 테스트
			System.out.println("memberNo, updateMemberScoreForm.jsp => updateMemberScoreAction.jsp" + memberNo);
			System.out.println("memberName, updateMemberScoreForm.jsp => updateMemberScoreAction.jsp" + memberName);
			System.out.println("memberScore, updateMemberScoreForm.jsp => updateMemberScoreAction.jsp" + memberScore);
			
			// memberScore 객체의 멤버변수에 각각의 값을 대입
			memberScore.setMemberNo(memberNo);
			memberScore.setScore(score);
			
			// updateMemberScore 메서드를 호출하여 업데이트
			memberScoreDao.updateMemberScore(memberScore);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/Member/memberScoreList.jsp?memberNo=" + memberNo);
		%>
	</body>
</html>