<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Address Action</title>
	</head>
	<body>
		<%
			// �ѱ�
			request.setCharacterEncoding("euc-kr");
		
			// updateTeacherAddrForm.jsp�κ��� �Ѱܹ��� ���� ������ ������ ����
			int teacherAddressNo = Integer.parseInt(request.getParameter("teacherAddressNo"));
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherAddressContent = request.getParameter("teacherAddressContent");
			
			// �� �׽�Ʈ
			System.out.println("teacherAddressNo from updateTeacherAddrForm, updateTeacherAddrAction.jsp : " + teacherAddressNo );
			System.out.println("teacherNo from updateTeacherAddrForm, updateTeacherAddrAction.jsp : " + teacherNo );
			System.out.println("teacherAddressContent from updateTeacherAddrForm, updateTeacherAddrAction.jsp : " + teacherAddressContent );
			
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			TeacherAddr teacherAddr = new TeacherAddr();
			
			// �Ѱܹ��� ���� VO�� ����
			teacherAddr.setTeacherAddrNo(teacherAddressNo);
			teacherAddr.setTeacherNo(teacherNo);
			teacherAddr.setTeacherAddrContent(teacherAddressContent);
			
			// updateTeacherAddress �޼��带 ȣ���Ͽ� ������Ʈ 
			teacherAddrDao.updateTeacherAddress(teacherAddr);
			
			// ������ �̵�
			response.sendRedirect(request.getContextPath() + "/Teacher/teacherAddrList.jsp?teacherNo=" + teacherNo);
		%>
	</body>
</html>