<!-- 18.07.09 28�� ���Է� -->
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
					<td >MemberUpdate ������</td>
				</tr>
				<tr>
					<td>
						<div>ȸ����ȣ : <input type="text" name="memberNo" value="<%=member.getMemberNo()%>" readonly></div> <br>
						<div>�̸� : <input type="text" name="memberName" value="<%=member.getMemberName()%>"></div> <br>
						<div>���� : <input type="text" name="memberAge" value="<%=member.getMemberAge()%>"></div>	<br>
						<div><input type="submit" value="�Է��ϱ�"></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>