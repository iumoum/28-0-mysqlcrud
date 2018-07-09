<!-- 18.07.02 28기 정규룡 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.MemberDao" %>
<%@ page import="service.Member" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>memberList Page</title>
</head>
<body>
	<table border="1">
		<tr>
			<td colspan="6">member 데이터</td>
		</tr>
			<%
				int currentPage = 1;    // 페이지 번호
				int pagePerRow = 3;	// 한페이지에 보여줄 행의 개수
				int totalRow = 0; // 전체 행의 개수
				
				if(request.getParameter("currentPage") != null ){
					currentPage = Integer.parseInt(request.getParameter("currentPage"));
				} // currentPage가 null일땐 위에 정해준 1, null이 아닐땐 get방식으로 받아온 값으로 지정
				
				int startPage = (currentPage-1) * pagePerRow; // 시작행 번호
				
				MemberDao memberDao = new MemberDao();
				ArrayList<Member> list = memberDao.selectMemberAll(startPage, pagePerRow);
				
				for (int i=0;i<list.size();i++) {
					Member m = list.get(i);
			%>	
					<tr>
						<td><%= m.getMemberNo() %></td>
						<td><%= m.getMemberName() %></td>
						<td><%= m.getMemberAge() %></td>
						<td>
							<a href="<%= request.getContextPath() %>/Member/memberAddrInsertForm.jsp?sendNo=<%= m.getMemberNo() %>">주소입력</a>
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/Member/memberUpdateForm.jsp?sendNo=<%= m.getMemberNo() %>">수정</a>			
						</td>
						<td>
							<a href="<%= request.getContextPath() %>/Member/memberDeleteAction.jsp?sendNo=<%= m.getMemberNo() %>">삭제</a>			
						</td>
					</tr>
			<%
				}
			%>
	</table>
			
			<form>
				<div>
					이름 :
					<input type="text" name="searchWord">
					<button type="submit">검색</button><br>
				</div>
			</form>
			
			<%	
				totalRow = memberDao.totalRow();					
				int lastPage = (totalRow / pagePerRow); // 마지막페이지 수
				
				if (totalRow % pagePerRow != 0) {
					lastPage++;
				}
				
				if (currentPage > 1) { // currentPage가 1보다 크면 이전페이지로 가는 글자 생성
			%>
				<a href="./memberList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
			<%
				}
				if (currentPage < lastPage) { // 마지막페이지보다 현재페이지수가 작을때 다음페이지로 가는 글자 생성
			%>	
				<a href="./memberList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
			<% 
				}
			%>
</body>

</html>