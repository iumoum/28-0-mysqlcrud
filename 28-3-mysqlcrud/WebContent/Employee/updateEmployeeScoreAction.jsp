<!-- 2018-07-12 ������ -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<%
	request.setCharacterEncoding("euc-kr");

	int employeeScoreNo = Integer.parseInt(request.getParameter("employeeScoreNo"));
	int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
	int score = Integer.parseInt(request.getParameter("Score"));
	System.out.println("-----------------------------updateEmployeeScoreAction.jsp-----------------------------");
	System.out.println("updateEmployeeScoreForm.jsp���� updateEmployeeScoreAction.jsp�� �Ѱ��� employeeScoreNo : " + employeeScoreNo);
	System.out.println("updateEmployeeScoreForm.jsp���� updateEmployeeScoreAction.jsp�� �Ѱ��� employeeNo : " + employeeNo);
	System.out.println("updateEmployeeScoreForm.jsp���� updateEmployeeScoreAction.jsp�� �Ѱ��� score : " + score);

	EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
	EmployeeScore employeeScore = new EmployeeScore();
	
	employeeScore.setEmployeeNo(employeeNo);
	employeeScore.setScore(score);
	
	employeeScoreDao.updateEmployeeScore(employeeScore);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeScoreList.jsp?employeeNo=" + employeeNo);
%>