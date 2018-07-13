<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Member Action</title>
	</head>
	<body>
		<%
			// memberList.jsp로 부터 넘겨받은 memberNo 값을 변수에 대입 후 테스트
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			System.out.println("memberNo from memberList.jsp : " + memberNo);
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			MemberDao memberDao = new MemberDao();
			
			memberDao.deleteMember(memberNo);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>