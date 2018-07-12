<!-- 2018-07-02 김정연 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/style/indexCss.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/style/entityList.css">
</head>
<body>
	<%@ include file="/module/header.jsp"%>
	<div id="container">
		<%@ include file="/module/nav.jsp"%>
		<div id="article">
			<h1>Student</h1>
			<br>
			<br>
			<br>
			<div id="buttonForSearch">
				<form action="<%=request.getContextPath()%>/Student/studentList.jsp"
					method="post">
					<select name="sk">
						<option value="student_no">번호</option>
						<option value="student_name">이름</option>
						<option value="student_age">나이</option>
					</select> <input type="text" name="sv"> <input type="submit"
						value="검색">
				</form>
			</div>
			<%
			request.setCharacterEncoding("euc-kr");
			String sk = request.getParameter("sk");
			String sv = request.getParameter("sv");
			//검색 폼에 입력받은 값을 바로 받는다.
			if(sv != null && sv !=""){
			//만약 여기서 텍스트 박스에 담겨있는 값이 null과 공백이 아니면. 즉, 텍스트 박스 안에 문자를 입력하고 submit 버튼을 눌렀을 때.
		%>
			<br>
			<br>
			<table id="entityListTable">
				<thead>
					<tr>
						<th style="width: 70px">학생 번호</th>
						<th>학생 이름</th>
						<th>학생 나이</th>
						<th>주소입력</th>
						<th>점수 입력</th>
						<th>점수 보기</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<%
							int currentPage = 1;
							if (request.getParameter("currentPage") != null) {
								currentPage = Integer.parseInt(request.getParameter("currentPage"));
							}
							int rowPerPage = 4;
		
							int begin = (currentPage - 1) * rowPerPage;
		
							StudentDao dao = new StudentDao();
		
							ArrayList<Student> get_list = dao.selectStudent(begin, rowPerPage, sk, sv);
							//매개변수 4개를 이용해 호출.
							for (int i = 0; i < get_list.size(); i++) {
								System.out.println(i);
								Student s1 = get_list.get(i);
								int send_no = s1.getNo();
						%>
				<tbody>
					<tr>
						<td><%=send_no%></td>
						<td><a class="buttonToShowAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrList.jsp?send_no=<%=send_no%>"><%=s1.getName()%></a></td>
						<td><%=s1.getAge()%></td>
						<td><a class="buttonToInsertAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=send_no%>">+address</a></td>
						<%
									StudentScoreDao sDao = new StudentScoreDao();
									
									String scoreCheck = sDao.studentScoreCheck(send_no);
									
									if(scoreCheck.equals("점수 있다")){
								%>
						<td>-</td>
						<%
									}else{
								%>
						<td><a class="buttonToInsertScore"
							href="<%=request.getContextPath()%>/Student/insertStudentScoreForm.jsp?send_no=<%=send_no%>">점수
								입력!</a></td>
						<%
									}
								%>
						<td><a class="buttonToUpdateEntity"
							href="<%=request.getContextPath()%>/Student/studentAndScoreList.jsp?send_no=<%=send_no%>">점수보기</a></td>
						<td><a class="buttonToShowScore"
							href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=send_no%>">수정</a></td>
						<td><a class="buttonToDeleteEntity"
							href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=send_no%>">삭제</a></td>
					</tr>
				</tbody>
				<%
							}
							Student stu = new Student();
		
							dao.countNo(stu);
		
							int lastPage = stu.getCountno();
							//우선 레코드의 총갯수를 구한 메소드를 호출함과 동시에 int 데이터 타입인 lastPage로 담는다
							if (lastPage % 4 == 0) {
							//만약 라스트 페이지를 4로 나눴을때 나머지가 0이면.
								lastPage = lastPage / 4;
								//라스트 페이지는 라스트페이지 나누기 4.
							} else {
							//만약 그게 아니면.
								lastPage = lastPage / 4 + 1;
								//라스트 페이지는 라스트 페이지 나누기 4 더하기 1. 즉 소수점이 붙어있는 정수들이 여기로 넘어온다.
							}
							System.out.println(lastPage);
						%>
			</table>
			<br>
			<div id="addEntity">
				<a id="buttonToAddEntity"
					href="<%=request.getContextPath()%>/Student/insertStudentForm.jsp">+
					STUDENT</a>&nbsp;<a id="buttonToAddEntity"
					href="<%=request.getContextPath() %>/Student/studentAboveAvgList.jsp">+SCORELIST</a>
			</div>
			<br> <br>
			<div id="buttonForAnotherPage">
				<%
							if (currentPage > 1) {
						%>
				<a id="buttonToPrevPage"
					href="./studentList.jsp?currentPage=<%=currentPage - 1%>">&lt;
					이전</a>
				<%
							} else {
						%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7">&lt;
					이전</span>

				<%
							}
						%>
				<%
							if (currentPage != lastPage) {
						%>
				<a id="buttonToNextPage"
					href="./studentList.jsp?currentPage=<%=currentPage + 1%>">다음
					&gt;</a>
				<%
							} else {
						%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7;">다음
					&gt;</span>
				<%
							}
						%>
			</div>
			<%
			}else if(sv == null || sv == ""){
			//만약 sv가  null일때 거나, sv가 공백일때. 즉, submit 버튼이 클릭되지 않았을때나 텍스트 박스안에 값이 아무것도 들어오지 않은 공백상태일때.
			%>
			<br>
			<br>
			<table id="entityListTable">
				<thead>
					<tr>
						<th style="width: 70px">학생 번호</th>
						<th>학생 이름</th>
						<th>학생 나이</th>
						<th>주소입력</th>
						<th>점수 입력</th>
						<th>점수 보기</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<%
						int currentPage = 1;
						if (request.getParameter("currentPage") != null) {
							currentPage = Integer.parseInt(request.getParameter("currentPage"));
						}
						int rowPerPage = 4;
	
						int begin = (currentPage - 1) * rowPerPage;
	
						StudentDao dao = new StudentDao();
						
						ArrayList<Student> get_list = dao.selectStudentMore(begin, rowPerPage);
	
						for (int i = 0; i < get_list.size(); i++) {
							System.out.println(i);
							Student s1 = get_list.get(i);
							int send_no = s1.getNo();
					%>
				<tbody>
					<tr>
						<td><%=send_no%></td>
						<td><a class="buttonToShowAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrList.jsp?send_no=<%=send_no%>"><%=s1.getName()%></a></td>
						<td><%=s1.getAge()%></td>
						<td><a class="buttonToInsertAddress"
							href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=send_no%>">+address</a></td>
						<%
								StudentScoreDao sDao = new StudentScoreDao();
								
								String scoreCheck = sDao.studentScoreCheck(send_no);
								
								if(scoreCheck.equals("점수 있다")){
							%>
						<td>-</td>
						<%
								}else{
							%>
						<td><a class="buttonToInsertScore"
							href="<%=request.getContextPath()%>/Student/insertStudentScoreForm.jsp?send_no=<%=send_no%>">점수
								입력!</a></td>
						<%
								}
							%>
						<td><a class="buttonToUpdateEntity"
							href="<%=request.getContextPath()%>/Student/studentAndScoreList.jsp?send_no=<%=send_no%>">점수보기</a></td>
						<td><a class="buttonToShowScore"
							href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=send_no%>">수정</a></td>
						<td><a class="buttonToDeleteEntity"
							href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=send_no%>">삭제</a></td>
					</tr>
				</tbody>
				<%
						}
						Student stu = new Student();
	
						dao.countNo(stu);
	
						int lastPage = stu.getCountno();
						if (lastPage % 4 == 0) {
							lastPage = lastPage / 4;
						} else {
							lastPage = lastPage / 4 + 1;
						}
						System.out.println(lastPage);
					%>
			</table>
			<br>
			<div id="addEntity">
				<a id="buttonToAddEntity"
					href="<%=request.getContextPath()%>/Student/insertStudentForm.jsp">+
					STUDENT</a>&nbsp;<a id="buttonToAddEntity"
					href="<%=request.getContextPath() %>/Student/studentAboveAvgList.jsp">+SCORELIST</a>
			</div>
			<br> <br>
			<div id="buttonForAnotherPage">
				<%
						if (currentPage > 1) {
					%>
				<a id="buttonToPrevPage"
					href="./studentList.jsp?currentPage=<%=currentPage - 1%>">&lt;
					이전</a>
				<%
						} else {
					%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7">&lt;
					이전</span>

				<%
						}
					%>
				<%
						if (currentPage != lastPage) {
					%>
				<a id="buttonToNextPage"
					href="./studentList.jsp?currentPage=<%=currentPage + 1%>">다음
					&gt;</a>
				<%
						} else {
					%>
				<span
					style="text-decoration: none; border: 1px solid gray; font-size: 13px; border-radius: 3px; padding: 4px 6px 4px 6px; font-weight: bold; color: #d7d7d7;">다음
					&gt;</span>
				<%
						}
					%>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%@ include file="/module/footer.jsp"%>
</body>
</html>