<!-- 2018-07-13 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeAddrNo = Integer.parseInt(request.getParameter("employeeAddrNo"));
	System.out.println("-----------------------------deleteEmployeeAddrAction.jsp-----------------------------");
	System.out.println("deleteEmployeeAddrForm.jsp���� deleteEmployeeAddrAction.jsp�� �Ѱ��� employeeAddrNo : " + employeeAddrNo);

	EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
	employeeAddrDao.deleteOnlyEmployeeAddr(employeeAddrNo);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>