<!-- 2018-06-26 ������ -->
<!-- java���, JSP���� ��½��� �����ڵ�� ����� ������ �����ڵ�=text/html, ������ �����Ǵ� ������ ���� ���ڵ�=EUC-KR ���� �ۼ����� �����ڵ���� EUC-KR -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!-- �ʿ��� class�������� ��Ű���κ��� import�ؿ´� -->
<%@ page import="service.Employee" %>
<%@ page import="service.EmployeeDao" %>
<%@ page import="service.EmployeeAddr" %>
<%@ page import="service.EmployeeAddrDao" %>
<!-- �޾ƿ��� ������ EUC-KRŸ���� �������·� �����ش� -->
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html">
<%
	// EmployeeŬ������ ������Ÿ������ ������ ���� employee�� ������ �޼��带 ȣ���Ͽ�
	// Employee��ü�� �����Ǿ� ���� employee��ü���� ���� �������ش� 
	Employee employee = new Employee();
	EmployeeDao employeeDao = new EmployeeDao();	
	
	// employeeIsertForm.jsp���� �Ѱܹ��� employeeName�� employeeAge��
	// employee������ ��� ��ü�� �ּҰ��� ���� set���ش�
	employee.setEmployeeName(request.getParameter("employeeName"));
	employee.setEmployeeAge(Integer.parseInt(request.getParameter("employeeAge")));
	
	//employeeDao������ ��� ��ü�� �ּҰ��� ���� insertEmployee�޼��带 employee�� �����Ѵ�
	employeeDao.insertEmployee(employee);
%>