<!-- 18.07.09 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao" %>
<%@ page import="service.MemberAddr" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberAddrList Page</title>
	</head>
	<body>
		<table border="1">
			<tr>
				<td colspan="7"><a href="<%=request.getContextPath()%>/Member/memberIndex.jsp">MemberAddress 데이터</a></td>
			</tr>
			<tr>
				<td>주소번호</td>
				<td>회원번호</td>
				<td>주소</td>
				<td>수정하기</td>
				<td>삭제하기</td>
			</tr>
				<%
					request.setCharacterEncoding("euc-kr");
					
					int memberNo = Integer.parseInt(request.getParameter("sendNo"));
					MemberAddrDao memberAddrDao = new MemberAddrDao();
					ArrayList<MemberAddr> list = memberAddrDao.selectMemberAddrAll(memberNo);
					
					for (int i=0;i<list.size();i++) {
						MemberAddr memberaddr = list.get(i);
				%>	
						<tr>
							<td><%= memberaddr.getMemberAddrNo() %></td>
							<td><%= memberaddr.getMemberNo()%></td>
							<td><%= memberaddr.getMemberAddrContent()%></td>
							<td>
								<a href="<%= request.getContextPath() %>/Member/memberAddrUpdateForm.jsp?sendNo=<%= memberaddr.getMemberNo() %>">수정</a>			
							</td>
							<td>
								<a href="<%= request.getContextPath() %>/Member/memberAddrDeleteAction.jsp?sendNo=<%= memberaddr.getMemberNo() %>">삭제</a>			
							</td>
						</tr>
				<%
					}
				%>
		</table>
	</body>
</html>