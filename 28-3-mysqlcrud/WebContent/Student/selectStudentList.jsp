<!-- 2018-07-02 김정연 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="service.Student"%>
<%@ page import="service.StudentDao"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>나이</td>
			<td>점수 보기</td>
			<td>주소입력</td>
			<td>수정</td>
			<td>삭제</td>
		</tr>

		<%
			int currentPage = 1;
			if (request.getParameter("currentPage") != null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			int rowPerPage = 4;

			int begin = (currentPage - 1) * rowPerPage;

			StudentDao dao = new StudentDao();

			ArrayList<Student> get_list = dao.selectStudent(begin, rowPerPage);
			
			
			for (int i = 0; i < get_list.size(); i++) {
				System.out.println(i);
				Student s1 = get_list.get(i);
				int send_no = s1.getNo();
		%>
				<tr>
					<td><%=send_no %></td>
					<td><a href="<%=request.getContextPath()%>/Student/studentAddrList.jsp?send_no=<%=send_no%>"><%=s1.getName()%></a></td>
					<td><%=s1.getAge()%></td>
					<td><a href="<%=request.getContextPath() %>/Student/studentAndScoreList.jsp?send_no=<%=send_no%>">점수 보기</a></td>
					<td><a href="<%=request.getContextPath()%>/Student/studentAddrInsertForm.jsp?send_no=<%=send_no%>">주소입력</a></td>
					<td><a href="<%=request.getContextPath()%>/Student/updateStudentForm.jsp?send_no=<%=send_no%>">수정</a></td>
					<td><a href="<%=request.getContextPath()%>/Student/deleteStudent.jsp?send_no=<%=send_no%>">삭제</a></td>
				</tr>
		<%
		
			}
			Student stu = new Student();
			
			dao.countNo(stu);
			
			int lastPage = stu.getCountno();
			if(lastPage % 4 == 0){
				lastPage = lastPage/4;
			}else{
				lastPage = lastPage/4+1;
			}
			System.out.println(lastPage);
				
		%>
	</table>
	<%
		if (currentPage > 1) {
	%>
			<a href="./selectStudentList.jsp?currentPage=<%=currentPage - 1%>">이전</a>
	<%
		} else {
	%>
			<span>이전</span>

	<%
		}
	%>
	<%
		if (currentPage != lastPage) {
	%>
			<a href="./selectStudentList.jsp?currentPage=<%=currentPage + 1%>">다음</a>
	<%
		} else {
	%>
			<span>다음</span>

	<%
		}
	%>
	<h3>검색하기</h3> 
	<form action="<%=request.getContextPath()%>/Student/searchStudent.jsp" method="post">
	<select name="sk">
	    <option value="student_no">번호</option>
	    <option value="student_name">이름</option>
	    <option value="student_age">나이</option>
	</select>
	<input type="text" name="sv">
	<input type="submit" value="검색">
</form>
</body>
</html>