<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeAddressNo = Integer.parseInt(request.getParameter("employeeAddressNo"));
	int employeeNo = Integer.parseInt("employeeNo");
	String employeeAddressContent = request.getParameter("employeeAddressContent");

	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	EmployeeAddress employeeAddress = new EmployeeAddress();
	
	employeeAddress.setEmployeeAddressNo(employeeAddressNo);
	employeeAddress.setEmployeeAddressContent(employeeAddressContent);
	
	employeeAddressDao.updateEmployeeAddress(employeeAddress);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>