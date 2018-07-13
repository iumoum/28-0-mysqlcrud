<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Insert Action</title>
	</head>
	<body>
		<%
			// 한글을 받기 위함
			request.setCharacterEncoding("euc-kr");
		
			// DTO 생성 및 객체참조변수에 참조값 할당
			Member member = new Member();
			MemberAddr memberAddr = new MemberAddr();
			
			// DAO 생성 및 객체참조변수에 참조값 할당
			MemberDao memberDao = new MemberDao();
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			
			// memberInsertForm.jsp 로부터 넘겨받은 값			
			int memberAge = Integer.parseInt(request.getParameter("memberAge"));
			String memberName = request.getParameter("memberName");
			
			// memberInsertForm.jsp 로부터 넘겨받은 값 출력 (테스트)
			System.out.println("memberName from memberInsertForm.jsp : " + memberName );
			System.out.println("memberAge from memberInsertForm.jsp : " + memberAge );
			
			// member DTO 내부 멤버변수에 set메서드를 통하여 값을 대입
			member.setMemberName(memberName);
			member.setMemberAge(memberAge);
			
			// member DTO 내부 멤버변수들의 값 출력 (테스트)
			System.out.println("memberName from memberDTO : " + member.getMemberName() );
			System.out.println("memberAge from memberDTO : " + member.getMemberAge() );
		
			// memberDAO 내부의 insert 메서드 호출
			// 매개변수로 member 객체의 참조 값 전달
			memberDao.insertMember(member);
			
			// memberInsertForm.jsp 화면으로 이동
			response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
		%>
	</body>
</html>