<!-- 18.07.09 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberScoreDao"%>
<%@ page import="service.MemberAndScore"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberScore Page</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<td colspan="4"><a href="<%=request.getContextPath()%>/Member/memberList.jsp">MemberScore ������</a></td>
			</tr>
			<tr>
				<td>ȸ�� ��ȣ</td>
				<td>ȸ�� �̸�</td>
				<td>ȸ�� ����</td>
				<td>����</td>
			</tr>
				<%
					request.setCharacterEncoding("euc-kr");
					int memberNo = Integer.parseInt(request.getParameter("sendNo"));
					
					MemberScoreDao memberscoredao = new MemberScoreDao();
					ArrayList<MemberAndScore> list = memberscoredao.selectMemberScore(memberNo);
					
					for (int i=0;i<list.size();i++) {
						MemberAndScore mas = list.get(i);
				%>
					<tr>
							<td><%= mas.getMemberNo() %></td>
							<td><%= mas.getMemberName()%></td>
							<td><%= mas.getMemberAge() %></td>
							<td><%= mas.getScore()%></td>
						</tr>
				<%
					}
				%>
		</table>
	</body>
</html>