<!-- 18.06.26 28�� ���Է� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberDao" %>
<%@ page import="service.Member" %>

<!DOCTYPE html>
<% request.setCharacterEncoding("euc-kr");  %>

<%
	Member Insert = new Member();
	// Meber Ŭ����Ÿ���� Insert������ �����ڸ޼���� ��ü�� ���� �ּҰ��� ����� �� �ּҰ��� �Ҵ��Ѵ�
	String memberName =request.getParameter("memberName");
	// memberName������ mInsertForm.jsp���� �Ѿ�� memberName���� ��´�.
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	// memberAge������ mInsertForm.jsp���� �Ѿ�� memberAge���� int������ �ٲٰ� ��´�.
	
	Insert.setMemberName(memberName);
	Insert.setMemberAge(memberAge);
	// Insert������ ��� �ּҰ��� �ִ� set�޼��带 �Էº����� ��� ���� �̿��Ͽ� �����Ѵ�.
	
	MemberDao dao = new MemberDao();
	// MeberDao Ŭ����Ÿ���� dao������ �����ڸ޼���� ��ü�� ���� �ּҰ��� ����� �� �ּҰ��� �Ҵ��Ѵ�.
	dao.InsertMember(Insert);
	// dao�ּҿ� �ִ� InsertMember�޼��带 Insert�ּҿ� �ִ� memberŬ������ ����Ͽ� �����Ѵ�.
	
	response.sendRedirect(request.getContextPath() + "/Member/mList/memberList.jsp");
	// mList.jsp�� �������� �̵��Ѵ�.
%>