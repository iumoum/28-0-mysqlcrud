<!-- 2018-07-03 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	employeeAddressDao.deleteEmployeeAddress(Integer.parseInt(request.getParameter("employeeNo")));
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>