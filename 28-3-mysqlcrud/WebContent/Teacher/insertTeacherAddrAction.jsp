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
			// ���ڵ� ��� ����
			request.setCharacterEncoding("euc-kr");
		
			//TeacherAddr, TeacherAddrDao ��ü ���� 
			TeacherAddr teacherAddr = new TeacherAddr();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// insertTeacherAddrForm.jsp�� ���� �޾ƿ� teacherNo, teacherAddressContent���� �����Ǻ����� ����
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherAddressContent = request.getParameter("teacherAddressContent");
			
			// teacherNo ���� ���� ���� �׽�Ʈ
			System.out.println("teacherNo, insertTeacherAddrForm.jsp = > insertTeacherAddrAction.jsp : " + teacherNo);
			System.out.println("teacherAddressContent, insertTeacherAddrForm.jsp = > insertTeacherAddrAction.jsp : " + teacherAddressContent);
			
			// teacherAddr ��ü ������ ��� ������ ������ ���� ����
			teacherAddr.setTeacherNo(teacherNo);
			teacherAddr.setTeacherAddrContent(teacherAddressContent);
			
			// insertTeacherAddress �޼��带 ���� ���ڵ� ����
			teacherAddrDao.insertTeacherAddress(teacherAddr);
		%>
	</body>
</html>