<!-- 2018-07-12 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeScoreNo = Integer.parseInt(request.getParameter("employeeScoreNo"));
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	int score = Integer.parseInt(request.getParameter("Score"));
	System.out.println("-----------------------------updateEmployeeScoreAction.jsp-----------------------------");
	System.out.println("updateEmployeeScoreForm.jsp에서 updateEmployeeScoreAction.jsp로 넘겨준 employeeScoreNo : " + employeeScoreNo);
	System.out.println("updateEmployeeScoreForm.jsp에서 updateEmployeeScoreAction.jsp로 넘겨준 employeeNo : " + employeeNo);
	System.out.println("updateEmployeeScoreForm.jsp에서 updateEmployeeScoreAction.jsp로 넘겨준 score : " + score);

	EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
	EmployeeScore employeeScore = new EmployeeScore();
	
	employeeScore.setEmployeeNo(employeeNo);
	employeeScore.setScore(score);
	
	employeeScoreDao.updateEmployeeScore(employeeScore);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeScoreList.jsp?employeeNo=" + employeeNo);
%>