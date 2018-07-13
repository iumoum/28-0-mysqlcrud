<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
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
			// 한글
			request.setCharacterEncoding("euc-kr");
		
			// updateMemberAddrForm.jsp로부터 넘겨받은 값을 각각의 변수에 대입
			int memberAddressNo = Integer.parseInt(request.getParameter("memberAddressNo"));
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberAddressContent = request.getParameter("memberAddressContent");
			
			// 값 테스트
			System.out.println("memberAddressNo from updateMemberAddrForm, updateMemberAddrAction.jsp : " + memberAddressNo );
			System.out.println("memberNo from updateMemberAddrForm, updateMemberAddrAction.jsp : " + memberNo );
			System.out.println("memberAddressContent from updateMemberAddrForm, updateMemberAddrAction.jsp : " + memberAddressContent );
			
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			MemberAddr memberAddr = new MemberAddr();
			
			// 넘겨받은 값을 VO에 대입
			memberAddr.setMemberAddrNo(memberAddressNo);
			memberAddr.setMemberNo(memberNo);
			memberAddr.setMemberAddrContent(memberAddressContent);
			
			// updateMemberAddress 메서드를 호출하여 업데이트 
			memberAddrDao.updateMemberAddress(memberAddr);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/Member/memberAddrList.jsp?memberNo=" + memberNo);
		%>
	</body>
</html>