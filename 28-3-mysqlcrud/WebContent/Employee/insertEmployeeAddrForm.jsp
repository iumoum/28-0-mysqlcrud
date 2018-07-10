<!-- 2018-07-03 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Address Form</title>
	</head>
	<body>
		<!--employeeIsertAction.jsp 에 post형식으로 EmployeeName,EmployeeAge,EmployeeAddressContent 값을 넘김 -->
		<form action="./insertEmployeeAddrAction.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Employee Addr</td>
				</tr>
				<tr>
					<td>직원 주소 : <input type="text" name="employeeAddrContent">					
					</td>
				</tr>
				<tr>		
					<td colspan="2">
						<input type="hidden" name="employeeNo" value="<%= request.getParameter("no") %>">
						<button>등록</button>
					</td>			
				</tr>
			</table>
		</form>	
	</body>
</html>