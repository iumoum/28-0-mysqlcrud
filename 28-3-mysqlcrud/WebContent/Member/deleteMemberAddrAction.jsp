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
			int memberAddressNo = Integer.parseInt(request.getParameter("memberAddressNo"));
			System.out.println("memberAddressNo from memberAddrList.jsp : " + memberAddressNo);
			
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			
			// member_address 테이블이 member 테이블을 참조하는 구조이기 때문에 taecher_address 테이블 안의 관련된 정보를 먼저 삭제해야한다.
			memberAddrDao.deleteMemberAddress(memberAddressNo);
			
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>