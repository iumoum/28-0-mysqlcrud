<<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Score List</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// MemberScoreDao 객체 생성
					MemberScoreDao memberScoreDao = new MemberScoreDao();
				
					// memberList.jsp로 부터 전달 받은 memberNo 값을 변수에 대입
					int memberNo = Integer.parseInt(request.getParameter("memberNo"));
					
					// memberNo 변수 안의 값을 테스트
					System.out.println("memberNo, memberList.jsp => memberAddrList.jsp : " + memberNo);
					
					// selectMemberAddress 메서드를 호출하고 리턴받은 MemberAddr객체의 참조 값을 memberAddr 객체 참조변수에 대입 
					MemberAndMemberScore memberAndMemberScore = memberScoreDao.selectMemberAndMemberScore(memberNo);		
				%>
				<h1>Member Score List</h1>
				<br><br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">교사 번호</th>
							<th style="width:120px">교사 이름</th>
							<th style="width:120px">점수</th>
							<th>수정</th>
						</tr>
					</thead>
					<tr>
						<td><%= memberAndMemberScore.getMember().getMemberNo() %></td>
						<td><%= memberAndMemberScore.getMember().getMemberName() %></td>
						<td><%= memberAndMemberScore.getMemberScore().getScore() %></td>
						<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Member/updateMemberScoreForm.jsp?memberNo=<%= memberAndMemberScore.getMember().getMemberNo() %>">UPDATE</a>
					</tr>
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