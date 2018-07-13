<!-- 18.07.09 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberUpdateAction Page</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			
			int memberNo = Integer.parseInt(request.getParameter("memberNo"));
			String memberName = request.getParameter("memberName");
			int memberAge = Integer.parseInt(request.getParameter("memberAge"));
			
			MemberDao memberdao = new MemberDao();
			memberdao.updateMember(memberNo, memberName, memberAge);
			
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>