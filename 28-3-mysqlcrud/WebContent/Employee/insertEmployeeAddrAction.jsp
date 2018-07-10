<!-- 2018-07-03 ¼­¿¬¹® -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	EmployeeAddr employeeAddr = new EmployeeAddr();
	EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
	
	employeeAddr.setEmployeeNo(Integer.parseInt(request.getParameter("employeeNo")));
	employeeAddr.setEmployeeContent(request.getParameter("employeeAddrContent"));
	
	employeeAddrDao.insertEmployeeAddr(employeeAddr);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>