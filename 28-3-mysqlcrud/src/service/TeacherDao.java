// 2018.07.02 김지완
package service;

import java.util.ArrayList;
import service.Teacher;
import java.sql.*;

public class TeacherDao {
	
	/*CREATE TABLE `teacher` (
			`teacher_no` INT(10) NOT NULL,
			`teacher_name` VARCHAR(50) NOT NULL,
			`teacher_age` INT(10) NOT NULL,
			PRIMARY KEY (`teacher_no`)
	  )  */
	
	// teacherList의 마지막 페이지를 구하기 위해 레코드의 총 갯수를 조회하는 메서드
	// 매개변수는 없다
	// 리턴되는 데이터는 teacher 테이블에서 조회되는 레코드의 총 갯수이다.
	public int countTeacherTable() {
		Connection conn = null;
		PreparedStatement pstmtCountTeacherTable = null;
		ResultSet rsCountTeacherTable = null;
		int totalTeacher = 0;
		
		// teacher 테이블의 전체 레코드 갯수를 조회하는 쿼리
		String sqlCountTeacherTable = "SELECT COUNT(*) as total_teacher FROM teacher";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtCountTeacherTable = conn.prepareStatement(sqlCountTeacherTable);
			
			// 위의 쿼리 실행
			rsCountTeacherTable = pstmtCountTeacherTable.executeQuery();
			
			// 다음 레코드가 존재한다면
			if(rsCountTeacherTable.next()) {
				totalTeacher = rsCountTeacherTable.getInt("total_teacher");
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsCountTeacherTable != null) {
				try {
					rsCountTeacherTable.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtCountTeacherTable != null) {
				try {
					pstmtCountTeacherTable.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}	
		return totalTeacher;
	}
	
	// teacher 테이블의 레코드를 페이징 조건에 따라 조회하여 ArrayList 데이터 타입으로 리턴하는 메서드
	// 매개변수는 페이징 조건인 startPoint와 rowPerPage를 입력받음 (쿼리문에 대입하기 위하여)
	// 리턴 데이터 타입은 ArrayList<Teacher> (Teacher 클래스 데이터 타입을 저장할 수 있는 클래스 배열)
	public ArrayList<Teacher> selectTeacherByPage(int currentPage, int rowPerPage){
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherByPage = null;
		ResultSet rsSelectTeacherByPage = null;
		ArrayList<Teacher> arrayListTeacher = new ArrayList<Teacher>();
		
		// teacher 테이블의 teacher_no, teacher_name, teacher_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
		String sqlSelectTeacherByPage = "SELECT teacher_no, teacher_name, teacher_age FROM teacher ORDER BY teacher_no LIMIT ?, ?";
		
		int startPoint = (currentPage - 1) * rowPerPage;
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectTeacherByPage = conn.prepareStatement(sqlSelectTeacherByPage);
			
			// ?에 값 대입
			pstmtSelectTeacherByPage.setInt(1, startPoint);
			pstmtSelectTeacherByPage.setInt(2, rowPerPage);
			
			// 위의 쿼리 실행
			rsSelectTeacherByPage = pstmtSelectTeacherByPage.executeQuery();
			
			// 다음 레코드가 존재한다면
			while(rsSelectTeacherByPage.next()) {
				// teacher 객체 생성
				Teacher teacher = new Teacher();
				
				// teacher 객체 내부 멤버변수에 값을 대입
				teacher.setTeacherNo(rsSelectTeacherByPage.getInt("teacher_no"));
				teacher.setTeacherName(rsSelectTeacherByPage.getString("teacher_name"));
				teacher.setTeacherAge(rsSelectTeacherByPage.getInt("teacher_age"));
				
				arrayListTeacher.add(teacher);
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectTeacherByPage != null) {
				try {
					rsSelectTeacherByPage.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectTeacherByPage != null) {
				try {
					pstmtSelectTeacherByPage.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}	
		return arrayListTeacher;
	}
	
	// teacher 테이블에 한 행을 추가하는 메서드
	// 매개변수로 teacher 테이블에 추가할 한 행의 레코드를 전달
	// 리턴 데이터 타입은 void로 정했다. 
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
			
		// 예외가 발생한다면 아래의 catch 블록 내부의 명령 실행.
			
		// ClassNotFoundException 은 Class.forName() 메서드에 매개변수로 대입된 클래스를 찾을 수 없을 때
		} catch(ClassNotFoundException classException){
			System.out.println("해당 DB Driver 클래스를 찾을 수 없습니다.");
		
		// SQLException 은 데이터베이스와 관련된 오류가 있을 때
		} catch(SQLException sqlException){
			System.out.println("SQL 오류가 생겼습니다.");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectForCount != null) {
				try {
					rsSelectForCount.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmt1 != null) {
				try {
					pstmt1.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmt2 != null) {
				try {
					pstmt2.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt2 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}
	}
}
