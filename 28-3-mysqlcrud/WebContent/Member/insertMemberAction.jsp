<!-- 18.06.26 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberDao" %>
<%@ page import="service.Member" %>

<!DOCTYPE html>
<% request.setCharacterEncoding("euc-kr");  %>

<%
	Member insertMember = new Member();
	// Meber Ŭ����Ÿ���� insertMember �����ڸ޼���� ��ü�� ���� �ּҰ��� ����� �� �ּҰ��� �Ҵ��Ѵ�
	String memberName =request.getParameter("memberName");
	// memberName������ mInsertForm.jsp���� �Ѿ�� memberName���� ��´�.
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	// memberAge������ mInsertForm.jsp���� �Ѿ�� memberAge���� int������ �ٲٰ� ��´�.
	
	insertMember.setMemberName(memberName);
	insertMember.setMemberAge(memberAge);
	// insertMember������ ��� �ּҰ��� �ִ� set�޼��带 �Էº����� ��� ���� �̿��Ͽ� �����Ѵ�.
	
	MemberDao dao = new MemberDao();
	// MeberDao Ŭ����Ÿ���� dao������ �����ڸ޼���� ��ü�� ���� �ּҰ��� ����� �� �ּҰ��� �Ҵ��Ѵ�.
	dao.InsertMember(insertMember);
	// dao�ּҿ� �ִ� InsertMember�޼��带 Insert�ּҿ� �ִ� memberŬ������ ����Ͽ� �����Ѵ�.
	
	response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
	// memberList.jsp�� �������� �̵��Ѵ�.
%>