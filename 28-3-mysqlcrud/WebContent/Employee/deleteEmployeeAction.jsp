<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	System.out.println("-----------------------------deleteEmployeeAction.jsp-----------------------------");
	System.out.println("deleteEmployeeForm.jsp���� deleteEmployeeAction.jsp�� �Ѱ��� employeeNo : " + employeeNo);

	EmployeeDao employeeDao = new EmployeeDao();
	employeeDao.deleteEmployee(employeeNo);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>