<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<title>Member Address List</title>		
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// MemberAddrDao ��ü ����
					MemberAddrDao memberAddrDao = new MemberAddrDao();
					
					// memberList.jsp�� ���� ���� ���� memberNo ���� ������ ����
					int memberNo = Integer.parseInt(request.getParameter("memberNo"));
					
					// memberNo ���� ���� ���� �׽�Ʈ
					System.out.println("memberNo, memberList.jsp => memberAddrList.jsp : " + memberNo);
						
					// selectMemberAddress �޼��带 ȣ���ϰ� ���Ϲ��� MemberAddr��ü�� ���� ���� memberAddr ��ü ���������� ���� 
					ArrayList<MemberAddr> arrayListMemberAddr = memberAddrDao.selectMemberAddress(memberNo);		
				%>
				<h1>Member Address</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<th style="width:70px">�ּ� ��ȣ</th>
							<th>���� ��ȣ</th>
							<th>���� �ּ�</th>
							<th>����</th>
							<th>����</th>
						</tr>
					</thead>
						<%
							System.out.println(arrayListMemberAddr.size() + "<== size");
							for(int i = 0; i < arrayListMemberAddr.size(); i++){
						%>
							<tr>
								<td><%= arrayListMemberAddr.get(i).getMemberAddrNo() %></td>
							<td><%= arrayListMemberAddr.get(i).getMemberNo() %></td>
							<td><%= arrayListMemberAddr.get(i).getMemberAddrContent() %></td>
							<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Member/updateMemberAddrForm.jsp?memberAddressNo=<%= arrayListMemberAddr.get(i).getMemberAddrNo() %>">UPDATE</a></td>
							<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Member/deleteMemberAddrAction.jsp?memberAddressNo=<%= arrayListMemberAddr.get(i).getMemberAddrNo() %>">DELETE</a></td>
						</tr>
					<%
						}
					%>
				</table>
				<br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Member/memberList.jsp">�������</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>