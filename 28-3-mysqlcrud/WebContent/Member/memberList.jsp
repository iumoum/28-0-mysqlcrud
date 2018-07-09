<!-- 18.07.02 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberDao" %>
<%@ page import="service.Member" %>
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
				<td colspan="8"><a href="<%=request.getContextPath()%>/Member/memberIndex.jsp">member ������</a></td>
			</tr>
			<tr>
				<td>��ȣ</td>
				<td>�̸�</td>
				<td>����</td>
				<td>�ּ��Է�â</td>
				<td>�����Է�â</td>
				<td>���� �ϱ�</td>
				<td>���� �ϱ�</td>
				<td>���� ����</td>
			</tr>
				<%
					request.setCharacterEncoding("euc-kr");
				
					int currentPage = 1;    // ������ ��ȣ
					int pagePerRow = 5;	// ���������� ������ ���� ����
					int totalRow = 0; // ��ü ���� ����
					String searchWord = "";
					
					if(request.getParameter("currentPage") != null ){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
					
					if(request.getParameter("searchWord") != null ){
						searchWord = request.getParameter("searchWord");
					}
					// currentPage�� null�϶� ���� ������ 1, null�� �ƴҶ� get������� �޾ƿ� ������ ����
					
					int startPage = (currentPage-1) * pagePerRow; // ������ ��ȣ
					
					MemberDao memberDao = new MemberDao();
					ArrayList<Member> list = memberDao.selectMemberAll(startPage, pagePerRow, searchWord);
					
					for (int i=0;i<list.size();i++) {
						Member m = list.get(i);
				%>	
						<tr>
							<td><%= m.getMemberNo() %></td>
							<td><a href="<%=request.getContextPath()%>/Member/memberAddrSelectList.jsp?sendNo=<%= m.getMemberNo() %>"><%= m.getMemberName()%></a></td>
							<td><%= m.getMemberAge() %></td>
							<td>
								<a href="<%= request.getContextPath()%>/Member/memberAddrInsertForm.jsp?sendNo=<%= m.getMemberNo() %>">�ּ��Է�</a>
							</td>
							<td>
								<a href="<%= request.getContextPath()%>/Member/memberScoreInsertForm.jsp?sendNo=<%= m.getMemberNo() %>">�����Է�</a>
							</td>
							<td>
								<a href="<%= request.getContextPath()%>/Member/memberUpdateForm.jsp?sendNo=<%= m.getMemberNo() %>">����</a>			
							</td>
							<td>
								<a href="<%= request.getContextPath()%>/Member/memberDeleteAction.jsp?sendNo=<%= m.getMemberNo() %>">����</a>			
							</td>
							<td><a href="<%= request.getContextPath()%>/Member/memberScoreList.jsp?sendNo=<%= m.getMemberNo() %>">��������</a></td>
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
				
				<%	
					totalRow = memberDao.totalRow();					
					int lastPage = (totalRow / pagePerRow); // ������������ ��
					
					if (totalRow % pagePerRow != 0) {
						lastPage++;
					}
					
					if (currentPage > 1) { // currentPage�� 1���� ũ�� ������������ ���� ���� ����
				%>
					<a href="./memberList.jsp?currentPage=<%=currentPage - 1%>">����</a>
				<%
					}
					if (currentPage < lastPage) { // ���������������� �������������� ������ ������������ ���� ���� ����
				%>	
					<a href="./memberList.jsp?currentPage=<%=currentPage + 1%>">����</a>
				<% 
					}
				%>
	</body>
</html>