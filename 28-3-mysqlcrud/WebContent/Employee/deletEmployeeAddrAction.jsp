<!-- 2018-07-03 ¼­¿¬¹® -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	employeeAddressDao.deleteOnlyEmployeeAddress(Integer.parseInt(request.getParameter("employeeAddressNo")));
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>