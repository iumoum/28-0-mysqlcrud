<!-- 2018.07.10 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Address List</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
			<div id="container">
				<%@ include file="/module/nav.jsp" %>
				<div id="article">
					<%
						// TeacherAddrDao ��ü ����
						TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
						// teacherList.jsp�� ���� ���� ���� teacherNo ���� ������ ����
						int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
						
						// teacherNo ���� ���� ���� �׽�Ʈ
						System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
						
						// selectTeacherAddress �޼��带 ȣ���ϰ� ���Ϲ��� TeacherAddr��ü�� ���� ���� teacherAddr ��ü ���������� ���� 
						ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
					%>
					<h1>Teacher Address</h1>
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
							System.out.println(arrayListTeacherAddr.size() + "<== size");
							for(int i = 0; i < arrayListTeacherAddr.size(); i++){
						%>
							<tr>
								<td><%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %></td>
								<td><%= arrayListTeacherAddr.get(i).getTeacherNo() %></td>
								<td><%= arrayListTeacherAddr.get(i).getTeacherAddrContent() %></td>
								<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Teacher/updateTeacherAddrForm.jsp?teacherAddressNo=<%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %>">UPDATE</a></td>
								<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Teacher/deleteTeacherAddrAction.jsp?teacherAddressNo=<%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %>">DELETE</a></td>
							</tr>
						<%
							}
						%>
					</table>
					<br>
					<div id="listButton">
						<a id="buttonToList" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">�������</a>
					</div>
				</div>
			</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>