<!-- 2018-06-26 서연문 -->
<!-- java언어, JSP파일 출력시의 문자코드와 헤더에 지정할 문자코드=text/html, 웹에서 제공되는 문서의 문자 인코딩=EUC-KR 파일 작성시의 문자코드또한 EUC-KR -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- 필요한 class페이지를 패키지로부터 import해온다 -->
<%@ page import="service.*" %>
<!-- 받아오는 정보를 EUC-KR타입의 문자형태로 보여준다 -->
<!DOCTYPE html">
<%
	request.setCharacterEncoding("euc-kr");
	// Employee클래스의 데이터타입으로 생성된 변수 employee에 생성자 메서드를 호출하여
	// Employee객체가 생성되어 변수 employee객체참조 값을 대입해준다 
	Employee employee = new Employee();
	EmployeeDao employeeDao = new EmployeeDao();	
	
	// employeeIsertForm.jsp에서 넘겨받은 employeeName과 employeeAge를
	// employee변수에 담긴 객체에 주소값을 따라가 set해준다
	employee.setEmployeeName(request.getParameter("employeeName"));
	employee.setEmployeeAge(Integer.parseInt(request.getParameter("employeeAge")));
	
	//employeeDao변수에 담긴 객체에 주소값을 따라가 insertEmployee메서드를 employee로 실행한다
	employeeDao.insertEmployee(employee);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>