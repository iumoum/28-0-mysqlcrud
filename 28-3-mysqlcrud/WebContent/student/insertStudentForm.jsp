<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentForm</title>
	</head>
	<body>
		<form action="./insertStudentAction.jsp" method="post">
			<h3>Student</h3>
			<table border="1">
				<tr>
					<td>이름  :</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>나이 :</td>
					<td><input type="text" name="age"></td>
				</tr>
				<tr>
					<td>주소 :</td>
					<td><input type="text" name="addr"></td>
				</tr>
				<tr>
					<td><input type="submit" value="확인"></td>
				</tr>
			</table>
		</form>
	</body>	
</html>