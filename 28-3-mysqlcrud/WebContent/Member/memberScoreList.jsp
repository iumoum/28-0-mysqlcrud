<<!-- 2018-07-13 ������(���Է� �������� ���� ��������) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Score List</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// MemberScoreDao ��ü ����
					MemberScoreDao memberScoreDao = new MemberScoreDao();
				
					// memberList.jsp�� ���� ���� ���� memberNo ���� ������ ����
					int memberNo = Integer.parseInt(request.getParameter("memberNo"));
					
					// memberNo ���� ���� ���� �׽�Ʈ
					System.out.println("memberNo, memberList.jsp => memberAddrList.jsp : " + memberNo);
					
					// selectMemberAddress �޼��带 ȣ���ϰ� ���Ϲ��� MemberAddr��ü�� ���� ���� memberAddr ��ü ���������� ���� 
					MemberAndMemberScore memberAndMemberScore = memberScoreDao.selectMemberAndMemberScore(memberNo);		
				%>
				<h1>Member Score List</h1>
				<br><br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th style="width:120px">���� �̸�</th>
							<th style="width:120px">����</th>
							<th>����</th>
						</tr>
					</thead>
					<tr>
						<td><%= memberAndMemberScore.getMember().getMemberNo() %></td>
						<td><%= memberAndMemberScore.getMember().getMemberName() %></td>
						<td><%= memberAndMemberScore.getMemberScore().getScore() %></td>
						<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Member/updateMemberScoreForm.jsp?memberNo=<%= memberAndMemberScore.getMember().getMemberNo() %>">UPDATE</a>
					</tr>
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