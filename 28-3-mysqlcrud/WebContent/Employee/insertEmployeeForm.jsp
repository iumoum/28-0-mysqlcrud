<!-- 2018-06-26 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Eployee Form</title>
	</head>
	<body>
		<!--employeeIsertAction.jsp 에 post형식으로 EmployeeName,EmployeeAge,EmployeeAddressContent 값을 넘김 -->
		<form action="./insertEmployeeAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Eployee</td>
				</tr>
				<tr>
					<td>직원 이름 : <input type="text" name="employeeName"></td>
				</tr>
				<tr>
					<td>직원 나이 : <input type="text" name="employeeAge"></td>
				</tr>
				<tr>
					<td colspan="2"><button>등록</button></td>
				</tr>
			</table>
		</form>	
	</body>
</html>