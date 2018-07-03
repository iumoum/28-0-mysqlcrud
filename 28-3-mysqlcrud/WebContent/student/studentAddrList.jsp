<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="service.StudentAddrDao"%>
<%@ page import="service.StudentAddr"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<table>
	<tr><td>주소</td></tr>
	<%
	request.setCharacterEncoding("euc-kr");
	int send_no = Integer.parseInt(request.getParameter("send_no"));
	
	StudentDao dao = new StudentDao();
	
	String addr = dao.studentNo(send_no);
	System.out.println(addr);
	
	
	%>
	<tr>
		<td><%=addr %></td>
	</tr>
	<tr></tr>
	</table>
	</body>
</html>