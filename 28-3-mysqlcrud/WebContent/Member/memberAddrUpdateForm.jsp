<!-- 18.07.09 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao"%>
<%@ page import="service.MemberAddr"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberAddrUpdate Page</title>
</head>
<body>
	<%
	 	request.setCharacterEncoding("euc-kr");
		
		int memberNo = Integer.parseInt(request.getParameter("sendNo"));
		
		MemberAddrDao memberaddrdao = new MemberAddrDao();
		
		ArrayList<MemberAddr> list = memberaddrdao.selectMemberAddrAll(memberNo);
	%>
	<form action="./memberAddrUpdateAction.jsp" method="post">
		<table border="1">
			<tr>
				<td><a href="<%=request.getContextPath()%>/Member/memberList.jsp">MemberAddress ������</a></td>
			</tr>
	<%
		for (int i=0;i<list.size();i++) {
			MemberAddr memberaddr = list.get(i);
	%>
			<tr>
				<td>
					<div>����� ��ȣ: <input type="text" name="memberNo" value="<%=memberNo%>" readonly></div> <br>
					<div>�ּ� : <input type="text" name="memberAddrContent" value="<%=memberaddr.getMemberAddrContent()%>"></div> <br>
					<div><input type="submit" value="�Է��ϱ�"></div>
				</td>
			</tr>
	<%
		}
	%>
		</table>
	</form>
</body>
</html>