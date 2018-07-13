<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Student update form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
	<% 
				request.setCharacterEncoding("euc-kr");
				String sendNo = request.getParameter("send_no");
				
				StudentAddrDao studentAddrDao = new StudentAddrDao();
				
				StudentAddr studentAddr = studentAddrDao.updateStudentAddrSelect(sendNo);
	%>
				<h1>StudentAddr update</h1>
				<br><br><br>
				<table id="entityListTable">
					<form action="<%=request.getContextPath() %>/Student/updateStudentAddrAction.jsp" method="post">
						<thead>
							<tr>
								<th style="width:70px">�ּ� ��ȣ</th>
								<th>�л� ��ȣ</th>
								<th>�л� �ּ�</th>
								<th>����</th>
							</tr>
						</thead>
							<tr>
								<td><input type="text" name="addrNo" value="<%=studentAddr.getStudentAddrNo() %>" readonly></td>
								<td><input type="text" name="studentNo" value="<%=studentAddr.getStudentNo() %>" readonly></td>
								<td><input type="text" name="reAddr" value="<%=studentAddr.getAddr() %>"></td>
								<td><input type="submit" value="���� �Ϸ�"></td>
							</tr>
					</form>
				</table>
				<br><br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Student/studentList.jsp">�������</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>	
</html>