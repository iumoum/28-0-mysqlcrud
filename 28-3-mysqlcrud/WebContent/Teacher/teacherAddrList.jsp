<!-- 2018.07.10 김지완 -->
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
						// TeacherAddrDao 객체 생성
						TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
						// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
						int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
						
						// teacherNo 변수 안의 값을 테스트
						System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
						
						// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
						ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
					%>
					<h1>Teacher Address</h1>
					<br><br><br>
					<table id="entityListTable" >
						<thead>
							<tr>
								<th style="width:70px">주소 번호</th>
								<th>교사 번호</th>
								<th>교사 주소</th>
								<th>수정</th>
								<th>삭제</th>
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
						<a id="buttonToList" href="<%= request.getContextPath() %>/Teacher/teacherList.jsp">목록으로</a>
					</div>
				</div>
			</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>