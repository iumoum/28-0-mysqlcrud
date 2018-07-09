<!-- 18.07.09 28기 정규룡 -->
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
				<td colspan="4"><a href="<%=request.getContextPath()%>/Member/memberList.jsp">MemberScore 데이터</a></td>
			</tr>
			<tr>
				<td>회원 번호</td>
				<td>회원 이름</td>
				<td>회원 나이</td>
				<td>점수</td>
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