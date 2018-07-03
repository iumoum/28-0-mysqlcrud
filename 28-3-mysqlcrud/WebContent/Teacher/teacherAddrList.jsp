<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Address List</title>
	</head>
	<body>
		<%
			// TeacherAddrDao 객체 생성
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
		
			// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			
			// teacherNo 변수 안의 값을 테스트
			System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
			
			// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
			TeacherAddr teacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
		%>
		<h1>Teacher Address</h1>
		<table border="1">
			<tr>
				<td>주소 번호</td>
				<td>교사 번호</td>
				<td>교사 주소</td>
			</tr>
			<tr>
				<td><%= teacherAddr.getTeacherAddrNo() %></td>
				<td><%= teacherAddr.getTeacherNo() %></td>
				<td><%= teacherAddr.getTeacherAddrContent() %></td>
			</tr>
		</table>
	</body>
</html>