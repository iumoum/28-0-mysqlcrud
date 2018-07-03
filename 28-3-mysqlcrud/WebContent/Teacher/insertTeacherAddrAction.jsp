<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Teacher Address Action</title>
	</head>
	<body>
		<%
			// 인코딩 방식 설정
			request.setCharacterEncoding("euc-kr");
		
			//TeacherAddr, TeacherAddrDao 객체 생성 
			TeacherAddr teacherAddr = new TeacherAddr();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// insertTeacherAddrForm.jsp로 부터 받아온 teacherNo, teacherAddressContent값을 각각의변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherAddressContent = request.getParameter("teacherAddressContent");
			
			// teacherNo 변수 안의 값을 테스트
			System.out.println("teacherNo, insertTeacherAddrForm.jsp = > insertTeacherAddrAction.jsp : " + teacherNo);
			System.out.println("teacherAddressContent, insertTeacherAddrForm.jsp = > insertTeacherAddrAction.jsp : " + teacherAddressContent);
			
			// teacherAddr 객체 내부의 멤버 변수에 각각의 값을 셋팅
			teacherAddr.setTeacherNo(teacherNo);
			teacherAddr.setTeacherAddrContent(teacherAddressContent);
			
			// insertTeacherAddress 메서드를 통해 레코드 삽입
			teacherAddrDao.insertTeacherAddress(teacherAddr);
		%>
	</body>
</html>