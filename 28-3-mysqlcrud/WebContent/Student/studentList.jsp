<!-- 2018.07.10 김지완 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/indexCss.css">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/style/entityList.css">
		<title>Student List</title>
	</head>
	<body>
		<%@ include file="/module/header.jsp" %>
		<div id="container">
			<%@ include file="/module/nav.jsp" %>
			<div id="article">
				<%
					// 한글을 입력받기 위함
					request.setCharacterEncoding("euc-kr");
					
					// 검색어를 전달받는 과정
					String searchValue = "";
					if(request.getParameter("searchValue") != null){
						searchValue = request.getParameter("searchValue");
					}
					
					System.out.println(searchValue);
					
					// 페이징 알고리즘
					int rowPerPage = 5;
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
					
					// StudentDao 객체 생성
					StudentDao studentDao = new StudentDao();
					
					// studentAddrDao 객체 생성
					StudentAddrDao studentAddrDao = new StudentAddrDao();
					
					
					// studentScoreDao 객체 생성
					StudentScoreDao studentScoreDao = new StudentScoreDao();
					
					
					
					// selectStudentByPage 메서드를 통해 리턴되는 참조 값(arrayListStudent객체의 참조값)을 대입
					ArrayList<Student> arrayListStudent = studentDao.selectStudentByPage(currentPage, rowPerPage, searchValue);
					
					// 마지막 페이지
					int lastPage = studentDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
					if ((studentDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>Student List</h1><br>
				<div id="buttonForSearch">
					<form action="<%= request.getContextPath() %>/Student/studentList.jsp" method="post">
						<label>이름 :  
							<input type="text" name="searchValue">
						</label>
						<button>검색</button>
					</form>
				</div>
				<br><br>
				<table id="entityListTable">
					<thead>
						<tr>
							<th style="width:70px">교사 번호</th>
							<th>교사 이름</th>
							<th>교사 나이</th>
							<th>주소 입력</th>							
							<th>점수 입력</th>
							<th>점수 보기</th>
							<th>수 정</th>
							<th>삭 제</th>
						</tr>
					</thead>
					<% 
						// size() 메서드는 마지막 인덱스 까지의 요소 갯수를 리턴해준다.
						// ex) arrayListStudent[17] 까지 데이터를 저장 했을 경우 18을 리턴
						for(int i = 0; i < arrayListStudent.size(); i++){
							// get메서드를 통해 각각의 요소에 저장된 Student 객체를 불러온다.
							Student student = arrayListStudent.get(i);
							
							// selectStudentAddress 메서드를 호출하고 리턴받은 StudentAddr객체의 참조 값을 studentAddr 객체 참조변수에 대입 
							ArrayList<StudentAddr> arrayListStudentAddr = studentAddrDao.selectStudentAddress(student.getStudentNo());
					%>
							<tr>
								<td><%= student.getStudentNo() %></td>
								<%
									// 해당 교사의 주소 정보가 존재한다면
									if(arrayListStudentAddr.size() != 0){
								%>
										<td><a title="주소 보기" class="buttonToShowAddress" href="<%= request.getContextPath() %>/Student/studentAddrList.jsp?studentNo=<%= student.getStudentNo() %>"><%= student.getStudentName() %></a></td>
								<%	
									// 그 외
									} else {
								%>
										<td><%= student.getStudentName() %></td>
								<%
									}
								%>
								<td><%= student.getStudentAge() %></td>
								<td><a title="주소 추가" class="buttonToInsertAddress" href="<%= request.getContextPath() %>/Student/insertStudentAddrForm.jsp?studentNo=<%= student.getStudentNo() %>">+ ADDRESS</a></td>
								<%
									// 해당하는 교사의 점수가 존재하지 않는다면 점수 입력 버튼을 보여줌
									StudentAndStudentScore studentAndStudentScore = studentScoreDao.selectStudentAndStudentScore(student.getStudentNo());
									if(studentAndStudentScore == null){
								%>
										<td><a title="점수 입력" class="buttonToInsertScore" href="<%= request.getContextPath() %>/Student/insertStudentScoreForm.jsp?studentNo=<%= student.getStudentNo() %>">+ SCORE</a></td>
										<td></td>
								<%
									// 점수가 존재한다면 안보여줌 (1:1 관계를 유지하기 위함)
									} else {
								%>
										<td></td>
										<td><a title="점수 확인" class="buttonToShowScore" href="<%= request.getContextPath() %>/Student/studentScoreList.jsp?studentNo=<%= student.getStudentNo() %>">VIEW SCORE</a></td>
								<%
									}
								%>
								<td><a title="교사 정보 수정" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/Student/updateStudentForm.jsp?studentNo=<%= student.getStudentNo() %>">UPDATE</a></td>
								<td><a title="교사 정보 삭제" class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/Student/deleteStudentAction.jsp?studentNo=<%= student.getStudentNo() %>">DELETE</a></td>
							</tr>
					<% 
						}
					%>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>/Student/insertStudentForm.jsp">+ STUDENT</a>
				</div>
				<br><br>
				<div id="page">
					<span><%= currentPage %> / <%= lastPage %></span>
				</div>
				<br>
				<div id="buttonForAnotherPage">
					<%
						if(currentPage > 1){
					%>
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>/Student/studentList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; 이전</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7">&lt; 이전</span>
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>/Student/studentList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">다음 &gt;</a>
					<%
						} else {
					%>
							<span style="text-decoration: none;border: 1px solid gray;font-size: 13px;border-radius: 3px;padding: 4px 6px 4px 6px;font-weight: bold;color:#d7d7d7;">다음 &gt;</span>
					<%
						}
					%>
				</div>
			</div>
		</div>
		<%@ include file="/module/footer.jsp" %>
	</body>
</html>