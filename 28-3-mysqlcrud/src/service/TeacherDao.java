// 2018.06.26
package service;

import service.Teacher;
import java.sql.*;

public class TeacherDao {
	
	/*CREATE TABLE `teacher` (
			`teacher_no` INT(10) NOT NULL,
			`teacher_name` VARCHAR(50) NOT NULL,
			`teacher_age` INT(10) NOT NULL,
			PRIMARY KEY (`teacher_no`)
	  ) <========= */
	
	// teacher 테이블에 한 행을 추가하는 메서드
	// 매개변수로 teacher 테이블에 추가할 한 행의 레코드를 전달
	// 리턴 데이터 타입은 없음 executeUpdate의 결과 값을 insert 메서드에서 출력시켰음.
	public void insertTeacher(Teacher teacher) {
		// 객체참조변수 선언
		Connection conn = null;
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		ResultSet rsSelectForCount = null;
		
		try {
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
			pstmt1 = conn.prepareStatement(sqlSelectForMaxTeacher);
			
			// 위의 쿼리 실행
			rsSelectForCount = pstmt1.executeQuery();
			
			// 데이터를 가져오기 위해 커서를 넘김
			rsSelectForCount.next();
			
			// teacher_no의 최댓값에서 +1을 함으로 자동증가 구현
			// auto_increament가 조금 사용하기 불편해서 이렇게 만들었다.
			if(rsSelectForCount.getInt("max_teacher") == 0) {
				teacher.setTeacherNo(1);
			}
			teacher.setTeacherNo(rsSelectForCount.getInt("max_teacher") + 1);
			
			// teacherNo 안의 값 테스트
			System.out.println("teacherNo from teacherDTO: " + teacher.getTeacherNo());
			
			// teacher 테이블에 레코드를 삽입하는 쿼리 준비
			String sqlInsertTeacher = "INSERT INTO teacher(teacher_no,teacher_name,teacher_age) VALUES(?,?,?)";
			pstmt2 = conn.prepareStatement(sqlInsertTeacher);
			
			// ?에 값 대입
			pstmt2.setInt(1, teacher.getTeacherNo());
			pstmt2.setString(2, teacher.getTeacherName());
			pstmt2.setInt(3, teacher.getTeacherAge());
			
			// 레코드 삽입 쿼리 실행
			// 실행 후 반환 되는 값은 해당 쿼리로 인해 변동되는(?) 행의 갯수 (예를 들어 삽입되는 행의 갯수)
			int resultUpdate = pstmt2.executeUpdate();
			
			// 삽입되는 레코드의 갯수 출력
			System.out.println("teacher 테이블에 삽입된 행 갯수 : " + resultUpdate);
			
		} catch(ClassNotFoundException classException){
			System.out.println("해당 DB Driver 클래스를 찾을 수 없습니다.");
		} catch(SQLException sqlException){
			System.out.println("SQL 오류가 생겼습니다.");
			sqlException.printStackTrace();
		} finally {
			// 객체 종료
			// close 할때 catch문에 SQLException 필요한 이유를 아직 모름
			if(rsSelectForCount != null) try {rsSelectForCount.close();} catch(SQLException sqlException) {}
			if(pstmt1 != null) try {pstmt1.close();} catch(SQLException sqlException) {}
			if(pstmt2 != null) try {pstmt2.close();} catch(SQLException sqlException) {}
			if(conn != null) try {conn.close();} catch(SQLException sqlException) {}
		}
	}
}
