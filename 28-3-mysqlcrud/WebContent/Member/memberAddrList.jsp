<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<title>Member Address List</title>		
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// MemberAddrDao 객체 생성
					MemberAddrDao memberAddrDao = new MemberAddrDao();
					
					// memberList.jsp로 부터 전달 받은 memberNo 값을 변수에 대입
					int memberNo = Integer.parseInt(request.getParameter("memberNo"));
					
					// memberNo 변수 안의 값을 테스트
					System.out.println("memberNo, memberList.jsp => memberAddrList.jsp : " + memberNo);
						
					// selectMemberAddress 메서드를 호출하고 리턴받은 MemberAddr객체의 참조 값을 memberAddr 객체 참조변수에 대입 
					ArrayList<MemberAddr> arrayListMemberAddr = memberAddrDao.selectMemberAddress(memberNo);		
				%>
				<h1>Member Address</h1>
				<br><br><br>
				<table id="entityListTable" >
					<thead>
						<tr>
							<th style="width:70px">주소 번호</th>
							<th>교사 번호</th>
							<th>교사 주소</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
						<%
							System.out.println(arrayListMemberAddr.size() + "<== size");
							for(int i = 0; i < arrayListMemberAddr.size(); i++){
						%>
							<tr>
								<td><%= arrayListMemberAddr.get(i).getMemberAddrNo() %></td>
							<td><%= arrayListMemberAddr.get(i).getMemberNo() %></td>
							<td><%= arrayListMemberAddr.get(i).getMemberAddrContent() %></td>
							<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Member/updateMemberAddrForm.jsp?memberAddressNo=<%= arrayListMemberAddr.get(i).getMemberAddrNo() %>">UPDATE</a></td>
							<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Member/deleteMemberAddrAction.jsp?memberAddressNo=<%= arrayListMemberAddr.get(i).getMemberAddrNo() %>">DELETE</a></td>
						</tr>
					<%
						}
					%>
				</table>
				<br>
				<div id="listButton">
					<a id="buttonToList" href="<%= request.getContextPath() %>/Member/memberList.jsp">목록으로</a>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>