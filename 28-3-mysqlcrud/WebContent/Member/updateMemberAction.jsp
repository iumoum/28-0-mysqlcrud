<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
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
			// 한글
			request.setCharacterEncoding("euc-kr");
		
			// updateMemberForm.jsp로부터 넘겨받은 값을 각각의 변수에 대입
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberName = request.getParameter("memberName");
			int memberAge = Integer.parseInt(request.getParameter("memberAge"));
			
			// 값 테스트
			System.out.println("memberNo from updateMemberForm, updateMemberAction.jsp : " + memberNo );
			System.out.println("memberName from updateMemberForm, updateMemberAction.jsp : " + memberName );
			System.out.println("memberAge from updateMemberForm, updateMemberAction.jsp : " + memberAge );
			
			MemberDao memberDao = new MemberDao();
			Member member = new Member();
			
			// 넘겨받은 값을 VO에 대입
			member.setMemberNo(memberNo);
			member.setMemberName(memberName);
			member.setMemberAge(memberAge);
			
			// updateMember 메서드를 호출하여 업데이트 
			memberDao.updateMember(member);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
		
	</body>
</html>