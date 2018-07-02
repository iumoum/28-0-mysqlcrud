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
	<table border="1" width="500px" height="300px">
		<tr>
			<td colspan="5">member ������</td>
		</tr>
			<%
				int currentPage = 1;    // ������ ��ȣ
				int pagePerRow = 3;	// ���������� ������ ���� ����
								
				if(request.getParameter("currentPage") != null ){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				} // currentPage�� null�϶� ���� ������ 1, null�� �ƴҶ� get������� �޾ƿ� ������ ����
				
				int startPage = (currentPage-1) * pagePerRow; // ������ ��ȣ
				
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.selectMemberAll(startPage, pagePerRow);
				
				for (int i=0;i<list.size();i++) {
					System.out.println(i);
					Member m = list.get(i);
			%>	
					<tr>
						<td><%= m.getMemberNo() %></td>
						<td><%= m.getMemberName() %></td>
						<td><%= m.getMemberAge() %></td>
						<td>
							<a href="<%= request.getContextPath() %>/mUpdate/memberUpdateForm.jsp?send_no=<%= m.getMemberNo() %>">������ư</a>			
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/mDelete/memberDeletePro.jsp?send_no=<%= m.getMemberNo() %>">������ư</a>			
						</td>
					</tr>
			<%
				}
			%>
	</table>
			
			<%	
									
				int lastPage = (list.size()) / pagePerRow; // ������������ ��
				
				if(list.size() % pagePerRow != 0) {
					lastPage++;
				}
				
				if(currentPage > 1) { // currentPage�� 1���� ũ�� ������������ ���� ���� ����
			%>
				<a href="./memberList.jsp?currentPage=<%=currentPage - 1%>">����</a>
			<%
				}
				
				if(currentPage-1 < lastPage) { // ���������������� �������������� ������ ������������ ���� ���� ����
			%>	
				<a href="./memberList.jsp?currentPage=<%=currentPage + 1%>">����</a>
			<% 
				}
			%>
</body>

</html>