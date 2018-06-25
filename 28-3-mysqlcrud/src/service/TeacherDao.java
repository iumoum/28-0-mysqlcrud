package service;

import service.Teacher;
import java.sql.*;


public class TeacherDao {
	// 객체참조변수 선언
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rsSelectForCount = null;
	
	public void teacherInsert(Teacher teacher) throws ClassNotFoundException, SQLException {
		// mysql 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		
		// DB 연결 
		// 이부분을 클래스를 통해 객체로 만들어서 구현 할 수도 있지 않을까 ?
		String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPw = "java0000";
		conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
		// teacher_no를 자동증가시키기 위해 사용하려는 쿼리
		// teacher_no의 최댓값을 조회
		String sqlSelectForMaxTeacher = "SELECT MAX(teacher_no) as max_teacher FROM teacher";
		pstmt = conn.prepareStatement(sqlSelectForMaxTeacher);
		
		// 위의 쿼리 실행
		rsSelectForCount = pstmt.executeQuery();
		
		// 데이터를 가져오기 위해 커서를 넘김
		rsSelectForCount.next();
		
		// teacher_no의 최댓값에서 +1을 함으로 자동증가 구현
		// auto_increament가 조금 사용하기 불편해서 이렇게 만들었다.
		teacher.setTeacherNo(rsSelectForCount.getInt("max_teacher") + 1);
		
		// teacherNo 안의 값 테스트
		System.out.println("teacherNo from teacherDTO: " + teacher.getTeacherNo());
		
		// teacher 테이블에 레코드를 삽입하는 쿼리 준비
		String sqlInsertTeacher = "INSERT INTO teacher(teacher_no,teacher_name,teacher_age) VALUES(?,?,?)";
		pstmt = conn.prepareStatement(sqlInsertTeacher);
		
		// ?에 값 대입
		pstmt.setInt(1, teacher.getTeacherNo());
		pstmt.setString(2, teacher.getTeacherName());
		pstmt.setInt(3, teacher.getTeacherAge());
		
		// 레코드 삽입 쿼리 실행
		// 실행 후 반환 되는 값은 해당 쿼리로 인해 변동되는(?) 행의 갯수 (예를 들어 삽입되는 행의 갯수)
		int resultUpdate = pstmt.executeUpdate();
		
		// 삽입되는 레코드의 갯수 출력
		System.out.println("teacher 테이블에 삽입된 행 갯수 : " + resultUpdate);
	}
}
