<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html">
<%
	request.setCharacterEncoding("euc-kr");

	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	String employeeName = request.getParameter("employeeName");
	int employeeAge = Integer.parseInt(request.getParameter("employeeAge"));

	EmployeeDao employeeDao = new EmployeeDao();
	Employee employee = new Employee();
	
	employee.setEmployeeNo(employeeNo);
	employee.setEmployeeName(employeeName);
	employee.setEmployeeAge(employeeAge);
	
	employeeDao.updateEmployee(employee);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>