<!-- 2018-06-26 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Eployee Form</title>
	</head>
	<body>
		<!--employeeIsertAction.jsp �� post�������� EmployeeName,EmployeeAge,EmployeeAddressContent ���� �ѱ� -->
		<form action="./insertEmployeeAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Eployee</td>
				</tr>
				<tr>
					<td>���� �̸� : <input type="text" name="employeeName"></td>
				</tr>
				<tr>
					<td>���� ���� : <input type="text" name="employeeAge"></td>
				</tr>
				<tr>
					<td colspan="2"><button>���</button></td>
				</tr>
			</table>
		</form>	
	</body>
</html>