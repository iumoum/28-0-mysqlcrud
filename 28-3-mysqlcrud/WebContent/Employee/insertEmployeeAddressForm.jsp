<!-- 2018-07-03 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Address Form</title>
	</head>
	<body>
		<!--employeeIsertAction.jsp �� post�������� EmployeeName,EmployeeAge,EmployeeAddressContent ���� �ѱ� -->
		<form action="./insertEmployeeAddressAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Insert Employee Address Form</td>
				</tr>
				<tr>
					<td>���� �ּ� : <input type="text" name="employeeAddressContent">					
					</td>
				</tr>
				<tr>		
					<td colspan="2">
						<input type="hidden" name="employeeNo" value="<%= request.getParameter("no") %>">
						<button>���</button>
					</td>			
				</tr>
			</table>
		</form>	
	</body>
</html>