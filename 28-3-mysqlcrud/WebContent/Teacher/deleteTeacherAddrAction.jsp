<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Teacher Action</title>
	</head>
	<body>
		<%
			// teacherList.jsp�� ���� �Ѱܹ��� teacherNo ���� ������ ���� �� �׽�Ʈ
			int teacherAddressNo = Integer.parseInt(request.getParameter("teacherAddressNo"));
			System.out.println("teacherAddressNo from teacherAddrList.jsp : " + teacherAddressNo);
			
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// teacher_address ���̺��� teacher ���̺��� �����ϴ� �����̱� ������ taecher_address ���̺� ���� ���õ� ������ ���� �����ؾ��Ѵ�.
			teacherAddrDao.deleteTeacherAddress(teacherAddressNo);
			
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherList.jsp");
		%>
	</body>
</html>