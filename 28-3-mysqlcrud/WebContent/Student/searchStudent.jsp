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
			<td>��ȣ</td>
			<td>�̸�</td>
			<td>����</td>
			<td>�ּ��Է�</td>
			<td>����</td>
			<td>����</td>
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
				<td><a href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=s.getNo()%>">�ּ� �Է�</a></td>
				<td><a href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=s.getNo()%>">����</a></td>
				<td><a href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=s.getNo()%>">����</a></td>
			</tr>
	<%
		}else{
			response.sendRedirect(request.getContextPath()+"/Student/selectStudentList.jsp");
		}
	%>
	</table>
	<a href="<%=request.getContextPath() %>/Student/selectStudentList.jsp">���ư���</a>
	</body>
</html>