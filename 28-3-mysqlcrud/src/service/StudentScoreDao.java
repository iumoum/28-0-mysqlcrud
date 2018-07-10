package service;

import java.sql.*;
import java.util.ArrayList;

import service.*;

public class StudentScoreDao {
	
	public int selectScoreAvg() {
		
		
		return 0;
		
	}
	
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(){
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
		
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//pstmt = conn.prepareStatement(arg0);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				//
			}
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	public StudentScore insertStudentScore(StudentScore sc) {
		Connection conn =null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			
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
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/mysqlcrud?useUnicode=true&characterEncoding=euckr";
			String dbUser = "sqlidkjy";
			String dbPass = "sqlpwkjy";
			
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
