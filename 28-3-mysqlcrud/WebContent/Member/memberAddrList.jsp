<!-- 18.07.09 28�� ���Է� -->
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
				<td colspan="7"><a href="<%=request.getContextPath()%>/Member/memberIndex.jsp">MemberAddress ������</a></td>
			</tr>
			<tr>
				<td>�ּҹ�ȣ</td>
				<td>ȸ����ȣ</td>
				<td>�ּ�</td>
				<td>�����ϱ�</td>
				<td>�����ϱ�</td>
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
								<a href="<%= request.getContextPath() %>/Member/memberAddrUpdateForm.jsp?sendNo=<%= memberaddr.getMemberNo() %>">����</a>			
							</td>
							<td>
								<a href="<%= request.getContextPath() %>/Member/memberAddrDeleteAction.jsp?sendNo=<%= memberaddr.getMemberNo() %>">����</a>			
							</td>
						</tr>
				<%
					}
				%>
		</table>
	</body>
</html>