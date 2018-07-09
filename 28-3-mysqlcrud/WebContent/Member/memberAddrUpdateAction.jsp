<!-- 18.07.09 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="service.MemberAddrDao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberAddrUpdateAction Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberAddrContent = request.getParameter("memberAddrContent");
			
			MemberAddrDao memberaddrdao = new MemberAddrDao();
			memberaddrdao.updateMemberAddr(memberNo, memberAddrContent);
			
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>