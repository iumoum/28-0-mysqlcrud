<!-- 18.06.26 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>memberInsertForm Page</title>
</head>
	<body>
		<form action="./memberInsertAction.jsp" method="post">
			<table border="1">
				<tr>
					<td >member ������</td>
				</tr>
				<tr>
					<td>
						<div>�̸� : <input type="text" name="memberName"></div> <br>
						<div>���� : <input type="text" name="memberAge"></div>	<br>
						<div><input type="submit" value="�Է��ϱ�"></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>