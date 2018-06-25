<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Teacher Insert Action</title>
	</head>
	<body>
		<%
			// 한글을 받기 위함
			request.setCharacterEncoding("euc-kr");
		
			// DTO 생성 및 객체참조변수에 참조값 할당
			Teacher teacher = new Teacher();
			TeacherAddr teacherAddr = new TeacherAddr();
			
			// DAO 생성 및 객체참조변수에 참조값 할당
			TeacherDao teacherDao = new TeacherDao();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// teacherInsertForm.jsp 로부터 넘겨받은 값			
			int teacherAge = Integer.parseInt(request.getParameter("teacherAge"));
			String teacherName = request.getParameter("teacherName");
			String teacherAddress = request.getParameter("teacherAddress");
			
			// teacherInsertForm.jsp 로부터 넘겨받은 값 출력 (테스트)
			System.out.println("teacherName from teacherInsertForm.jsp : " + teacherName );
			System.out.println("teacherAge from teacherInsertForm.jsp : " + teacherAge );
			System.out.println("teacherAddress from teacherInsertForm.jsp : " + teacherAddress );
			
			// teacher DTO 내부 멤버변수에 set메서드를 통하여 값을 대입
			// !!!!!! teacherNo은  teacherDAO 내부의 메서드에서 대입(자동증가 옵션을 자바로 구현) !!!!!!
			teacher.setTeacherName(teacherName);
			teacher.setTeacherAge(teacherAge);
			
			// teacher DTO 내부 멤버변수들의 값 출력 (테스트)
			System.out.println("teacherName from teacherDTO : " + teacher.getTeacherName() );
			System.out.println("teacherAge from teacherDTO : " + teacher.getTeacherAge() );
		
			// teacherDAO 내부의 insert 메서드 호출
			// 매개변수로 teacher 객체의 참조 값 전달
			teacherDao.teacherInsert(teacher);
			
			// teacherAddr DTO 내부 멤버변수에 set메서드를 통하여 값 대입
			// !!!!!! teacherAddressNo은  teacherAddrDAO 내부의 메서드에서 대입(자동증가 옵션을 자바로 구현) !!!!!!
			teacherAddr.setTeacherNo(teacher.getTeacherNo());
			teacherAddr.setTeacherAddrContent(teacherAddress);
			
			// teacherAddr DTO 내부 멤버변수들의 값 출력 (테스트)
			System.out.println("TeacherNo from teacherAddrDTO : " + teacherAddr.getTeacherNo() );
			System.out.println("TeacherAddrContent from teacherAddrDTO : " + teacherAddr.getTeacherAddrContent() );
			
			// teacherAddrDAO 내부의 insert 메서드 호출
			// 매개변수로 teacherAddr 객체의 참조값 전달.
			teacherAddrDao.teacherAddressInsert(teacherAddr);
			
			// teacherInsertForm.jsp 화면으로 이동
			response.sendRedirect(request.getContextPath() + "/teacher/teacherInsertForm.jsp");
		%>
	</body>
</html>