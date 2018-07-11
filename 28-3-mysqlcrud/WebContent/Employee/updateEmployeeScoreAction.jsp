<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeScoreNo = Integer.parseInt(request.getParameter("employeeScoreNo"));
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	int score = Integer.parseInt(request.getParameter("Score"));

	EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
	EmployeeScore employeeScore = new EmployeeScore();
	
	employeeScore.setEmployeeNo(employeeNo);
	employeeScore.setScore(score);
	
	employeeScoreDao.updateEmployeeScore(employeeScore);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>