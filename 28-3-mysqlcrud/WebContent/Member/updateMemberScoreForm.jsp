<!-- 2018-07-13 김지완(정규룡 예비군으로 인한 업무대행) -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Score Form</title>
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// memberScoreList.jsp로 부터 넘겨받은 memberNo 값을 변수에 대입 후 테스트
					int memberNo = Integer.parseInt(request.getParameter("memberNo"));
					System.out.println("memberNo from memberScoreList.jsp : " + memberNo);
					
					// 특정 메서드를 호출하기 위해 memberScoreDao 객체 생성
					MemberScoreDao memberScoreDao = new MemberScoreDao();
					
					// selectMemberAndMemberScore 메서드를 호출하고 memberAndMemberScore 객체의 참조값을 리턴 받아 변수에 대입.
					MemberAndMemberScore memberAndMemberScore = memberScoreDao.selectMemberAndMemberScore(memberNo);
				%>
				<h1>Update MemberScore</h1>
				<form action="<%= request.getContextPath() %>/Member/updateMemberScoreAction.jsp" method="post"> 
					<table border="1">
						<tr>
							<td>교사 번호 : </td>
							<td><input type="text" name="memberNo" value="<%= memberAndMemberScore.getMember().getMemberNo() %>" readonly>
						</tr>
						<tr>
							<td>교사 이름 : </td>
							<td><input type="text" name="memberName" value="<%= memberAndMemberScore.getMember().getMemberName() %>" readonly>
						</tr>
						<tr>
							<td>교사 점수 : </td>
							<td><input type="text" name="memberScore" value="<%= memberAndMemberScore.getMemberScore().getScore() %>">
						</tr>
						<tr>
							<td colspan="2"><button>수정</button></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>