<!-- 2018.07.10 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<title>Teacher List</title>
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
					
					// TeacherDao ��ü ����
					TeacherDao teacherDao = new TeacherDao();
					
					// teacherAddrDao ��ü ����
					TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
					
					// teacherScoreDao ��ü ����
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					
					
					// selectTeacherByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListTeacher��ü�� ������)�� ����
					ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage, searchValue);
					
					// ������ ������
					int lastPage = teacherDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
					if ((teacherDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>Teacher List</h1><br>
				<div id="buttonForSearch">
					<form action="<%= request.getContextPath() %>/Teacher/teacherList.jsp" method="post">
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
						// ex) arrayListTeacher[17] ���� �����͸� ���� ���� ��� 18�� ����
						for(int i = 0; i < arrayListTeacher.size(); i++){
							// get�޼��带 ���� ������ ��ҿ� ����� Teacher ��ü�� �ҷ��´�.
							Teacher teacher = arrayListTeacher.get(i);
							
							// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
							ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacher.getTeacherNo());
					%>
							<tr>
								<td><%= teacher.getTeacherNo() %></td>
								<%
									// �ش� ������ �ּ� ������ �����Ѵٸ�
									if(arrayListTeacherAddr.size() != 0){
								%>
										<td><a title="�ּ� ����" class="buttonToShowAddress" href="<%= request.getContextPath() %>/Teacher/teacherAddrList.jsp?teacherNo=<%= teacher.getTeacherNo() %>"><%= teacher.getTeacherName() %></a></td>
								<%	
									// �� ��
									} else {
								%>
										<td><%= teacher.getTeacherName() %></td>
								<%
									}
								%>
								<td><%= teacher.getTeacherAge() %></td>
								<td><a title="�ּ� �߰�" class="buttonToInsertAddress" href="<%= request.getContextPath() %>/Teacher/insertTeacherAddrForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">+ ADDRESS</a></td>
								<%
									// �ش��ϴ� ������ ������ �������� �ʴ´ٸ� ���� �Է� ��ư�� ������
									TeacherAndTeacherScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacher.getTeacherNo());
									if(teacherAndTeacherScore == null){
								%>
										<td><a title="���� �Է�" class="buttonToInsertScore" href="<%= request.getContextPath() %>/Teacher/insertTeacherScoreForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">+ SCORE</a></td>
										<td></td>
								<%
									// ������ �����Ѵٸ� �Ⱥ����� (1:1 ���踦 �����ϱ� ����)
									} else {
								%>
										<td></td>
										<td><a title="���� Ȯ��" class="buttonToShowScore" href="<%= request.getContextPath() %>/Teacher/teacherScoreList.jsp?teacherNo=<%= teacher.getTeacherNo() %>">VIEW SCORE</a></td>
								<%
									}
								%>
								<td><a title="���� ���� ����" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Teacher/updateTeacherForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">UPDATE</a></td>
								<td><a title="���� ���� ����" class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Teacher/deleteTeacherAction.jsp?teacherNo=<%= teacher.getTeacherNo() %>">DELETE</a></td>
							</tr>
					<% 
						}
					%>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>/Teacher/insertTeacherForm.jsp">+ TEACHER</a>
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
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; ����</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; ����</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">���� &gt;</a>
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