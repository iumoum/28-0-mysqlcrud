<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	String employeeAddressContent = request.getParameter("employeeAddressContent");
	System.out.println("-----------------------------insertEmployeeAddressAction.jsp-----------------------------");
	System.out.println("insertEmployeeAddressForm.jsp���� insertEmployeeAddressAction.jsp�� �Ѱ��� employeeNo : " + employeeNo);
	System.out.println("insertEmployeeAddressForm.jsp���� insertEmployeeAddressAction.jsp�� �Ѱ��� employeeAddressContent : " + employeeAddressContent);
	
	EmployeeAddress employeeAddress = new EmployeeAddress();
	EmployeeAddressDao employeeAddressDao = new EmployeeAddressDao();
	
	employeeAddress.setEmployeeNo(employeeNo);
	employeeAddress.setEmployeeAddressContent(employeeAddressContent);
	
	employeeAddressDao.insertEmployeeAddress(employeeAddress);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeAddressList.jsp?employeeNo=" + employeeNo);
%>