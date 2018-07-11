<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Employee Score Form</title>
	</head>
	<body>
		<form action="./insertEmployeeScoreActionForm.jsp" method="post">
			<table border="1">
				<tr>
					<td colspan="2">Insert Employee Score Form</td>
				</tr>
				<tr>
					<td>직원 점수 : <input type="text" name="employeeScore">					
					</td>
				</tr>
				<tr>		
					<td colspan="2">
						<input type="hidden" name="employeeNo" value="<%= request.getParameter("employeeNo") %>">
						<button>등록</button>
					</td>			
				</tr>
			</table>
		</form>	
	</body>
</html>