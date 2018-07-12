<!-- 2018-07-12 서연문 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");
	
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	int score = Integer.parseInt(request.getParameter("score"));
	System.out.println("-----------------------------insertEmployeeScoreAction.jsp-----------------------------");
	System.out.println("insertEmployeeScoreForm.jsp에서 insertEmployeeScoreAction.jsp로 넘겨준 employeeNo : " + employeeNo);
	System.out.println("insertEmployeeScoreForm.jsp에서 insertEmployeeScoreAction.jsp로 넘겨준 score : " + score);
	
	EmployeeScore employeeScore = new EmployeeScore();
	EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
	
	employeeScore.setEmployeeNo(employeeNo);
	employeeScore.setScore(score);
	
	employeeScoreDao.insertEmployeeScore(employeeScore);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeScoreList.jsp?employeeNo=" + employeeNo);
%>