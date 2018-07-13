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
		<title>Member List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// �ѱ��� �Է¹ޱ� ����
					request.setCharacterEncoding("euc-kr");
					
					// �˻�� ���޹޴� ����
					String searchValue = "";
					if(request.getParameter("searchValue") != null){
						searchValue = request.getParameter("searchValue");
					}
					
					System.out.println(searchValue);
					
					// ����¡ �˰���
					int rowPerPage = 5;
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
					
					// MemberDao ��ü ����
					MemberDao memberDao = new MemberDao();
					
					// memberAddrDao ��ü ����
					MemberAddrDao memberAddrDao = new MemberAddrDao();
					
					
					// memberScoreDao ��ü ����
					MemberScoreDao memberScoreDao = new MemberScoreDao();
					
					
					
					// selectMemberByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListMember��ü�� ������)�� ����
					ArrayList<Member> arrayListMember = memberDao.selectMemberByPage(currentPage, rowPerPage, searchValue);
					
					// ������ ������
					int lastPage = memberDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
					if ((memberDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>Member List</h1><br>
				<div id="buttonForSearch">
					<form action="<%= request.getContextPath() %>/Member/memberList.jsp" method="post">
						<label>�̸� :  
							<input type="text" name="searchValue">
						</label>
						<button>�˻�</button>
					</form>
				</div>
				<br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">���� ��ȣ</th>
							<th>���� �̸�</th>
							<th>���� ����</th>
							<th>�ּ� �Է�</th>							
							<th>���� �Է�</th>
							<th>���� ����</th>
							<th>�� ��</th>
							<th>�� ��</th>
						</tr>
					</thead>
					<% 
						// size() �޼���� ������ �ε��� ������ ��� ������ �������ش�.
						// ex) arrayListMember[17] ���� �����͸� ���� ���� ��� 18�� ����
						for(int i = 0; i < arrayListMember.size(); i++){
							// get�޼��带 ���� ������ ��ҿ� ����� Member ��ü�� �ҷ��´�.
							Member member = arrayListMember.get(i);
							
							// selectMemberAddress �޼��带 ȣ���ϰ� ���Ϲ��� MemberAddr��ü�� ���� ���� memberAddr ��ü ���������� ���� 
							ArrayList<MemberAddr> arrayListMemberAddr = memberAddrDao.selectMemberAddress(member.getMemberNo());
					%>
							<tr>
								<td><%= member.getMemberNo() %></td>
								<%
									// �ش� ������ �ּ� ������ �����Ѵٸ�
									if(arrayListMemberAddr.size() != 0){
								%>
										<td><a title="�ּ� ����" class="buttonToShowAddress" href="<%= request.getContextPath() %>/Member/memberAddrList.jsp?memberNo=<%= member.getMemberNo() %>"><%= member.getMemberName() %></a></td>
								<%	
									// �� ��
									} else {
								%>
										<td><%= member.getMemberName() %></td>
								<%
									}
								%>
								<td><%= member.getMemberAge() %></td>
								<td><a title="�ּ� �߰�" class="buttonToInsertAddress" href="<%= request.getContextPath() %>/Member/insertMemberAddrForm.jsp?memberNo=<%= member.getMemberNo() %>">+ ADDRESS</a></td>
								<%
									// �ش��ϴ� ������ ������ �������� �ʴ´ٸ� ���� �Է� ��ư�� ������
									MemberAndMemberScore memberAndMemberScore = memberScoreDao.selectMemberAndMemberScore(member.getMemberNo());
									if(memberAndMemberScore == null){
								%>
										<td><a title="���� �Է�" class="buttonToInsertScore" href="<%= request.getContextPath() %>/Member/insertMemberScoreForm.jsp?memberNo=<%= member.getMemberNo() %>">+ SCORE</a></td>
										<td></td>
								<%
									// ������ �����Ѵٸ� �Ⱥ����� (1:1 ���踦 �����ϱ� ����)
									} else {
								%>
										<td></td>
										<td><a title="���� Ȯ��" class="buttonToShowScore" href="<%= request.getContextPath() %>/Member/memberScoreList.jsp?memberNo=<%= member.getMemberNo() %>">VIEW SCORE</a></td>
								<%
									}
								%>
								<td><a title="���� ���� ����" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Member/updateMemberForm.jsp?memberNo=<%= member.getMemberNo() %>">UPDATE</a></td>
								<td><a title="���� ���� ����" class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Member/deleteMemberAction.jsp?memberNo=<%= member.getMemberNo() %>">DELETE</a></td>
							</tr>
					<% 
						}
					%>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>/Member/insertMemberForm.jsp">+ MEMBER</a>
				</div>
				<br><br>
				<div id="page">
					<span><%= currentPage %> / <%= lastPage %></span>
				</div>
				<br>
				<div id="buttonForAnotherPage">
					<%
						if(currentPage > 1){
					%>
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Member/memberList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; ����</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; ����</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Member/memberList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">���� &gt;</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7;">���� &gt;</span>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>