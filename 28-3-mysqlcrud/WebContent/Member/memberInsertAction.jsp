<!-- 18.06.26 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberDao" %>
<%@ page import="service.Member" %>

<!DOCTYPE html>
<% request.setCharacterEncoding("euc-kr");  %>

<%
	Member insertMember = new Member();
	// Meber 클래스타입인 insertMember 생성자메서드로 객체를 만들어서 주소값을 만들고 그 주소값을 할당한다
	String memberName =request.getParameter("memberName");
	// memberName변수에 mInsertForm.jsp에서 넘어온 memberName값을 담는다.
	int memberAge = Integer.parseInt(request.getParameter("memberAge"));
	// memberAge변수에 mInsertForm.jsp에서 넘어온 memberAge값을 int형으로 바꾸고 담는다.
	
	insertMember.setMemberName(memberName);
	insertMember.setMemberAge(memberAge);
	// insertMember변수에 담긴 주소값에 있는 set메서드를 입력변수에 담긴 값을 이용하여 실행한다.
	
	MemberDao dao = new MemberDao();
	// MeberDao 클레스타입인 dao변수에 생성자메서드로 객체를 만들어서 주소값을 만들고 그 주소값을 할당한다.
	dao.InsertMember(insertMember);
	// dao주소에 있는 InsertMember메서드를 Insert주소에 있는 member클래스를 사용하여 실행한다.
	
	response.sendRedirect(request.getContextPath() + "/Member/memberList.jsp");
	// memberList.jsp로 페이지를 이동한다.
%>