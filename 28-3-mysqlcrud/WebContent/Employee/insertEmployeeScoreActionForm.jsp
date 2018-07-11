<!-- 2018-07-03 ¼­¿¬¹® -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	EmployeeScore employeeScore = new EmployeeScore();
	EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
	
	employeeScore.setEmployeeNo(Integer.parseInt(request.getParameter("employeeNo")));
	employeeScore.setScore(Integer.parseInt(request.getParameter("employeeScore")));
	
	employeeScoreDao.insertEmployeeScore(employeeScore);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>