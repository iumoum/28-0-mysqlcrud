package service;

import java.sql.*;
import java.util.ArrayList;

import service.*;

public class StudentScoreDao {
	
	public void updateStudentScore(int studentNo, int reScore) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("UPDATE student_score SET score=? where student_no=?");
			pstmt.setInt(1, reScore);
			pstmt.setInt(2, studentNo);
			
			pstmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	public StudentScore updateStudentScoreSelect(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		StudentScore studentScore = new StudentScore();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT * FROM student_score where student_no = ?");
			pstmt.setString(1, sendNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				studentScore.setStudentNo(rs.getInt("student_no"));
				studentScore.setScore(rs.getInt("score"));
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return studentScore;
	}
	
	// 리턴 타입은 String 리터 타입. studentScoreCheck 메서드 선언. 매개변수는 int 데이터 타입인 변수 sendNo을 선언.
	public String studentScoreCheck(int sendNo) {
		
		//초기값 설정.
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String scoreCheck = null;
		
		try {
			//드라이버 로딩.
			Class.forName("com.mysql.jdbc.Driver");
		
			//db연결 준비
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//db연결 준비 끝.
			
			//db연결 데이터가 있는 conn 객체 내부의 prepareStatement 메서드에 쿼리문 넣은 후, pstmt에 대입.
			pstmt = conn.prepareStatement("SELECT * FROM student_score where student_no = ?");
			pstmt.setInt(1, sendNo);
			
			//쿼리 실행.
			rs = pstmt.executeQuery();
			
			//테이블 데이터 빼오기. 만약 테이블 데이터 뺴오기(rs객체 내부의 next메서드)가 되면
			if(rs.next()) {
				//scoreCheck 변수에 "점수 있다" 대입.
				scoreCheck = "점수 있다";
			//아니면.
			}else {
				//scoreCheck 변수에 "점수 없다" 대입.
				scoreCheck = "점수 없다";
			}
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		//리턴 scoreCheck. 즉, 이프문에 따라 달라진 텍스트를 리턴.
		return scoreCheck;
	}
	
	//리턴 데이터 타입은 void. studentScoreTbDelete 메서드 선언. 매개변수는 String 데이터 타입으로 sendNo 선언.
	public void studentScoreTbDelete(String sendNo) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("DELETE FROM student_score WHERE student_no =?");
			pstmt.setString(1, sendNo);
			pstmt.executeUpdate();
		
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
	}
	
	//리턴 타입은 int. 메서드는 selectScoreAvg를 선언한다. 매개변수는 선언 X
	public int selectScoreAvg() {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int scoreAvg = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
	
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			//score 컬럼의 평균을 구하는 쿼리문.
			pstmt = conn.prepareStatement("select avg(score) from student_score");
			rs = pstmt.executeQuery();
			
		if(rs.next()) {
			//평균을 scoreAvg에 대입.
			scoreAvg = rs.getInt("avg(score)");
		
		}
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		//리턴 평균.
		return scoreAvg;
		
	}
	
	public int selectStudentListAboveAvgCount() {
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int avgCount = 0;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("select COUNT(*) AS student_whose_score_is_above_average FROM student_score WHERE score >= (select AVG(score) from student_score)");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				avgCount = rs.getInt("student_whose_score_is_above_average");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return avgCount;
		
	}
	
	//리턴 타입은 ArrayList<StudentScore>로 하고 selectStudentListAboveAvg 메서드를 선언.
	public ArrayList<StudentScore> selectStudentListAboveAvg(){
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		//ArrayList<StudentScore> 객체참조변수인 list에 주소값 할당.
		ArrayList<StudentScore> list = new ArrayList<StudentScore>();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			//평균을 넘는 컬럼만을 검색하는 쿼리문.
			pstmt = conn.prepareStatement("select student.student_no, student.student_name, student_score.score from "
					+ "student_score inner join student on student_score.student_no" + 
					"= student.student_no where student_score.score >= (select avg(score) from student_score) order by student_score.score DESC");
			//쿼리 실행.
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StudentScore sc = new StudentScore();
				sc.setStudentNo(rs.getInt("student.student_no"));
				sc.setStudentName(rs.getString("student.student_name"));
				sc.setScore(rs.getInt("student_score.score"));
				
				//각각의 값들이 세팅된 dto 주소값들에 순서대로 인덱스 번호를 부여한다.
				list.add(sc);
			}
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		//리턴 dto 주소값(+index num).
		return list;
		
	}
	
	//리턴 타입은 StudentScore 클래스 리턴 타입으로하고 메서드는 insertStudentScore로 선언.매개변수는 StudentScore 클래스 데이터 타입인 sc로 선언.
	public StudentScore insertStudentScore(StudentScore sc) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("INSERT INTO student_score(student_no, score) VALUES(?, ?)");
			pstmt.setInt(1, sc.getStudentNo());
			pstmt.setInt(2, sc.getScore());
			
			pstmt.executeUpdate();
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		
		return sc;
	}
	
	
	public ArrayList<StudentScore> studentScore(String sendNo){
		
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<StudentScore> list = new ArrayList<StudentScore>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev2?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			
			pstmt = conn.prepareStatement("select * from student s inner join student_score sc on s.student_no = sc.student_no where s.student_no = ?");
			pstmt.setString(1, sendNo);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				StudentScore studentScore = new StudentScore();
				studentScore.setStudentNo(rs.getInt("student_no"));
				studentScore.setStudentName(rs.getString("student_name"));
				studentScore.setStudentScoreNo(rs.getInt("student_score_no"));
				studentScore.setScore(rs.getInt("score"));
				list.add(studentScore);
			}else {
				StudentScore studentScore = new StudentScore();
				studentScore.setScoreCheck("점수 정보 없다");
				list.add(studentScore);
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException e) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if (conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return list;
	}
}	
