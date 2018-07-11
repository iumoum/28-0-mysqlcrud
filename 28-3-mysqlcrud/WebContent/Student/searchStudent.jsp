<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>주소입력</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>
	<%
		request.setCharacterEncoding("euc-kr");
		String sk = request.getParameter("sk");
		String sv = request.getParameter("sv");
		Student s = null;
		StudentDao dao = new StudentDao();
		
		s = dao.studentSearch(sk, sv);
		
		if(s.getText()==null){
	%>
			<tr>
				<td><%=s.getNo() %></td>
				<td><a href="<%=request.getContextPath()%>/Student/studentAddrList.jsp?send_no=<%=s.getNo()%>"><%=s.getName()%></a></td>
				<td><%=s.getAge() %></td>
				<td><a href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=s.getNo()%>">주소 입력</a></td>
				<td><a href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=s.getNo()%>">수정</a></td>
				<td><a href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=s.getNo()%>">삭제</a></td>
			</tr>
	<%
		}else{
			response.sendRedirect(request.getContextPath()+"/Student/selectStudentList.jsp");
		}
	%>
	</table>
	<a href="<%=request.getContextPath() %>/Student/selectStudentList.jsp">돌아가기</a>
	</body>
</html>