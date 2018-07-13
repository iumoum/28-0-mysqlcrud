<!-- 18.07.09 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberAddrDelete Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			
			int memberNo = Integer.parseInt(request.getParameter("sendNo"));
			MemberAddrDao memberaddrdao = new MemberAddrDao();
			memberaddrdao.deleteMemberAddr(memberNo);
			
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>