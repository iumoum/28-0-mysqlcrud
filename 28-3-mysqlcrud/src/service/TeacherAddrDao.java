// 2018.06.26 김지완
package service;

import java.sql.*;
import service.*;

public class TeacherAddrDao {
	/*
	 * 	teacher_address 테이블
	 * 
	   CREATE TABLE `teacher_address` (
			`teacher_address_no` INT(11) NOT NULL AUTO_INCREMENT,
			`teacher_no` INT(11) NOT NULL,
			`teacher_address_content` VARCHAR(50) NOT NULL,
			PRIMARY KEY (`teacher_address_no`),
			INDEX `FK_teacher_address_teacher` (`teacher_no`),
			CONSTRAINT `FK_teacher_address_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
		)*/
	
	public TeacherAddr selectTeacherAddress(int teacherNo){
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherAddress = null;
		ResultSet rsSelectTeacherAddress = null;
		TeacherAddr teacherAddr = null;
		
		// teacherList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherList.jsp => TeacherAddrDao.java " + teacherNo);
		
		// teacher_address 테이블에 레코드를 추가하는 쿼리
		String sqlSelectTeacherAddress = "SELECT teacher_address_no, teacher_no,teacher_address_content FROM teacher_address WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectTeacherAddress = conn.prepareStatement(sqlSelectTeacherAddress);
			
			// ?에 값 대입
			pstmtSelectTeacherAddress.setInt(1, teacherNo);
			
			// 위의 쿼리 실행
			rsSelectTeacherAddress = pstmtSelectTeacherAddress.executeQuery();
			
			if(rsSelectTeacherAddress.next()) {
				// teacherAddr 객체 생성
				teacherAddr = new TeacherAddr();
				
				// teacherAddr 객체 내부 멤버변수에 조회된 데이터들을 각각 대입
				teacherAddr.setTeacherAddrNo(rsSelectTeacherAddress.getInt("teacher_address_no"));
				teacherAddr.setTeacherNo(rsSelectTeacherAddress.getInt("teacher_no"));
				teacherAddr.setTeacherAddrContent(rsSelectTeacherAddress.getString("teacher_address_content"));
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectTeacherAddress != null) {
				try {
					rsSelectTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectTeacherAddress != null) {
				try {
					pstmtSelectTeacherAddress.close();
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
		// teacherAddr 객체 참조값 반환
		return teacherAddr;
	}
	
	// teacher_address 테이블에 레코드를 추가하는 메서드
	// 매개변수로 TeacherAddr 객체의 참조값을 전달 받는다. (폼으로 넘겨받은 값을 담은 객체이다.)
	// 리턴 데이터 타입은 void
	public void insertTeacherAddress(TeacherAddr teacherAddr) {
		Connection conn = null;
		PreparedStatement pstmtInsertTeacherAddress = null;
		
		// insertTeacherAddrAction.jsp로 부터 teacherAddr 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, insertTeacherAddrAction => TeacherAddrDao.java " + teacherAddr.getTeacherNo());
		System.out.println("teacherAddrContent, insertTeacherAddrAction => TeacherAddrDao.java " + teacherAddr.getTeacherAddrContent());
		
		// teacher_address 테이블에 레코드를 추가하는 쿼리
		String sqlInsertTeacherAddress = "INSERT INTO teacher_address(teacher_no,teacher_address_content) VALUES(?, ?)";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtInsertTeacherAddress = conn.prepareStatement(sqlInsertTeacherAddress);
			
			// ? 에 값 대입
			pstmtInsertTeacherAddress.setInt(1, teacherAddr.getTeacherNo());
			pstmtInsertTeacherAddress.setString(2, teacherAddr.getTeacherAddrContent());
			
			// 해당 쿼리 실행 및 해당 쿼리로 인해 삽입 된 레코드 수 출력
			System.out.println("삽입된 레코드 수 : " + pstmtInsertTeacherAddress.executeUpdate());
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtInsertTeacherAddress != null) {
				try {
					pstmtInsertTeacherAddress.close();
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
	}
}
