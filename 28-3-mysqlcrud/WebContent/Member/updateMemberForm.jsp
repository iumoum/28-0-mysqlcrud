<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Member Form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
				// memberList.jsp로 부터 넘겨받은 memberNo 값을 변수에 대입 후 테스트
				int memberNo = Integer.parseInt(request.getParameter("memberNo"));
				System.out.println("memberNo from memberList.jsp : " + memberNo);
				
				MemberDao memberDao = new MemberDao();
				MemberAddrDao memberAddrDao = new MemberAddrDao();
				
				// selectForUpdateMember 메서드를 호출하고 member 객체의 참조값을 리턴 받아 변수에 대입.
				Member member = memberDao.selectForUpdateMember(memberNo);
				%>
				<h1>Update Member</h1>
				<br><br><br>
				<form action="<%= request.getContextPath() %>/Member/updateMemberAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>교사 번호 : </td>
							<td><input type="text" name="memberNo" value="<%= member.getMemberNo() %>" readonly>
						</tr>
						<tr>
							<td>교사 이름 : </td>
							<td><input type="text" name="memberName" value="<%= member.getMemberName() %>">
						</tr>
						<tr>
							<td>교사 나이 : </td>
							<td><input type="text" name="memberAge" value="<%= member.getMemberAge() %>">
						</tr>
						<tr>
							<td colspan="2"><button>수정</button></td>
						</tr>
					</table>
				</form>
				<br>
				<a href="<%= request.getContextPath() %>/Member/memberList.jsp">memberList로 이동</a>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>