<!-- 2018-07-12 ������ -->
<!-- java���, JSP���� ��½��� �����ڵ�� ����� ������ �����ڵ�=text/html, ������ �����Ǵ� ������ ���� ���ڵ�=EUC-KR ���� �ۼ����� �����ڵ���� EUC-KR -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- �ʿ��� class�������� ��Ű���κ��� import�ؿ´� -->
<%@ page import="service.*" %>
<!-- �޾ƿ��� ������ EUC-KRŸ���� �������·� �����ش� -->
<!DOCTYPE html">
<%
	request.setCharacterEncoding("euc-kr");
	
	String employeeName = request.getParameter("employeeName");
	int employeeAge = Integer.parseInt(request.getParameter("employeeAge"));
	System.out.println("-----------------------------insertEmployeeAction.jsp-----------------------------");
	System.out.println("insertEmployeeAction.jsp���� insertEmployeeAction.jsp�� �Ѱ��� employeeName : " + employeeName);
	System.out.println("insertEmployeeAction.jsp���� insertEmployeeAction.jsp�� �Ѱ��� employeeAge : " + employeeAge);
	
	Employee employee = new Employee();
	EmployeeDao employeeDao = new EmployeeDao();	
	
	employee.setEmployeeName(employeeName);
	employee.setEmployeeAge(employeeAge);
	
	employeeDao.insertEmployee(employee);
	
	response.sendRedirect(request.getContextPath() + "/Employee/employeeList.jsp");
%>