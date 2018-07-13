<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<div id="nav">			
	<ul id="titleNav">
		<li id="home" style="margin-bottom:50px"><a href="<%= request.getContextPath()%>/index.jsp">HOME<br></a></li>
		<li>
			EMPLOYEE (¼­¿¬¹®)
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Employee/employeeList.jsp">EmployeeList</a></li>
				<li><a href="<%= request.getContextPath()%>/Employee/employeeAboveAvgList.jsp">EmployeeAboveAvgList</a></li>
			</ul>
		</li>
		<li>
			STUDENT (±èÁ¤¿¬)
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Student/studentList.jsp">StudentList</a></li>
				<li><a href="<%= request.getContextPath() %>/Student/studentAboveAvgList.jsp">StudentAboveAvgList</a></li>
			</ul>
		</li>
		<li>
			MEMBER (Á¤±Ô·æ)
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Member/memberList.jsp">MemberList</a></li>
				<li><a href="<%= request.getContextPath() %>/Member/memberAboveAvgList.jsp">MemberAboveAvgList</a></li>
			</ul>
		</li>
		<li>
			TEACHER (±èÁö¿Ï)
			<ul class="subNav">
				<li><a href="<%= request.getContextPath()%>/Teacher/teacherList.jsp">TeacherList</a></li>
				<li><a href="<%= request.getContextPath() %>/Teacher/teacherAboveAvgList.jsp">TeacherAboveAvgList</a></li>
			</ul>
		</li>
	</ul>
</div>