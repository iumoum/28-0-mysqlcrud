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
		<title>Student List</title>
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
					
					// StudentDao ��ü ����
					StudentDao studentDao = new StudentDao();
					
					// studentAddrDao ��ü ����
					StudentAddrDao studentAddrDao = new StudentAddrDao();
					
					
					// studentScoreDao ��ü ����
					StudentScoreDao studentScoreDao = new StudentScoreDao();
					
					
					
					// selectStudentByPage �޼��带 ���� ���ϵǴ� ���� ��(arrayListStudent��ü�� ������)�� ����
					ArrayList<Student> arrayListStudent = studentDao.selectStudentByPage(currentPage, rowPerPage, searchValue);
					
					// ������ ������
					int lastPage = studentDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
					if ((studentDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>Student List</h1><br>
				<div id="buttonForSearch">
					<form action="<%= request.getContextPath() %>/Student/studentList.jsp" method="post">
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
						// ex) arrayListStudent[17] ���� �����͸� ���� ���� ��� 18�� ����
						for(int i = 0; i < arrayListStudent.size(); i++){
							// get�޼��带 ���� ������ ��ҿ� ����� Student ��ü�� �ҷ��´�.
							Student student = arrayListStudent.get(i);
							
							// selectStudentAddress �޼��带 ȣ���ϰ� ���Ϲ��� StudentAddr��ü�� ���� ���� studentAddr ��ü ���������� ���� 
							ArrayList<StudentAddr> arrayListStudentAddr = studentAddrDao.selectStudentAddress(student.getStudentNo());
					%>
							<tr>
								<td><%= student.getStudentNo() %></td>
								<%
									// �ش� ������ �ּ� ������ �����Ѵٸ�
									if(arrayListStudentAddr.size() != 0){
								%>
										<td><a title="�ּ� ����" class="buttonToShowAddress" href="<%= request.getContextPath() %>/Student/studentAddrList.jsp?studentNo=<%= student.getStudentNo() %>"><%= student.getStudentName() %></a></td>
								<%	
									// �� ��
									} else {
								%>
										<td><%= student.getStudentName() %></td>
								<%
									}
								%>
								<td><%= student.getStudentAge() %></td>
								<td><a title="�ּ� �߰�" class="buttonToInsertAddress" href="<%= request.getContextPath() %>/Student/insertStudentAddrForm.jsp?studentNo=<%= student.getStudentNo() %>">+ ADDRESS</a></td>
								<%
									// �ش��ϴ� ������ ������ �������� �ʴ´ٸ� ���� �Է� ��ư�� ������
									StudentAndStudentScore studentAndStudentScore = studentScoreDao.selectStudentAndStudentScore(student.getStudentNo());
									if(studentAndStudentScore == null){
								%>
										<td><a title="���� �Է�" class="buttonToInsertScore" href="<%= request.getContextPath() %>/Student/insertStudentScoreForm.jsp?studentNo=<%= student.getStudentNo() %>">+ SCORE</a></td>
										<td></td>
								<%
									// ������ �����Ѵٸ� �Ⱥ����� (1:1 ���踦 �����ϱ� ����)
									} else {
								%>
										<td></td>
										<td><a title="���� Ȯ��" class="buttonToShowScore" href="<%= request.getContextPath() %>/Student/studentScoreList.jsp?studentNo=<%= student.getStudentNo() %>">VIEW SCORE</a></td>
								<%
									}
								%>
								<td><a title="���� ���� ����" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Student/updateStudentForm.jsp?studentNo=<%= student.getStudentNo() %>">UPDATE</a></td>
								<td><a title="���� ���� ����" class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Student/deleteStudentAction.jsp?studentNo=<%= student.getStudentNo() %>">DELETE</a></td>
							</tr>
					<% 
						}
					%>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>/Student/insertStudentForm.jsp">+ STUDENT</a>
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
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Student/studentList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; ����</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; ����</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Student/studentList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">���� &gt;</a>
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