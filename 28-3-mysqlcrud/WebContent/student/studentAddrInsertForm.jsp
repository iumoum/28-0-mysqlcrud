<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentForm</title>
	</head>
	<body>
		<form action="./studentAddrInsertAction.jsp" method="post">
			<h3>Student</h3>
			<table border="1">
				<tr>
					<td>주소  : </td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"><input type="hidden" name="studentNo" value= "<%=request.getParameter("send_no")%>"></td>
				</tr>
			
				
				
			</table>
		</form>
	</body>	
</html>