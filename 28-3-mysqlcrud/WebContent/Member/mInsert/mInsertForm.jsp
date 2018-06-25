<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>mInsertForm Page</title>
</head>
	<body>
		<form action="./mInsertAction.jsp" method="post">
			<table border="1" width="1300px" height="700px">
				<tr>
					<td colspan="3">28기 3조 팀프로젝트</td>
				</tr>
				<tr>
					<td colspan="3">member</td>
				</tr>
				<tr>
					<td rowspan="3">데이터</td> <td>member_no : <input type="text" name="member_no"></td>
					<td rowspan="3"><input type="submit" value="입력완료"></td>
				</tr>
				<tr>
					<td>member_name : <input type="text" name="member_name"></td>
				</tr>
				<tr>
					<td>member_age : <input type="text" name="member_age"></td>
				</tr>
			</table>
		</form>
	</body>
</html>