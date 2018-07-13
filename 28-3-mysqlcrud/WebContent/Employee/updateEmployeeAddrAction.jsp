<!-- 2018-07-13 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeAddrNo = Integer.parseInt(request.getParameter("employeeAddrNo"));
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	String employeeAddrContent = request.getParameter("employeeAddrContent");
	System.out.println("-----------------------------updateEmployeeAddrAction.jsp-----------------------------");
	System.out.println("updateEmployeeAddrForm.jsp에서 updateEmployeeAddrAction.jsp로 넘겨준 employeeAddrNo : " + employeeAddrNo);
	System.out.println("updateEmployeeAddrForm.jsp에서 updateEmployeeAddrAction.jsp로 넘겨준 employeeNo : " + employeeNo);
	System.out.println("updateEmployeeAddrForm.jsp에서 updateEmployeeAddrAction.jsp로 넘겨준 employeeAddrContent : " + employeeAddrContent);
	
	EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
	EmployeeAddr employeeAddr = new EmployeeAddr();
	
	employeeAddr.setEmployeeAddrNo(employeeAddrNo);
	employeeAddr.setEmployeeAddrContent(employeeAddrContent);
	
	employeeAddrDao.updateEmployeeAddr(employeeAddr);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeAddrList.jsp?employeeNo=" + employeeNo);
%>