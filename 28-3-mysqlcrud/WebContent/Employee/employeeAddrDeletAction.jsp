<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html>
<%
	EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
	
	employeeAddrDao.deleteOnlyEmployeeAddr(Integer.parseInt(request.getParameter("no")));
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>