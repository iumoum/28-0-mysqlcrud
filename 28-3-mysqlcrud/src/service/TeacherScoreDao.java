package service;

import java.sql.*;
import service.*;

public class TeacherScoreDao {
	public TeacherAndTeacherScore selectTeacherAndTeacherScore(int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherAndTeacherScore = null;
		ResultSet rsSelectTeacherAndTeacherScore = null;
		TeacherAndTeacherScore teacherAndTeacherScore = null;
		
		// teacherScoreList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherScoreList.jsp => TeacherScoreDao.java " + teacherNo);
		
		// teacher와 teacher_score 테이블에서  WHERE 조건에 해당하는 레코드를 내부 조인하여 조회하는 쿼리 
		String sqlSelectTeacherAndTeacherScore = "SELECT t.teacher_no,t.teacher_name,t.teacher_age,ts.score_no,ts.score FROM teacher t INNER JOIN teacher_score ts on t.teacher_no = ts.teacher_no WHERE t.teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtSelectTeacherAndTeacherScore = conn.prepareStatement(sqlSelectTeacherAndTeacherScore);
			
			// ? 에 값 대입
			pstmtSelectTeacherAndTeacherScore.setInt(1,teacherNo);
			
			// 쿼리 실행
			rsSelectTeacherAndTeacherScore = pstmtSelectTeacherAndTeacherScore.executeQuery();
			
			while(rsSelectTeacherAndTeacherScore.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(rsSelectTeacherAndTeacherScore.getInt("teacher_no"));
				teacher.setTeacherName(rsSelectTeacherAndTeacherScore.getString("teacher_name"));
				teacher.setTeacherAge(rsSelectTeacherAndTeacherScore.getInt("teacher_age"));
				
				TeacherScore teacherScore = new TeacherScore();
				
				teacherScore.setScoreNo(rsSelectTeacherAndTeacherScore.getInt("score_no"));
				teacherScore.setScore(rsSelectTeacherAndTeacherScore.getInt("score"));
				
				teacherAndTeacherScore = new TeacherAndTeacherScore();
				
				teacherAndTeacherScore.setTeahcer(teacher);
				teacherAndTeacherScore.setTeacherScore(teacherScore);
			}
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectTeacherAndTeacherScore != null) {
				try {
					rsSelectTeacherAndTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectTeacherAndTeacherScore != null) {
				try {
					pstmtSelectTeacherAndTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
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
		return teacherAndTeacherScore;
	}
	
	// teacher_score 테이블에 레코드를 추가하는 메서드
	// 매개변수로 TeacherScore 객체의 참조값을 전달 받는다. (폼으로 넘겨받은 값을 담은 객체이다.)
	// 리턴되는 데이터는 해당 쿼리로 인해 삽입된 레코드의 수 이다. 
	public int insertTeacherScore(TeacherScore teacherScore) {
		Connection conn = null;
		PreparedStatement pstmtInsertTeacherScore = null;
		
		// insertTeacherScoreAction.jsp로 부터 teacherScore 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, insertTeacherScoreAction => TeacherScoreDao.java " + teacherScore.getTeacherNo());
		System.out.println("teacherAddrContent, insertTeacherScoreAction => TeacherScoreDao.java " + teacherScore.getScore());
		
		// teacher_address 테이블에 레코드를 추가하는 쿼리
		String sqlInsertTeacherScore = "INSERT INTO teacher_score(teacher_no,score) VALUES(?, ?)";
		
		int result = 0;
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtInsertTeacherScore = conn.prepareStatement(sqlInsertTeacherScore);
			
			// ? 에 값 대입
			pstmtInsertTeacherScore.setInt(1, teacherScore.getTeacherNo());
			pstmtInsertTeacherScore.setInt(2, teacherScore.getScore());
			
			result = pstmtInsertTeacherScore.executeUpdate();
			
			// 해당 쿼리 실행 및 해당 쿼리로 인해 삽입 된 레코드 수 출력
			System.out.println("삽입된 레코드 수 : " + result);
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtInsertTeacherScore != null) {
				try {
					pstmtInsertTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
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
		return result;
	}
}
