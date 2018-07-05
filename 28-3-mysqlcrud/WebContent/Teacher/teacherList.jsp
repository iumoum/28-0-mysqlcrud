<!-- 2018.07.02 김지완 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher List</title>
	</head>
	<body>
		<%
			// 페이징 알고리즘
			int rowPerPage = 5;
			int currentPage = 1;
			if(request.getParameter("currentPage") != null){
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			// TeacherDao 객체 생성
			TeacherDao teacherDao = new TeacherDao();
			
			// teacherAddrDao 객체 생성
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// selectTeacherByPage 메서드를 통해 리턴되는 참조 값(arrayListTeacher객체의 참조값)을 대입
			ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage);
			
			// 마지막 페이지
			int lastPage = teacherDao.countWholeRecordFromTeacher() / rowPerPage;
			if ((teacherDao.countWholeRecordFromTeacher() % rowPerPage) != 0){
				lastPage++;
			}
		%>
		<h1>Teacher</h1>
		<table border="1">
			<tr>
				<td>교사 번호</td>
				<td>교사 이름</td>
				<td>교사 나이</td>
				<td>주소 입력</td>
				<td>수 정</td>
				<td>삭 제</td>
			</tr>
			<% 
				// size() 메서드는 마지막 인덱스 까지의 요소 갯수를 리턴해준다.
				// ex) arrayListTeacher[17] 까지 데이터를 저장 했을 경우 18을 리턴
				for(int i = 0; i < arrayListTeacher.size(); i++){
					// get메서드를 통해 각각의 요소에 저장된 Teacher 객체를 불러온다.
					Teacher teacher = arrayListTeacher.get(i);
					
					// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
					TeacherAddr teacherAddr = teacherAddrDao.selectTeacherAddress(teacher.getTeacherNo());
			%>
					<tr>
						<td><%= teacher.getTeacherNo() %></td>
						<%
							// 해당 교사의 주소 정보가 존재한다면
							if(teacherAddr != null){
						%>
								<td><a href="<%= request.getContextPath() %>/Teacher/teacherAddrList.jsp?teacherNo=<%= teacher.getTeacherNo() %>"><%= teacher.getTeacherName() %></a></td>
						<%	
							// 그 외
							} else {
						%>
								<td><%= teacher.getTeacherName() %></td>
						<%
							}
						%>
						<td><%= teacher.getTeacherAge() %></td>
						<%
							// 해당 교사의 주소 정보가 없다면
							if(teacherAddr == null){
						%>
								<td><a href="<%= request.getContextPath() %>/Teacher/insertTeacherAddrForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">주소 입력</a></td>
						<%
							// 그 외
							} else {
						%>
								<td></td>
						<%
							}
						%>
						<td><a href="<%= request.getContextPath() %>/Teacher/updateTeacherForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">수정 버튼</a></td>
						<td><a href="<%= request.getContextPath() %>/Teacher/deleteTeacherAction.jsp?teacherNo=<%= teacher.getTeacherNo() %>">삭제 버튼</a></td>
					</tr>
			<% 
				}
			%>
		</table>
		<div>
			<%
				if(currentPage > 1){
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%= currentPage - 1 %>">&lt; 이전</a>
			<%
				} else {
			%>
					<span>&lt; 이전</span>
			<%
				}
				
				if(currentPage < lastPage){
			%>
					<a href="<%= request.getContextPath() %>/Teacher/teacherList.jsp?currentPage=<%= currentPage + 1 %>">다음 &gt;</a>
			<%
				} else {
			%>
					<span>다음 &gt;</span>
			<%
				}
			%>
		</div>
	</body>
</html>