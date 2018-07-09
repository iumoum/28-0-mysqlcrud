<!-- 18.07.09 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Member"%>
<%@ page import="service.MemberDao"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>memberUpdateForm Page</title>
</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			
			int memberNo = Integer.parseInt(request.getParameter("sendNo"));
			MemberDao memberdao = new MemberDao();
			Member member = memberdao.selectMember(memberNo);
			
		%>
		<form action="./memberUpdateAction.jsp" method="post">
			<table border="1">
				<tr>
					<td >MemberUpdate 데이터</td>
				</tr>
				<tr>
					<td>
						<div>회원번호 : <input type="text" name="memberNo" value="<%=member.getMemberNo()%>" readonly></div> <br>
						<div>이름 : <input type="text" name="memberName" value="<%=member.getMemberName()%>"></div> <br>
						<div>나이 : <input type="text" name="memberAge" value="<%=member.getMemberAge()%>"></div>	<br>
						<div><input type="submit" value="입력하기"></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>