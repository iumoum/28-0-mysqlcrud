<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="nav">			
	<ul id="titleNav">
		<li id="home" style="margin-bottom:50px"><a href="<%= request.getContextPath()%>/index.jsp">HOME<br></a></li>
		<li>
			EMPLOYEE
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Employee/employeeList.jsp">EmployeeList</a></li>
				<li><a href="<%= request.getContextPath()%>/Employee/employeeListAboveAvg.jsp">EmployeeAboveAvgList</a></li>
			</ul>
		</li>
		<li>
			STUDENT
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Student/selectStudentList.jsp">StudentList</a></li>
				<li><a href="<%=request.getContextPath() %>/Student/studentAboveAvgList.jsp">StudentAboveAvgList</a></li>
			</ul>
		</li>
		<li>
			MEMBER
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Member/memberList.jsp">MemberList</a></li>
				<li>MemberAboveAvgList</li>
			</ul>
		</li>
		<li>
			TEACHER
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Teacher/teacherList.jsp">TeacherList</a></li>
				<li>TeacherAboveAvgList</li>
			</ul>
		</li>
	</ul>
</div>