<!-- 18.07.03 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberAddrDao" %>
<%@ page import="service.MemberAddr" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberAddrInsertForm Page</title>
</head>
<body>
	<%
	 	request.setCharacterEncoding("euc-kr");
		
		int memberNo = Integer.parseInt(request.getParameter("sendNo"));
	%>
	<form action="./memberAddrInsertAction.jsp" method="post">
		<table border="1" width=700px" height="300px">
			<tr>
				<td >memberAddr ������</td>
			</tr>
			<tr>
				<td>
					<div>����� ��ȣ: <input type="text" name="memberNo" value="<%=memberNo%>" readonly></div> <br>
					<div>�ּ� : <input type="text" name="memberAddrContent"></div> <br>
					<div><input type="submit" value="�Է��ϱ�"></div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>