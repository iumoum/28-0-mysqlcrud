<!-- 2018-07-13 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	String employeeAddrContent = request.getParameter("employeeAddrContent");
	System.out.println("-----------------------------insertEmployeeAddrAction.jsp-----------------------------");
	System.out.println("insertEmployeeAddrForm.jsp에서 insertEmployeeAddrAction.jsp로 넘겨준 employeeNo : " + employeeNo);
	System.out.println("insertEmployeeAddrForm.jsp에서 insertEmployeeAddrAction.jsp로 넘겨준 employeeAddrContent : " + employeeAddrContent);
	
	EmployeeAddr employeeAddr = new EmployeeAddr();
	EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
	
	employeeAddr.setEmployeeNo(employeeNo);
	employeeAddr.setEmployeeAddrContent(employeeAddrContent);
	
	employeeAddrDao.insertEmployeeAddr(employeeAddr);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeAddrList.jsp?employeeNo=" + employeeNo);
%>