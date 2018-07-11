<!-- 2018-07-03 ¼­¿¬¹® -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	EmployeeAddress employeeAddress = new EmployeeAddress();
	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	
	employeeAddress.setEmployeeNo(Integer.parseInt(request.getParameter("employeeNo")));
	employeeAddress.setEmployeeAddressContent(request.getParameter("employeeAddressContent"));
	
	employeeAddressDao.insertEmployeeAddress(employeeAddress);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>