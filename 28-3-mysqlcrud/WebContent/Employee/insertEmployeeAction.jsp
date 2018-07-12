<!-- 2018-07-12 서연문 -->
<!-- java언어, JSP파일 출력시의 문자코드와 헤더에 지정할 문자코드=text/html, 웹에서 제공되는 문서의 문자 인코딩=EUC-KR 파일 작성시의 문자코드또한 EUC-KR -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- 필요한 class페이지를 패키지로부터 import해온다 -->
<%@ page import="service.*" %>
<!-- 받아오는 정보를 EUC-KR타입의 문자형태로 보여준다 -->
<!DOCTYPE html">
<%
	request.setCharacterEncoding("euc-kr");
	
	String employeeName = request.getParameter("employeeName");
	int employeeAge = Integer.parseInt(request.getParameter("employeeAge"));
	System.out.println("-----------------------------insertEmployeeAction.jsp-----------------------------");
	System.out.println("insertEmployeeAction.jsp에서 insertEmployeeAction.jsp로 넘겨준 employeeName : " + employeeName);
	System.out.println("insertEmployeeAction.jsp에서 insertEmployeeAction.jsp로 넘겨준 employeeAge : " + employeeAge);
	
	Employee employee = new Employee();
	EmployeeDao employeeDao = new EmployeeDao();	
	
	employee.setEmployeeName(employeeName);
	employee.setEmployeeAge(employeeAge);
	
	employeeDao.insertEmployee(employee);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>