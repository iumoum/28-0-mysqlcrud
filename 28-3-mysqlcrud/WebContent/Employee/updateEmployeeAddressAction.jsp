<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeAddressNo = Integer.parseInt(request.getParameter("employeeAddressNo"));
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	String employeeAddressContent = request.getParameter("employeeAddressContent");
	System.out.println("-----------------------------updateEmployeeAddressAction.jsp-----------------------------");
	System.out.println("updateEmployeeAddressForm.jsp���� updateEmployeeAddressAction.jsp�� �Ѱ��� employeeAddressNo : " + employeeAddressNo);
	System.out.println("updateEmployeeAddressForm.jsp���� updateEmployeeAddressAction.jsp�� �Ѱ��� employeeNo : " + employeeNo);
	System.out.println("updateEmployeeAddressForm.jsp���� updateEmployeeAddressAction.jsp�� �Ѱ��� employeeAddressContent : " + employeeAddressContent);
	
	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	EmployeeAddress employeeAddress = new EmployeeAddress();
	
	employeeAddress.setEmployeeAddressNo(employeeAddressNo);
	employeeAddress.setEmployeeAddressContent(employeeAddressContent);
	
	employeeAddressDao.updateEmployeeAddress(employeeAddress);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeAddressList.jsp?employeeNo=" + employeeNo);
%>