<!-- 18.06.26 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>mInsertForm Page</title>
</head>
	<body>
		<form action="./memberInsertAction.jsp" method="post">
			<table border="1" width="500px" height="300px">
				<tr>
					<td >member 데이터</td>
				</tr>
				<tr>
					<td>
						<div>member_name : <input type="text" name="memberName"></div> <br>
						<div>member_age : <input type="text" name="memberAge"></div>	<br>
						<div><input type="submit" value="입력하기"></div>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>