<!-- 18.07.09 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao" %>
<%@ page import="service.MemberAddr" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberList Page</title>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="7"><a href="<%=request.getContextPath()%>/Member/memberIndex.jsp">member ������</a></td>
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
					MemberAddr memberAddr = list.get(i);
			%>	
					<tr>
						<td><%= memberAddr.getMemberAddrNo() %></td>
						<td><%= memberAddr.getMemberNo()%></td>
						<td><%= memberAddr.getMemberAddrContent()%></td>
						<td>
							<a href="<%= request.getContextPath() %>/Member/memberAddrUpdateForm.jsp?sendNo=<%= memberAddr.getMemberNo() %>">����</a>			
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/Member/memberAddrDeleteAction.jsp?sendNo=<%= memberAddr.getMemberNo() %>">����</a>			
						</td>
					</tr>
			<%
				}
			%>
	</table>
			
			<form action="<%= request.getContextPath() %>/Member/memberList.jsp" method="post">
				<div>
					�̸� :
					<input type="text" name="searchWord">
					<button type="submit">�˻�</button><br>
				</div>
			</form>
</body>

</html>