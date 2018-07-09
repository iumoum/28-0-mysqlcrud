<!-- 18.07.03 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao" %>
<%@ page import="service.MemberAddr" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberAddrInsertAction Page</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("euc-kr");  
		MemberAddr insertMemberAddr = new MemberAddr();
		// MeberAddr 클래스타입인 insertMemberAddr변수에 생성자메서드로 객체를 만들어서 주소값을 만들고 그 주소값을 할당한다
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		// memberNo변수에 memberAddrInsertForm.jsp에서 넘어온 memberNo값을 int형으로 바꾸고 담는다.
		String memberAddrContent = request.getParameter("memberAddrContent");
		// memberAddrContent변수에 memberAddrInsertForm.jsp에서 넘어온 memberAddrContent값을 담는다.
		insertMemberAddr.setMemberNo(memberNo);
		insertMemberAddr.setMemberAddrContent(memberAddrContent);
		// insertMemberAddr변수에 담긴 주소값에 있는 set메서드를 입력변수에 담긴 값을 이용하여 실행한다.
		MemberAddrDao memberAddrdao = new MemberAddrDao();
		// MemberAddrDao 클레스타입인 memberAddrdao변수에 생성자메서드로 객체를 만들어서 주소값을 만들고 그 주소값을 할당한다.
		memberAddrdao.insertMemberAddr(insertMemberAddr);
		// memberAddrdao주소에 있는 insertMemberAddr메서드를 insertMemberAddr주소에 있는 memberAddr클래스를 사용하여 실행한다.
		response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		// memberList.jsp로 페이지를 이동한다.
	%>
</body>
</html>