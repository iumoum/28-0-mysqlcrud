<!-- 2018-07-12 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeAddressNo = Integer.parseInt(request.getParameter("employeeAddressNo"));
	System.out.println("-----------------------------deleteEmployeeAddressAction.jsp-----------------------------");
	System.out.println("deleteEmployeeAddressForm.jsp에서 deleteEmployeeAddressAction.jsp로 넘겨준 employeeAddressNo : " + employeeAddressNo);

	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	employeeAddressDao.deleteOnlyEmployeeAddress(employeeAddressNo);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeAddressList.jsp");
%>